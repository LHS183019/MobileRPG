extends Node

func _ready() -> void:
	pt_start()

var mhp = 10

func pt_start():
	print("It is pt")
	mhp-=1
	yield(get_tree().create_timer(0.5),"timeout")
	mt_start()
	
func mt_start():
	print("It is mt")
	if mhp == 0:
		print("m dies")
	else:
		yield(get_tree().create_timer(0.5),"timeout")
		pt_start()
