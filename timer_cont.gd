extends Timer

@onready var timer_cont = $"../MarginContainer/HBoxContainer/timer_cont"
@onready var contador_melons = $"../MarginContainer/pontos_contador/contador_melons"
@onready var timer = $timer_cont as Timer

signal tempo_acabou()

var minutos = 0
var segundos = 0


@export_range(0,2) var min_padrao = 1
@export_range(0,59) var seg_padrao = 0


func _ready():
	contador_melons.text = str("%03d" % Global.pontos)
	
	timer_cont.text = str("%02d" % min_padrao) + ":" + str("%02d" % seg_padrao)
	
	minutos = min_padrao
	segundos = seg_padrao
	
func _process(delta):
	contador_melons.text = str("%03d" % Global.pontos)	
	if minutos ==0 && segundos == 0:
		emit_signal ("tempo_acabou")
		
		
func _on_timer_cont_timeout():
	if segundos == 0:
		if minutos > 0:
			minutos -=1
			segundos = 60
	segundos -=1

	timer_cont.tex = str("02%" % minutos) + ":" + str("%02d" % segundos)
