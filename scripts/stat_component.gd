class_name StatComponent
extends Node

signal value_changed(current, maximum)
signal depleted
signal filled

@export var max_value := 100

var current_value := 0

func _ready() -> void:
	current_value = max_value
	value_changed.emit(current_value, max_value)
	
func add(amount: int):
	current_value = min(current_value + amount, max_value)
	value_changed.emit(current_value, max_value)
	
	if current_value == max_value:
		filled.emit()
		
func remove(amount: int):
	current_value = max(current_value - amount, 0)
	
	value_changed.emit(current_value, max_value)
	
	if current_value <= 0:
		depleted.emit()
