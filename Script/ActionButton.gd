extends Button

const BattleUnits = preload("res://battleUnits.tres")

onready var main = get_tree().current_scene
onready var enemy = BattleUnits.Enemy
onready var player = BattleUnits.Player
var last = null

func _on_pressed() -> void:
	pass
