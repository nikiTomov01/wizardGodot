class_name Enemy
extends CharacterBody2D

@export var stats : EnemyStats

@export var maxHealth: float
@export var speed: float
@onready var sprite = $Sprite2D
@onready var health = $Health

var wizard: Node2D

func _ready() -> void:
	wizard = get_tree().get_first_node_in_group("wizard")
	maxHealth = stats.maxHealth
	speed = stats.speed
	sprite.texture = stats.texture
	health.current_value = stats.maxHealth
	
	health.depleted.connect(_on_death)

func _physics_process(delta: float) -> void:
	var direction = (wizard.global_position - global_position).normalized()
	
	velocity = direction * speed
	move_and_slide()
	
func _on_death():
	# Logic for item drops here
	
	queue_free()

func take_damage(damage: int):
	health.remove(damage)
