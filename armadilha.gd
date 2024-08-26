extends Area2D

@onready var player = $"../../player"



func _on_body_entered(body):
	if body.name == "player":
		print("Levou dano?")
		player._LevouDano(1) 
		

