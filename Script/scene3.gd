extends "res://Script/pola.gd"


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
	get_tree().change_scene_to(load('res://scene/scene4.tscn'))
	pass # Replace with function body.

func _draw():
	#pola1
	var the_art1 = PoolVector2Array()
	the_art1 = pola1(Vector2(window_center.x + window_center.x/2, window_center.y), 120)
	put_pixel_all(the_art1, Color("#80f2ff"))
	
	#pola2
	var the_art2 = PoolVector2Array()
	the_art2 = pola2(Vector2(window_center.x - window_center.x/2, window_center.y), 120)
	put_pixel_all(the_art2, Color("#80f2ff"))
	
	#pola3
	var the_art3 = PoolVector2Array()
	var the_art4 = PoolVector2Array()
	the_art3 = pola3_part1(window_center, 300)
	put_pixel_all(the_art3, Color("#a6a6a6"))
	the_art4 = pola3_part2(window_center, 300)
	put_pixel_all(the_art4, Color("#80f2ff"))
