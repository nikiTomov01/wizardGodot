extends Node

signal value_changed(current, maximum)
signal level_up(level)

@export var starting_level := 1
@export var base_exp := 10

var level := 1
var current_value := 0
var max_value := 0

func _ready():
	level = starting_level
	max_value = base_exp
	
	value_changed.emit(current_value, max_value)
	
func add_exp(amount: int):
	current_value += amount
	
	while current_value >= max_value:
		current_value -= max_value
		level += 1
		
		level_up.emit(level)
		
		# simple scale formula
		max_value = int(max_value * 1.5)
		
	value_changed.emit(current_value, max_value)
