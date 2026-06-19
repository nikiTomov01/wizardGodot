extends Node2D

signal waveChanged

@export var wave := 1
@export var enemyList := []
@export var spawn_interval := 2.0

@onready var enemySpawnTimer = $enemySpawnTimer

var enemyInWave = (wave * 4) - 1

var enemySpawner : Node2D
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	enemySpawner = get_tree().get_first_node_in_group("enemySpawner")
	
	#var timer = Timer.new()
	#timer.wait_time = spawn_interval
	#timer.autostart = true
	#timer.timeout.connect(createWave)
	#add_child(timer)s
	
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_accept"):
		createWave()

func createWave() -> void:
	waveChanged.emit(wave)
	for enemy in enemyInWave:
		enemySpawner.spawn_enemy()
		enemyInWave -= 1
		if enemyInWave <= 0:
			wave += 1
			print("WAVE OVER")
			enemyInWave = (wave * 4) - 1
		await get_tree().create_timer(2).timeout
