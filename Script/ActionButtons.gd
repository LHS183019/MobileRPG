extends GridContainer


# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"
var BattleUnits = preload("res://battleUnits.tres")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var Playstat = BattleUnits.Player
	for skill in Playstat.learned_skill.keys():
		var name:String = "res://"+skill+"ActionButton.tscn"
		var button = load(name).instance()
		self.add_child(button)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	pass
