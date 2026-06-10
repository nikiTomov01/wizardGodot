extends Control

@export var fill_color: Color = Color.WHITE
@export var stat_component: Node

@onready var progress_bar = $ProgressBar


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var style = StyleBoxFlat.new()
	style.bg_color = fill_color
	progress_bar.add_theme_stylebox_override("fill", style)
	if stat_component:
		stat_component.value_changed.connect(update_value)
		
		update_value(
			stat_component.current_value,
			stat_component.max_value
		)

func update_value(current, maximum):
	progress_bar.max_value = maximum
	progress_bar.value = current
