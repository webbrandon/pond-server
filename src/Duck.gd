extends Node


onready var duck_control = get_parent().get_node("client")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	
remote func update_duck_user(new_duck):
	print("Duck is swimming.")
	
	duck_control.update_duck_user(new_duck)
	
remote func update_duck_user_color(duck_color):
	print("Duck has new color.")
	
	duck_control.update_duck_color(duck_color)
