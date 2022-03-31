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

func karya2dpola1(Center: Vector2, rad, color: Color): #lingakran
	var the_pool_art = PoolVector2Array()
	var the_art = PoolVector2Array()
	var agl = 0
	var size = 1
	var Ypos = 0
	
	the_art = pola1(Center, rad)
	for i in (5):
		matrix3x3SetIdentity(theMatrix)
		translate2(0, Ypos)
		Center = transformPoints2(1, [Center])[0]
		scale2(size, size, Center)
		rotate2(agl, Center)
		the_art = transformPoints2(the_art.size(), the_art)
		the_pool_art.append_array(the_art)
		Ypos = 100
		agl = 30
		size = 0.8
	#------------------------------ #sisi kanan
	matrix3x3SetIdentity(theMatrix)
	rotate2(180, window_center)
	the_pool_art.append_array(transformPoints2(the_pool_art.size(), the_pool_art))
	#---- print -------------
	put_pixel_all(the_pool_art, color)

func karya2dpola2(Center: Vector2, rad, color: Color): #segidelapan
	var the_pool_art = PoolVector2Array()
	var the_art = PoolVector2Array()
	var agl = 0
	var size = 1
	var Ypos = 0
	
	the_art = pola2(Center, rad)
	for i in (4):
		matrix3x3SetIdentity(theMatrix)
		translate2(0, Ypos)
		Center = transformPoints2(1, [Center])[0]
		scale2(size, size, Center)
		rotate2(agl, Center)
		the_art = transformPoints2(the_art.size(), the_art)
		the_pool_art.append_array(the_art)
		Ypos = 125
		agl = 30
	#------------------------------
	matrix3x3SetIdentity(theMatrix)
	rotate2(180, window_center)
	the_pool_art.append_array(transformPoints2(the_pool_art.size(), the_pool_art))
	#---- print -------------
	put_pixel_all(the_pool_art, color)
	
func karya2dpola3(Center: Vector2, rad, color_alas: Color, color_layang: Color): #geometric
	var the_alas_art = PoolVector2Array()
	var the_pool_art = PoolVector2Array()
	var the_art = PoolVector2Array()
	
	var rotate1 = 0
	var translateX1 = 0
	var translateY1 = 0
	the_art = pola3_part1(Center, rad*2.7)
	matrix3x3SetIdentity(theMatrix)
	rotate2(rotate1, Center)
	translate2(translateX1, translateY1)
	the_art = transformPoints2(the_art.size(), the_art)
	the_alas_art.append_array(the_art)
	
	the_art = pola3_part2(window_center, rad*2.7)
	matrix3x3SetIdentity(theMatrix)
	rotate2(rotate1, Center)
	translate2(translateX1, translateY1)
	the_art = transformPoints2(the_art.size(), the_art)
	the_pool_art.append_array(the_art)
	
	#-------------------------- #kiri atas
	var rotate2 = 102
	var translateX2 = 0
	var translateY2 = 0
	the_art = pola3_part1(Vector2(Center.x - 60, Center.y - 190), rad + 20)
	matrix3x3SetIdentity(theMatrix)
	rotate2(rotate2, Vector2(Center.x - 60, Center.y - 190))
	translate2(translateX2, translateY2)
	the_art = transformPoints2(the_art.size(), the_art)
	the_alas_art.append_array(the_art)
	
	the_art = pola3_part2(Vector2(Center.x - 60, Center.y - 190), rad + 20)
	matrix3x3SetIdentity(theMatrix)
	rotate2(rotate2, Vector2(Center.x - 60, Center.y - 190))
	translate2(translateX2, translateY2)
	the_art = transformPoints2(the_art.size(), the_art)
	the_pool_art.append_array(the_art)
	
	#-------------------------- #kanan atas
	rotate2 = 12
	translateX2 = 0
	translateY2 = 0
	the_art = pola3_part1(Vector2(Center.x + 60, Center.y - 190), rad + 20)
	matrix3x3SetIdentity(theMatrix)
	rotate2(rotate2, Vector2(Center.x + 60, Center.y - 190))
	translate2(translateX2, translateY2)
	the_art = transformPoints2(the_art.size(), the_art)
	the_alas_art.append_array(the_art)
	
	the_art = pola3_part2(Vector2(Center.x + 60, Center.y - 190), rad + 20)
	matrix3x3SetIdentity(theMatrix)
	rotate2(rotate2, Vector2(Center.x + 60, Center.y - 190))
	translate2(translateX2, translateY2)
	the_art = transformPoints2(the_art.size(), the_art)
	the_pool_art.append_array(the_art)
	
	#-------------------------- #kiri bawah
	rotate2 = 102
	translateX2 = 0
	translateY2 = 0
	the_art = pola3_part1(Vector2(Center.x - 60, Center.y + 190), rad + 20)
	matrix3x3SetIdentity(theMatrix)
	rotate2(rotate2, Vector2(Center.x - 60, Center.y + 190))
	translate2(translateX2, translateY2)
	the_art = transformPoints2(the_art.size(), the_art)
	the_alas_art.append_array(the_art)
	
	the_art = pola3_part2(Vector2(Center.x - 60, Center.y + 190), rad + 20)
	matrix3x3SetIdentity(theMatrix)
	rotate2(rotate2, Vector2(Center.x - 60, Center.y + 190))
	translate2(translateX2, translateY2)
	the_art = transformPoints2(the_art.size(), the_art)
	the_pool_art.append_array(the_art)
	
	#-------------------------- #kanan bawah
	rotate2 = 12
	translateX2 = 0
	translateY2 = 0
	the_art = pola3_part1(Vector2(Center.x + 60, Center.y + 190), rad + 20)
	matrix3x3SetIdentity(theMatrix)
	rotate2(rotate2, Vector2(Center.x + 60, Center.y + 190))
	translate2(translateX2, translateY2)
	the_art = transformPoints2(the_art.size(), the_art)
	the_alas_art.append_array(the_art)
	
	the_art = pola3_part2(Vector2(Center.x + 60, Center.y + 190), rad + 20)
	matrix3x3SetIdentity(theMatrix)
	rotate2(rotate2, Vector2(Center.x + 60, Center.y + 190))
	translate2(translateX2, translateY2)
	the_art = transformPoints2(the_art.size(), the_art)
	the_pool_art.append_array(the_art)
	#---- print -------------
	put_pixel_all(the_alas_art, color_alas)
	put_pixel_all(the_pool_art, color_layang)
	

