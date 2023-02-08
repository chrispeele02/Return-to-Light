extends Node2D

signal boss_damage

var start_move = false
var counter = 0
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
func _process(delta):
	if (start_move):
		if (counter < 2):
			self.position.y = self.position.y - 1 
		if (counter > 2 && counter < 5) :
			self.position.y = self.position.y + 1
		if (counter > 5) :
			counter = 0
			

# Called when the node enters the scene tree for the first time.
func _ready():
	start_move = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Player_boss_start():
	$Timer.start()
	start_move = true


func _on_Timer_timeout():
	counter = counter + 1

func _on_WeaponArea_area_entered(area):
	if (area == get_node("BossArea")) :
		emit_signal("boss_damage")


func _on_BossHealthLabel_boss_death():
	self.queue_free()
