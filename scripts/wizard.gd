extends CharacterBody2D

@export var max_health := 5
var current_heatlh := max_health

@onready var exp = $Exp

@export var speed := 350.0
@export var attack_speed := 1.0
@export var bullet_count := 1

var bullet_scene = preload("res://scenes/bullet.tscn")

func _ready() -> void:
	exp.level_up.connect(_on_level_up)
	
func add_exp(amount: int):
	exp.add_exp(amount)

func _on_level_up(level):
	print("Leveled up!", level)
	
func _on_death():
	queue_free()

func _enter_tree():
	update_attack_speed()

func _physics_process(delta: float):
	var direction = Vector2.ZERO
	
	direction.x = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	direction.y = Input.get_action_strength("move_down") - Input.get_action_strength("move_up")

	direction.normalized()
	
	velocity = direction * speed
	
	move_and_slide()

func _on_timer_timeout():
	for bullet_idx in bullet_count:
		var bullet = bullet_scene.instantiate()
		
		bullet.global_position = $Muzzle.global_position
		
		var mouse_pos = get_global_mouse_position()
		var direction = (mouse_pos - global_position).normalized()
		
		bullet.direction = direction
		bullet.rotation = direction.angle() + PI / 2
		
		
		get_tree().current_scene.add_child(bullet)
		await get_tree().create_timer(0.3).timeout

func update_attack_speed():
	$Timer.wait_time = 1.0 / attack_speed
