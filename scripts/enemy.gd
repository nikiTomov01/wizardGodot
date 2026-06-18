extends CharacterBody2D

@export var move_speed := 420.0
@onready var health = $Health

@export var exp_orb_scene: PackedScene

var wizard: Node2D

func _ready():
	wizard = get_tree().get_first_node_in_group("wizard")
	
	health.depleted.connect(_on_death)
	
func _on_death():
	var orb = exp_orb_scene.instantiate()
	orb.global_position = global_position
	get_tree().current_scene.add_child(orb)
	
	queue_free()

func _physics_process(delta: float) -> void:
	if wizard == null:
		return
	var direction = (wizard.global_position - global_position).normalized()
	
	velocity = direction * move_speed
	move_and_slide()

func take_damage(damage: int):
	health.remove(damage)
