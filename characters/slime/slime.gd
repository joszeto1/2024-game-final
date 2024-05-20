extends Node2D

@onready var animated_sprite_2d = $AnimatedSprite2D

func play_walk():
	$AnimatedSprite2D.play("walk")


func play_hurt():
	$AnimatedSprite2D.play("hurt")
	
