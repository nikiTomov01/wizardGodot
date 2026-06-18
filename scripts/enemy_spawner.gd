extends Node2D

@export var enemyList : Array[PackedScene]
@export var spawn_radius := 600.0

var player : CharacterBody2D

var enemyScene : PackedScene = preload("res://scenes/enemy_64.tscn")
var enemyScene32 : PackedScene = preload("res://scenes/enemy_32.tscn")

var enemyTypes = [64, 32]

var enemyStats : Array[EnemyStats] = [
	preload("res://scenes/enemyResources/skeleton.tres")
]

var enemyStats32 : Array[EnemyStats] = [
	preload("res://scenes/enemyResources/slime.tres")
]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	player = get_tree().get_first_node_in_group("wizard")

func spawn_enemy():
	if player == null:
		return false
		
	var enemyType = enemyTypes.pick_random()
	var spawnedEnemy : Enemy
	
	if enemyType == 64:
		spawnedEnemy = enemyScene.instantiate()
		spawnedEnemy.stats = enemyStats.pick_random()
	else:
		spawnedEnemy = enemyScene32.instantiate()
		spawnedEnemy.stats = enemyStats32.pick_random()
	
	var angle = randf() * TAU
	var offset = Vector2.RIGHT.rotated(angle) * spawn_radius
	spawnedEnemy.global_position = player.global_position + offset
	
	get_parent().add_child(spawnedEnemy)
	#var enemy = enemyStats.pick_random().instantiate()
	#
	#enemy.global_position = player.global_position + offset
	#
	#get_parent().add_child(enemy)
