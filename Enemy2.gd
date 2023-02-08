extends Node2D

var direction = 1
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

func _process(delta):
	position.x += 200 * delta * direction
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Timer_timeout():
	direction = direction * -1

func _on_WeaponArea_area_entered(area):
	if (area == get_node("Enemy2Area")):
		self.queue_free()
