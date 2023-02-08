extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


func _process(delta):
	position.x += -10
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass




func _on_Area2D_area_entered(area):
	self.queue_free()
	if (area == get_node("/root/Player")):
		Gamestate.life_lost()
		print("player")
