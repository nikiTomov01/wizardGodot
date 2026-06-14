extends Area2D

@export var exp_value := 100

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("wizard"):
		body.add_exp(exp_value)
		queue_free()
