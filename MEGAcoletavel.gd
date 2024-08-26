extends Area2D

var pontos = 3

func _on_body_entered(body):
	if body.name == "player": # Replace with function body.
		$AnimatedSprite2D.play("colect")
		await $AnimatedSprite2D.animation_finished
		queue_free()
		Global.pontos += pontos
		print(Global.pontos)
