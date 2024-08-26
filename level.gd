extends Node2D

@onready var Player = $Player


func _ready():
	Player.morreu.connect(resetGame)
	Global.pontos = 0

func resetGame():
	get_tree().change_scene_to_file("res://o/GameOver.tscn")



