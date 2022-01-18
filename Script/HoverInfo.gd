extends Control

export (String, MULTILINE) var description = ""


func _on_HoverInfo_mouse_entered() -> void:
	var main = get_tree().current_scene
	var DiscriptionBox = main.find_node("Discription")
	if DiscriptionBox != null:
		DiscriptionBox.text = description

func _on_HoverInfo_mouse_exited() -> void:
	var main = get_tree().current_scene
	var DiscriptionBox = main.find_node("Discription")
	if DiscriptionBox != null:
		DiscriptionBox.text = ""
