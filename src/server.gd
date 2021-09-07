extends Node

var PORT = get_port()
var MAX_PLAYERS = get_max_players()
var server
onready var duck_control = $GameScreen/client

func _ready():
	print("Initializing server at " + str(IP.get_local_addresses()) + ":" + str(PORT))
	# Connect communication processes 
	_connect_built_ins()
	_connect_network()
	
func get_port():
	var port = OS.get_environment("POND_SERVER_PORT").to_int()
	if port == 0:
		port = 3000
	return port
	
func get_max_players():
	var count = OS.get_environment("POND_SERVER_MAX_PLAYERS").to_int()
	if count == 0:
		count = 50
	return count
	
func _connect_built_ins():
	get_tree().connect("network_peer_connected", self, "_player_connected")
	get_tree().connect("network_peer_disconnected", self, "_player_disconnected")
	get_tree().connect("connection_failed", self, "_connected_fail")
	
func _connect_network():
	server = NetworkedMultiplayerENet.new()
	server.create_server(PORT, MAX_PLAYERS)	
	get_tree().network_peer = server
	

remote func set_new_duck_user(new_duck):
	print("Duck is landing.")
	
	duck_control.set_new_duck_user(new_duck)

remote func update_duck_user(new_duck):
	print("Duck is swimming.")
	
	duck_control.update_duck_user(new_duck)

remote func update_duck_user_color(duck_color):
	print("Duck has new color.")
	
	duck_control.update_duck_color(duck_color)
	
func _player_connected(id):
	print("Incoming duck into pond.")

func _player_disconnected(id):
	print("Duck " + str(id) + " is preparing flying away.")
	
	duck_control.remove_duck_user(id)

	print("Duck " + str(id) + " is gone.")

func _connected_fail():
	printerr("CONNECTION FAILURE")
