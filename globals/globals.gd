extends Node

signal stat_change

var bullet_amount = 20:
	set(value):
		bullet_amount = value
		stat_change.emit()
var grenade_amount = 5:
	set(value):
		grenade_amount = value
		stat_change.emit()
var health = 60:
	set(value):
		health = value
		stat_change.emit()
