extends Area2D

@onready var Player = $"../Player"

func _on_body_entered(body):
	if body.name == "Player": ## Se o corpo que entrou tiver o nome player
		print("Levou dano?")
		Player._levouDano()

