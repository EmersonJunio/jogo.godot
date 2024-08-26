extends Area2D

@onready var timer_count = $"../../HUD/Control/MarginContainer/HBoxContainer/timer_count"

var Segundos = 5

func _on_body_entered(body):
	if body.name == "player": # Replace with function body.
		Global.Segundos += Segundos
		$AnimatedSprite2D.play("colect")
		await $AnimatedSprite2D.animation_finished
		queue_free()	
		print(Global.Segundos)


