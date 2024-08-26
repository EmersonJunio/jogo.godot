extends Node2D

@onready var player = $player
@onready var pause_menu = $Pause_Menu

func _ready():
	player.dead.connect(resetGame)


func resetGame():#corrigir
	get_tree().reload_current_scene()
	Global.pontos = 0
