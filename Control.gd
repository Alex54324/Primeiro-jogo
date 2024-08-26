extends Control

@onready var item_cont = $MarginContainer/pontos_contador/item_cont
@onready var timer_count = $MarginContainer/HBoxContainer2/timer_count as Label
@onready var timer = $timer_count as Timer

signal tempo_acabou()

var minutos = 0
var segundos = 0

@export_range(0,2) var min_padrao = 1 
@export_range(0,59) var seg_padrao = 0 


func _ready():
	
	item_cont.text = str("%03d" % Global.pontos)
	
	timer_count.text = str("%02d" % min_padrao) + ":" + str("%02d" % seg_padrao)
	
	minutos = min_padrao
	segundos = seg_padrao

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	item_cont.text = str("%03d" % Global.pontos)
	if minutos == 0 && segundos == 0:
		emit_signal("tempo_acabou")
		
	if Global.relogio != 0:
		segundos += Global.relogio
		print(segundos)
		Global.relogio -= Global.relogio
		print(Global.relogio)


func _on_timer_timeout():
	if segundos == 0:
		if minutos >0:
			minutos -=1
			segundos = 60
			
	segundos -=1
	
	timer_count.text = str("%02d" % minutos) + ":" + str("%02d" % segundos)
	
	
