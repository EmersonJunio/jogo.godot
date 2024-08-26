extends Area2D

@onready var player = $"../../player"


func _on_body_entered(body):
	if body.name == "player":
		player._Dash()
# Called when the node enters the scene tree for the first time.

