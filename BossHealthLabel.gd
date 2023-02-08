extends Label

var health = 7

signal boss_death
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$".".hide()
func _process(delta):
	$".".text = "Boss Health: " + str(health)
	if (health <= 0):
		self.queue_free()
		emit_signal("boss_death")
		
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_BossTriggerArea_area_entered(area):
	$".".show()


func _on_Boss_boss_damage():
	health = health - 1 
