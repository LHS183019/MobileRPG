extends Node

const BattleUnits = preload("res://battleUnits.tres") 

var STR = 4
var LV = 1
var skillpoint = 0

var MAXHP = 25
var MAXAP = 3
var MAXMP = 10
var MAXEXP = 10

var EXP = 0 setget set_exp
var hp=MAXHP setget set_hp
var mp=MAXMP setget set_mp
var ap=MAXAP setget set_ap
var learned_skill = {"Sword":1,"Heal":1}
var skill_library = ["Strengthen","Shield"]

signal hp_change(new_hp)
signal ap_change(new_ap)
signal mp_change(new_mp)
signal turn_end
signal game_over
signal game_continue

func ap_runout():
	return ap<=0
func hp_runout():
	return hp<=0

func set_hp(value):
	hp = clamp(value,0,MAXHP)
	emit_signal("hp_change", hp)
	if hp_runout():
		emit_signal("game_over")
	else:
		emit_signal("game_continue")
	
func set_ap(value):
	ap = clamp(value,0,MAXAP)
	emit_signal("ap_change", ap)
	if ap_runout():
		emit_signal("turn_end")
	
func set_mp(value):
	mp = clamp(value,0,MAXMP)
	emit_signal("mp_change", mp)
	if ap == 0:
		emit_signal("turn_end")

func set_exp(value):
	EXP += value
	if(EXP >= MAXEXP):
		EXP = EXP-MAXEXP
		upgrate()

func upgrate():
	self.LV += 1
	self.MAXEXP *= 2
	self.skillpoint += 1

func _ready() -> void:
	BattleUnits.Player = self
	
func _exit_tree() -> void:
	BattleUnits.Player = null

func _after_nextroombutton_pressed() -> void:
	emit_signal("turn_end")
