extends KinematicBody2D

export var _speed:  = 50
export var _gravity = 15
export var _jump_height = 500

signal platform
signal boss_start

var can_jump = false
var direction = true
var life = true

var movement_vector: Vector2

func _physics_process(delta):
	movement_vector.y += _gravity
	if Input.is_action_pressed("move right"):
		movement_vector.x += _speed
		direction = true
	if Input.is_action_pressed("move left"):
		movement_vector.x += -_speed
		direction = false
	if Input.is_action_just_pressed("jump") && can_jump && is_on_wall():
		movement_vector.y = -_jump_height
		can_jump = false
	if Input.is_action_just_pressed("attack"):
		if $Weapon/WeaponSprite != null:
			$Weapon/WeaponSprite.visible = true
			$Weapon/WeaponArea/WeaponCollision.disabled = false
	if Input.is_action_just_pressed("drop"):
		emit_signal("platform")
	if Input.is_action_just_pressed("dash"):
		if (direction):
			movement_vector.x += 30 * _speed
		else:
			movement_vector.x -= 30 * _speed

		
	move_and_slide(movement_vector)
	
	movement_vector.x = lerp(movement_vector.x, 0, 0.2)


func _on_Timer_timeout():
	can_jump = true
	$Weapon/WeaponSprite.visible = false
	$Weapon/WeaponArea/WeaponCollision.disabled = true



func _on_WeaponSprite_ready():
	$Weapon/WeaponSprite.visible = false
	if Input.is_action_just_pressed("attack"):
		$Weapon/WeaponSprite.visible = true

func _on_WeaponCollision_ready():
	$Weapon/WeaponArea/WeaponCollision.disabled = true


func _on_EnemyArea_area_entered(area):
	if (area == get_node("PlayerArea")):
		pass
		#emit_signal("life_lost")
		#Gamestate.life_lost()


func _on_Area2D_area_entered(area):
	movement_vector.y = -500
	movement_vector.x = -3000
	#emit_signal("life_lost")
	#Gamestate.life_lost()


func _on_EndArea_area_entered(area):
	get_tree().change_scene("res://GameOver.tscn")




func _on_BossArea_area_entered(area):
	if (area == get_node("PlayerArea")):
		#emit_signal("life_lost")
		Gamestate.life_lost()


func _on_BossTriggerArea_area_entered(area):
	if (area == get_node("PlayerArea")):
		if (life) :
			Gamestate.lives += 1
			
		
	emit_signal("boss_start")
