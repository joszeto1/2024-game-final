extends Area2D


func _on_area_entered(area):
	get_tree().paused = true
	$WinScreen.visible = true
