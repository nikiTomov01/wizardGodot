extends Area2D

@export var speed := 600.0
@export var dmg := 1

var direction := Vector2.ZERO

func _process(delta: float):
	position += direction * speed * delta


func _on_body_entered(body: Node2D):
	if body.has_method("take_damage"):
		body.take_damage(dmg)
		queue_free()
