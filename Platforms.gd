extends TileMap


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Player_platform():
	$StaticBody2D/Platform1.disabled = true
	$StaticBody2D/Platform2.disabled = true
	$StaticBody2D/Platform3.disabled = true
	$StaticBody2D/Platform4.disabled = true
	$StaticBody2D/Platform5.disabled = true
	$StaticBody2D/Platform6.disabled = true
	


func _on_Timer_timeout():
	$StaticBody2D/Platform1.disabled = false
	$StaticBody2D/Platform2.disabled = false
	$StaticBody2D/Platform3.disabled = false
	$StaticBody2D/Platform4.disabled = false
	$StaticBody2D/Platform5.disabled = false
	$StaticBody2D/Platform6.disabled = false
