extends Node

const BattleUnits = preload("res://battleUnits.tres")
export(Array,PackedScene) var enemies = []

onready var ActionTable = $UI/ActionButtons
onready var EnemyPosition = $EnemyPosition
onready var NextRoomButton = $UI/CenterContainer/NextRoomButton
onready var animation = $AnimationPlayer

signal after_nextroombutton_pressed
signal new_monster_created

func _ready() -> void:
	randomize()
	NextRoomButton.hide()
	var Enemy = BattleUnits.Enemy
	if Enemy != null:
		Enemy.connect("died",self,"_on_Enemy_died")
	player_turn_start()
	
func player_skills_cd_check():
	for button in ActionTable.get_children():
		if button.last != null and button.last > 0:
			button.last -= 1
			if button.last <= 0:
				button.disactive()

func player_turn_start():
	var Enemy = BattleUnits.Enemy
	print("player_turn_start")
	var Playstat = BattleUnits.Player
	ActionTable.show()
	player_skills_cd_check()
	Playstat.ap = Playstat.MAXAP
	yield(Playstat,"turn_end")
	enemy_turn_start()
	
	
func enemy_turn_start():
	print("enemy_turn_start")
	var Enemy = BattleUnits.Enemy
	var Playstat = BattleUnits.Player
	ActionTable.hide()
	if Enemy != null and not Enemy.is_queued_for_deletion():
		Enemy.attack_to()
		yield(Playstat,"game_continue")
		yield(Enemy,"turn_end")
	else:
		yield(self,"new_monster_created")
	player_turn_start()

func create_enemy():
	enemies.shuffle()
	var Enemy = enemies.front()
	var New_enemy = Enemy.instance()
	New_enemy.connect("died",self,"_on_Enemy_died")
	EnemyPosition.add_child(New_enemy)
	emit_signal("new_monster_created")


func _on_Enemy_died() -> void:
	print("enemy_died")
	ActionTable.hide()
	NextRoomButton.show()

func _on_NextRoomButton_pressed() -> void:
	NextRoomButton.hide()
	animation.play("FadeToNewRoom")
	yield(animation,"animation_finished")
	emit_signal("after_nextroombutton_pressed")
	create_enemy()
	for button in ActionTable.get_children():
		if button.last != null and button.last > 0:
			button.disactive()

func _on_game_over() -> void:
	ActionTable.hide()
	var discriptionBox = $UI/TextPanel/Discription
	discriptionBox.text = "GAME OVER"
