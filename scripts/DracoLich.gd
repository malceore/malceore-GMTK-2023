extends Node2D

func TakeDamage():
	$AnimationPlayer.play("damaged")
	$DamageParticle.set_emitting(true)
