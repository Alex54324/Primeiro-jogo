extends Area2D
var pontos = 1


func _on_body_entered(body):
	
	if body.name == "Player": ## Se o corpo que entrou tiver o nome player
		Global.pontos += pontos
		print(Global.pontos)
		await $CollisionShape2D.call_deferred("queue_free")
		$AnimatedSprite2D.play("coletado") ## Roda a animação de coletado
		await $AnimatedSprite2D.animation_finished ## Espera a animação terminar
		queue_free() ## Libera o sprite
	pass # Replace with function body.
