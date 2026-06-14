extends CanvasLayer

@onready var level_label = $LevelLabel
@onready var exp_bar = $ExpBar

@export var wizard : Node

func _ready():
	var expNode = wizard.get_node("Exp")

	level_label.text = "Level %d" % expNode.level
	expNode.level_up.connect(_on_level_up)
	expNode.value_changed.connect(_on_exp_changed)


func _on_level_up(level):
	level_label.text = "Level %d" % level
	# add level up menu display here!!!!

func _on_exp_changed(current, maximum):
	exp_bar.update_value(current, maximum)
