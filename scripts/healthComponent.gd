extends Control

signal health_changed(curr_hp, max_hp)
signal died

@onready var bar = $ProgressBar

@export var max_hp := 3
var curr_hp = max_hp

func _ready():
	bar.max_value = max_hp
	bar.value = max_hp

func take_damage(amount: int):
	curr_hp -= amount
	bar.value = curr_hp

	health_changed.emit(curr_hp, max_hp)

	if curr_hp <= 0:
		died.emit()
		get_parent().queue_free()
