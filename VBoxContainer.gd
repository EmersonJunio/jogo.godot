extends VBoxContainer

func _ready():
	visible = false

func _on_quit_bt_pressed():
	get_tree().quit()


func _on_reiniciar_bt_pressed():
	get_tree().pause = false
	get_tree().change_scene_to_file("res://level.tscn")#mudar


func _on_voltar_bt_pressed():
	get_tree().pause = false
	visible = false

func _unhandled_input(event):
	if event.is_action_pressed("ui_cancel"):
		visible = true 
		get_tree().paused = true 


func _on_pause_bt_pressed():
	get_tree().paused = false
	visible = false
