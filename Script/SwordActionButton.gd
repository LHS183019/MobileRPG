extends "res://Script/ActionButton.gd"

const Slash = preload("res://Slash.tscn")

func create_slash(position):
	var slash = Slash.instance()
	main.add_child(slash)
	slash.global_position = position

func _process(delta: float) -> void:
	update_discription()


func _on_pressed() -> void:
	var enemy = BattleUnits.Enemy
	var player = BattleUnits.Player
	if enemy!=null and player!=null:
		enemy.take_damage(player.STR)
		create_slash(enemy.global_position)
		player.mp += 2
		player.ap -= 1


func update_discription():
	get_node("HoverInfo").description = "Sword:\nDeals " + str(player.STR) + " demage. "
