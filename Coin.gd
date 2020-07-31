class_name Coin
extends Area2D	

#onready var SteveNode = get_node("res://reapersremorse/assets/Characters/Steve.gd")

func _on_Coin_body_entered(body):
	$AnimationPlayer.play("Coin_Bounce")
	#SteveNode.add_coin()
	#body.add_coin()
	#print(body.add_coin)
	
func _on_AnimationPlayer_animation_finished(_anim_name):
	queue_free()
