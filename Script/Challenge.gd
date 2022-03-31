extends "res://Script/pola.gd"


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _on_back_pressed():
	get_tree().change_scene_to(load('res://scene/scene5.tscn'))
	pass # Replace with function body.
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
var size_track = 200
var track = sixpointstar(Vector2(window_center.x, window_center.y), size_track)

var post1 = 0
var post2 = track.size()/2
var color1 = Color("#80f2ff")
var color2 = Color(randf(), randf(), randf())
var color3 = Color(randf(), randf(), randf())
var agl1 = 0
var agl2 = 0
var trn = 1
var i = 0

func _process(delta):
	post1 += 1
	post2 += 1
	if post1 >= track.size():
		post1 = 0
	if post2 >= track.size():
		post2 = 0
	#ganti warna
	if post1 >= track.size()/2:
		color1 = Color(randf(), randf(), randf())
	else :
		color1 = Color("#80f2ff")
	if post1 >= track.size()/2:
		color2 = Color("#80f2ff")
	else :
		color2 = Color(randf(), randf(), randf())
	#puratan lingkaran
	if trn == 1:
		agl1 += 5
		color3 = Color(randf(), randf(), randf())
		i += 1
		if i == 9:
			trn = 2
			i = 0
	else :
		agl1 -= 5
		color3 = Color("#80f2ff")
		i += 1
		if i == 9:
			trn = 1
			i = 0
	agl2 -= 5
	update()

func _draw():
	var squareup = PoolVector2Array()
	var squaredown = PoolVector2Array()
	var square_length = 30
	var square_width = 20
	#track
	put_pixel_all(track, Color("#918f8e"))
	
	#persegi panjang atas
	squareup = persegi_panjang(Vector2(track[post1].x, track[post1].y), square_length, square_width)
	matrix3x3SetIdentity(theMatrix)
	translate2(-1*square_length/2,-1*square_width/2)
	squareup = (transformPoints2(squareup.size(), squareup))
	put_pixel_all(squareup, color1)
	
	#persegi panjang bawah
	squaredown = persegi_panjang(Vector2(track[post2].x, track[post2].y), square_length, square_width)
	matrix3x3SetIdentity(theMatrix)
	translate2(-1*square_length/2,-1*square_width/2)
	squaredown = (transformPoints2(squaredown.size(), squaredown))
	put_pixel_all(squaredown, color2)
	
	#islamic geometric
	var the_art3 = PoolVector2Array()
	var the_art4 = PoolVector2Array()
	the_art3 = pola3_part1(window_center, 150)
	the_art4 = pola3_part2(window_center, 150)
	matrix3x3SetIdentity(theMatrix)
	rotate2(agl1, window_center)
	the_art3 = transformPoints2(the_art3.size(), the_art3)
	matrix3x3SetIdentity(theMatrix)
	rotate2(agl2, window_center)
	the_art4 = transformPoints2(the_art4.size(), the_art4)
	put_pixel_all(the_art3, Color("#a6a6a6")) #warna alas
	put_pixel_all(the_art4, color3) #warna layang layang
	
	
	
