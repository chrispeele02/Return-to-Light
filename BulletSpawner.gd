extends Node2D

export var _bullet_scene: PackedScene

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Timer_timeout():
	var new_bullet = _bullet_scene.instance() as Node2D
	
	#new_bullet.position.x += 20
	self.add_child(new_bullet)
	


func _on_Player_boss_start():
	$Timer.start()


func _on_PlayerArea_area_entered(area):
	Gamestate.life_lost()
	
