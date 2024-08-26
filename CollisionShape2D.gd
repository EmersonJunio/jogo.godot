extends CollisionShape2D


@onready var player = $"../../player"



func _on_body_entered(body):
	if body.name == "player":
		emit_signal("dead")
