extends Node2D

@export var wave := 1
@export var enemyList := []
@export var spawn_interval := 2.0

var enemySpawner : Node2D
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	enemySpawner = get_tree().get_first_node_in_group("enemySpawner")
	
	var timer = Timer.new()
	timer.wait_time = spawn_interval
	timer.autostart = true
	timer.timeout.connect(createWave)
	add_child(timer)

func createWave() -> void:
		enemySpawner.spawn_enemy()
