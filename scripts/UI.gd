extends CanvasLayer

@onready var level_label = $LevelLabel
@onready var exp_bar = $ExpBar
@onready var wave_counter = $WaveCounter

@export var wizard : Node

func _ready():
	var expNode = wizard.get_node("Exp")
	var waveManager = get_parent().get_node("WaveManager")

	level_label.text = "Level %d" % expNode.level
	expNode.level_up.connect(_on_level_up)
	expNode.value_changed.connect(_on_exp_changed)
	waveManager.waveChanged.connect(_on_wave_change)


func _on_level_up(level):
	level_label.text = "Level %d" % level
	# add level up menu display here!!!!

func _on_exp_changed(current, maximum):
	exp_bar.update_value(current, maximum)
	
func _on_wave_change(wave):
	wave_counter.text = "Wave: %d" % wave
