extends CanvasLayer

#colors
var green: Color = Color("6bbfa3")
var red: Color = Color(0.9,0,0,1)

@onready var laser_label: Label = $BulletCounter/VBoxContainer/Label
@onready var grenade_label: Label = $GrenadeCounter/VBoxContainer/Label
@onready var laser_icon: TextureRect = $BulletCounter/VBoxContainer/TextureRect
@onready var grenade_icon: TextureRect = $GrenadeCounter/VBoxContainer/TextureRect

func _ready() -> void:
	update_laser_text()
	update_grenade_text()

func update_laser_text():
	laser_label.text = str(Globals.bullet_amount)
	update_color(Globals.bullet_amount, laser_label, laser_icon)
	
func update_grenade_text():
	grenade_label.text = str(Globals.grenade_amount)
	update_color(Globals.grenade_amount, grenade_label, grenade_icon)
	
func update_color(amount, label, icon):
	if (amount <= 0):
		label.modulate = red
		icon.modulate = red
	else:
		label.modulate = green
		icon.modulate = green
