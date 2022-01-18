extends "res://Script/ActionButton.gd"


# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"
# Called when the node enters the scene tree for the first time.

var cost = 10
const MAXLAST = 2

func enougn_mp():
	return player.mp >= cost

func _process(delta):
	if enougn_mp():
		self.disabled = false
	else:
		self.disabled = true
		
func _on_pressed():
	self.last = MAXLAST
	var Player = BattleUnits.Player
	Player.STR += 3
	Player.ap -= 1
	Player.mp -= self.cost
	
func disactive():
	var Player = BattleUnits.Player
	Player.STR -= 3
	self.last = null
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	pass
