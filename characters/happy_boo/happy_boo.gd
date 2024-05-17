extends Node2D

@onready var animated_sprite_2d = $AnimatedSprite2D


func play_idle_animation():
	animated_sprite_2d.play("flameidle")


func play_walk_animation():
	animated_sprite_2d.play("flamewalk")
