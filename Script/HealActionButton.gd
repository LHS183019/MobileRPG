extends "res://Script/ActionButton.gd"

var cost = 10


func enougn_mp():
	return player.mp >= cost

func _process(delta):
	update_discription()
	if enougn_mp():
		self.disabled = false
	else:
		self.disabled = true

func _on_pressed() -> void:	
	var player = BattleUnits.Player
	player.hp += 5
	player.mp -= 10
	player.ap -= 1

func update_discription():
	get_node("HoverInfo").description = "Heal:\nHeals " + "5" + " hp. "
