extends Area2D

var ponto = 1

func _on_body_exited(body):
	if body.name == "player": # Replace with function body.
		$AnimatedSprite2D.play("colect")
		await $AnimatedSprite2D.animation_finished
		queue_free()
		Global.pontos += ponto
		print(Global.pontos)
