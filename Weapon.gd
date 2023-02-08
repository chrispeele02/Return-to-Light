extends Area2D


# Declare member variables here. Examples:
# var a = 2

func _on_ready():
	get_node("WeaponCollision").disabled = true
	get_node("WeaponSprite").visible = false
	print("test")

# Called when the node enters the scene tree for the first time.
func _ready():
	print("test")
	
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
