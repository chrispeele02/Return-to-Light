extends Node

var lives: int = 5
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

func life_lost() -> void:
	lives -= 1
	if (lives <= 0):
		get_tree().change_scene("res://GameOver.tscn")
	
func get_lives() -> int:
	return lives
