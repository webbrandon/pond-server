extends Node

var ducks = []

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

remote func set_new_duck_user(new_duck):
	var duck_obj = {"id": get_tree().get_rpc_sender_id(), "name": new_duck.name, "origin": new_duck.orgin, "rotation": new_duck.rotation}
	
	# Send new player position for initialization to players.
	for duck in ducks:
		print("Sending new user message to: " + str(duck.id))
		rpc_id(duck.id, "create_duck", duck_obj)
		
	# Give new player other player positions on screen.
	for duck in ducks:
		print("Sending new user message to: " + str(duck.id))
		rpc_id(duck_obj.id, "create_duck", duck)
		
	ducks.append(duck_obj)
	
	print("Added new duck to pond: " + str(duck_obj))
	
remote func update_duck_user(update_duck):
	var duck_obj = {"id": get_tree().get_rpc_sender_id(), "name": update_duck.name, "origin": update_duck.origin, "rotation": update_duck.rotation}
	
	for duck in ducks:
		if duck.id != duck_obj.id:
			print("Sending update user message to: " + str(duck.id))
			rpc_id(duck.id, "update_duck", duck_obj)
		else:
			duck = duck_obj

remote func update_duck_user_color(duck_color):
	var duck_obj = {"id": get_tree().get_rpc_sender_id(), "name": duck_color.name, "color": duck_color.color}
	
	for duck in ducks:
		if duck.id != duck_obj.id:
			print("Sending update user color message to: " + str(duck.id))
			rpc_id(duck.id, "update_duck_color", duck_obj)
		else:
			duck = duck_obj
			
func remove_duck_user(id):
	var duck = null
	for beak in ducks.size():
		if ducks[beak].id == id:
			duck = beak
			break
	if duck != null:
		print("Removing duck by force.")
		ducks.remove(duck)
		
