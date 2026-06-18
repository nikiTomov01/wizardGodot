extends Node

class_name PlayerStats
signal stat_changed(stat_name, value)

var max_health := 5
var current_health = max_health

var speed := 400.0
var attack_speed := 1.0
var bullet_count := 1
var damage := 1
