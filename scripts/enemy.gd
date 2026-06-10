extends CharacterBody2D

@export var move_speed := 100.0
@onready var health = $Health

@export var exp_reward := 5

var wizard: Node2D

func _ready():
	wizard = get_tree().get_first_node_in_group("wizard")
	
	health.depleted.connect(_on_death)
	
func _on_death():
	if wizard:
		wizard.add_exp(exp_reward)
	queue_free()

func _physics_process(delta: float) -> void:
	if wizard == null:
		return
	var direction = (wizard.global_position - global_position).normalized()
	
	velocity = direction * move_speed
	move_and_slide()

func take_damage(damage: int):
	health.remove(damage)
