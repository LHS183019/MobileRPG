extends Node2D

const BattleUnits = preload("res://battleUnits.tres")

export(int) var hp = 25 setget set_hp
export(int) var STR = 4


onready var HP_Label = $HPlabel
onready var animation = $AnimationPlayer 

signal died
signal turn_end

func set_hp(new_hp):
	hp = new_hp
	if HP_Label != null:
		HP_Label.text = str(hp)+"hp"
	
func _ready() -> void:
	BattleUnits.Enemy = self


func _exit_tree() -> void:
	BattleUnits.Enemy = null
	
func is_dead():
	return hp <= 0

func attack_to():
	yield(get_tree().create_timer(0.35),"timeout")
	animation.play("Attack")
	yield(animation,"animation_finished")
	emit_signal("turn_end")

func deal_damage():
	BattleUnits.Player.hp -= self.STR
	
func take_damage(amount):
	self.hp -= amount
	if hp <= 0:
		emit_signal("died")
		queue_free()
	else:	
		animation.play("Shake")
