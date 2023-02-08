extends Label

var lives
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _process(delta):
	lives = Gamestate.get_lives()
	$".".text = "Lives: " + str(lives)
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


#func _on_Player_life_lost():
#	Gamestate.life_lost()
#	lives = Gamestate.get_lives()
#	if (lives <= 0):
#		get_tree().change_scene("res://GameOver.tscn")
		
