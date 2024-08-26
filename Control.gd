extends Control

@onready var timer_count = $MarginContainer/HBoxContainer/timer_count as Label
@onready var contador_melons = $MarginContainer/pontos_contador/contador_melons as Label
@onready var timer_cont = $timer_cont as Timer

signal tempo_acabou

var minutos = 0
var segundos = 0


@export_range(0,2) var min_padrao = 1
@export_range(0,59) var seg_padrao = 0

func _ready():
	contador_melons.text = str("%02d" % Global.pontos)
	timer_count.text = str("%02d" % min_padrao) + ":" + str("%02d" % seg_padrao)
	
	minutos = min_padrao
	segundos = seg_padrao
	
	
func _process(delta):
	contador_melons.text = str("%02d" % Global.pontos)
	#ajustar
	if Global.Segundos != 0:
		segundos += Global.Segundos
		Global.Segundos -= Global.Segundos
		


func _on_timer_cont_timeout():
	if segundos >=60:
		segundos %= 60
		minutos +=1
	
	if segundos == 0:
		if minutos > 0:
			minutos -=1
			segundos = 60
		
	
	segundos -=1	
	timer_count.text = str("%02d" % minutos) + ":" + str("%02d" % segundos)
	
	
	
#segundos += Global.Segundos

