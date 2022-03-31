extends "res://Script/karya2d.gd"


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func _on_next_pressed():
	get_tree().change_scene_to(load('res://scene/scene5.tscn'))
	pass # Replace with function body.

func _on_back_pressed():
	get_tree().change_scene_to(load('res://scene/scene3.tscn'))
	pass # Replace with function body.
	
func _draw():
	karya2dpola1(Vector2(X_width/5, Y_height/5), 100, Color("#A44CD3")) #ungu tua
	karya2dpola2(Vector2(((X_width/5)*2)-80, Y_height/5), 100, Color("#E090DF")) #ungu
	karya2dpola3(window_center, 80, Color("#a6a6a6"), Color("#FBBEDE")) #ungu cerah
