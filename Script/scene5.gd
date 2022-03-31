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
	get_tree().change_scene_to(load('res://scene/Challenge.tscn'))
	pass # Replace with function body.

func _on_back_pressed():
	get_tree().change_scene_to(load('res://scene/scene4.tscn'))
	pass # Replace with function body.

var scalelvl = 1
var Yposition = 0
var turn = 1
var iter = 0
var agl1 = 0
var agl2 = 0
var trn = 1
var i = 0

func _process(delta):
	if turn == 1:
		scalelvl -= 0.02
		Yposition -= 10
		iter += 1
		if iter == 13:
			turn = 2
			iter = 0
	elif turn == 2:
		scalelvl += 0.02
		Yposition += 10
		iter += 1
		if iter == 13:
			turn = 3
			iter = 0
	elif turn == 3:
		scalelvl += 0.02
		Yposition += 10
		iter += 1
		if iter == 13:
			turn = 4
			iter = 0
	else:
		scalelvl -= 0.02
		Yposition -= 10
		iter += 1
		if iter == 13:
			turn = 1
			iter = 0
			
	if trn == 1:
		agl1 += 5
		i += 1
		if i == 9:
			trn = 2
			i = 0
	else :
		agl1 -= 5
		i += 1
		if i == 9:
			trn = 1
			i = 0
	agl2 -= 5
	update()

func _draw():
	#pola1 #kanan
	var the_art1 = PoolVector2Array()
	var Center1 = Vector2(window_center.x + window_center.x/2, window_center.y)
	the_art1 = pola1(Center1, 120)
	matrix3x3SetIdentity(theMatrix)
	translate2(0,Yposition)
	scale2(scalelvl, scalelvl, Center1)
	the_art1 = transformPoints2(the_art1.size(), the_art1)
	put_pixel_all(the_art1, Color("#80f2ff"))
	#put_pixel_all(the_art1, Color(randf(), randf(), randf()))
	
	#pola2
	var the_art2 = PoolVector2Array()
	var Center2  = Vector2(window_center.x - window_center.x/2, window_center.y)
	the_art2 = pola2(Center2, 120)
	matrix3x3SetIdentity(theMatrix)
	translate2(0,-1*Yposition)
	scale2(scalelvl, scalelvl, Center2)
	the_art2 = transformPoints2(the_art2.size(), the_art2)
	put_pixel_all(the_art2, Color("#80f2ff"))
	
	#pola3
	var the_art3 = PoolVector2Array()
	var the_art4 = PoolVector2Array()
	the_art3 = pola3_part1(window_center, 300)
	the_art4 = pola3_part2(window_center, 300)
	matrix3x3SetIdentity(theMatrix)
	rotate2(agl1, window_center)
	the_art3 = transformPoints2(the_art3.size(), the_art3)
	matrix3x3SetIdentity(theMatrix)
	rotate2(agl2, window_center)
	the_art4 = transformPoints2(the_art4.size(), the_art4)
	put_pixel_all(the_art3, Color("#a6a6a6"))
	put_pixel_all(the_art4, Color("#80f2ff"))
