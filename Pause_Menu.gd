extends CanvasLayer


var game_paused = false


func _ready():
	visible = false


func _unhandled_input(event):
	if event.is_action_pressed("pause"):
		get_tree().paused = true
		visible = true 


func _on_reiniciar_bt_pressed():
	get_tree().paused = false
	get_tree().reload_current_scene()
	Global.pontos = 0
	visible = false


func _on_voltar_bt_pressed():
	get_tree().paused = false
	visible = false

func _on_quit_bt_pressed():
	get_tree().quit()
