extends Area2D

func _ready():
	pass # Replace with function body.

func _process(delta):
	pass

func _on_body_entered(body):
	if body.name == "Player": ## Se o corpo que entrou tiver o nome player
		print("pegou timer")
		Global.relogio += 5
		await $CollisionShape2D.call_deferred("queue_free")
		print(Global.relogio)
		$AnimatedSprite2D.play("coletado") ## Roda a animação de coletado
		await $AnimatedSprite2D.animation_finished ## Espera a animação terminar
		queue_free() ## Libera o sprite
