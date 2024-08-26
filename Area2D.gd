extends Area2D


# Called when the node enters the scene tree for the first time.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _on_body_entered(body):
	if body.name == "player": ## Se o corpo que entrou tiver o nome player
		$AnimatedSprite2D.play("coletado") ## Roda a animação de coletado
		await $AnimatedSprite2D.animation_finished ## Espera a animação terminar
		queue_free() ## Libera o sprite
