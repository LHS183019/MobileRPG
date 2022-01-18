extends Panel

onready var HP_label = $HBoxContainer/HP
onready var AP_label = $HBoxContainer/AP
onready var MP_label = $HBoxContainer/MP


func _on_PlayStats_hp_change(new_hp) -> void:
	HP_label.text = "HP\n" + str(new_hp)


func _on_PlayStats_ap_change(new_ap) -> void:
	AP_label.text = "AP\n" + str(new_ap)


func _on_PlayStats_mp_change(new_mp) -> void:
	MP_label.text = "MP\n" + str(new_mp)
