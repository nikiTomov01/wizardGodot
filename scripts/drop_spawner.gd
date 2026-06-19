extends Node2D

@export var exp_gem_scene: PackedScene

func _on_enemy_died(enemy):
	# 50% chance to drop
	if randf() <= 0.5:
		var gem = exp_gem_scene.instantiate()
		gem.global_position = enemy.global_position
		add_child(gem)
