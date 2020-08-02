extends KinematicBody2D

export var PlayerMoveSpeed = 400
export var PlayerJumpVelocity = -1000
export var PlayerGravity = 30
export var PlayerWinCoinAmmount = 5

var velocity = Vector2(0,0)
var coins = 0

func _physics_process(delta): #this runs 60 tps because of delta
	#Walk Right
	if Input.is_action_pressed("Movement_Right"):
		velocity.x = PlayerMoveSpeed
		$Sprite.play("Walk")
		$Sprite.flip_h = false
	#Walk Left
	elif Input.is_action_pressed("Movement_Left"):
		velocity.x = -PlayerMoveSpeed
		$Sprite.play("Walk")
		$Sprite.flip_h = true
	#Idle Animation
	else:
		$Sprite.play("Idle")
	#In Air Animation
	if not is_on_floor():
		$Sprite.play("Air")
	#Jump
	if Input.is_action_just_pressed("Movement_Up-Jump") and is_on_floor():
		velocity.y = PlayerJumpVelocity
	velocity.y = velocity.y + PlayerGravity
	
	velocity = move_and_slide(velocity,Vector2.UP)
	
	#print(velocity.y)
	
	velocity.x = lerp(velocity.x,0,0.1)


func _on_Area2D_body_entered(body):
	get_tree().change_scene("res://Level1.tscn")
	
func add_coin():
	coins = coins + 1
	if coins == PlayerWinCoinAmmount:
		get_tree().change_scene("res://Level1.tscn")
