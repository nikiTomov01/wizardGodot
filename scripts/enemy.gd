extends CharacterBody2D


@export var move_speed := 100.0
@export var health := 3
@onready var hpBar = $healhBar

var wizard: Node2D

func _ready():
	wizard = get_tree().get_first_node_in_group("wizard")
	print(wizard)

func _physics_process(delta: float) -> void:
	if wizard == null:
		return
	var direction = (wizard.global_position - global_position).normalized()
	
	velocity = direction * move_speed
	move_and_slide()

#func take_damage(damage: int):
	#health -= damage
	#
	#if health <= 0:
		#queue_free()
		
func updateStatus(dmg: int):
	hpBar.take_damage(dmg)
