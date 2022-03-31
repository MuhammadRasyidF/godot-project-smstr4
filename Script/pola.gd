extends "res://Script/line.gd"


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func persegi(titik_awal: Vector2, panjang_sisi):
	var res = PoolVector2Array()
	res.append_array(lineDDA(titik_awal.x, titik_awal.y, titik_awal.x + panjang_sisi, titik_awal.y)) #sisi atas
	res.append_array(lineDDA(titik_awal.x, titik_awal.y + panjang_sisi, titik_awal.x + panjang_sisi, titik_awal.y + panjang_sisi)) #sisi bawah
	res.append_array(lineDDA(titik_awal.x, titik_awal.y, titik_awal.x, titik_awal.y + panjang_sisi)) #sisi kiri
	res.append_array(lineDDA(titik_awal.x + panjang_sisi, titik_awal.y, titik_awal.x + panjang_sisi, titik_awal.y + panjang_sisi)) #sisi kanan
	return res
	
func persegi_panjang(titik_awal : Vector2, panjang, lebar):
	var res = PoolVector2Array()
	res.append_array(lineDDA(titik_awal.x, titik_awal.y, titik_awal.x + panjang, titik_awal.y)) #sisi atas
	res.append_array(lineDDA(titik_awal.x, titik_awal.y + lebar, titik_awal.x + panjang, titik_awal.y + lebar)) #sisi bawah
	res.append_array(lineDDA(titik_awal.x, titik_awal.y, titik_awal.x, titik_awal.y + lebar)) #sisi kiri
	res.append_array(lineDDA(titik_awal.x + panjang, titik_awal.y, titik_awal.x + panjang, titik_awal.y + lebar)) #sisi kanan
	return res

func segitiga_siku(titik_awal : Vector2, panjang, tinggi ):
	var res = PoolVector2Array()
	res.append_array(lineDDA(titik_awal.x, titik_awal.y + tinggi, titik_awal.x + panjang, titik_awal.y + tinggi)) #sisi bawah
	res.append_array(lineDDA(titik_awal.x, titik_awal.y, titik_awal.x, titik_awal.y + tinggi)) #sisi kiri
	res.append_array(lineDDA(titik_awal.x, titik_awal.y, titik_awal.x + panjang, titik_awal.y + tinggi)) #sisi miring
	return res
	
func trapesium_siku(titik_awal : Vector2, panjang_atas, panjang_bawah, tinggi):
	var res = PoolVector2Array()
	res.append_array(lineDDA(titik_awal.x, titik_awal.y, titik_awal.x + panjang_atas, titik_awal.y)) #sisi atas
	res.append_array(lineDDA(titik_awal.x, titik_awal.y + tinggi, titik_awal.x + panjang_bawah, titik_awal.y + tinggi)) #sisi bawah
	res.append_array(lineDDA(titik_awal.x, titik_awal.y, titik_awal.x, titik_awal.y + tinggi)) #sisi kiri
	res.append_array(lineDDA(titik_awal.x + panjang_atas, titik_awal.y, titik_awal.x + panjang_bawah, titik_awal.y + tinggi)) #sisi miring
	return res
	
func ketupat(titik_awal: Vector2, panjang_sisi):
	var res = PoolVector2Array()
	res.append_array(lineDDA(titik_awal.x + (panjang_sisi/2), titik_awal.y, titik_awal.x, titik_awal.y + (panjang_sisi/2))) #sisi atas kiri
	res.append_array(lineDDA(titik_awal.x + (panjang_sisi/2), titik_awal.y, titik_awal.x + panjang_sisi, titik_awal.y + (panjang_sisi/2))) #sisi atas kanan
	res.append_array(lineDDA(titik_awal.x + (panjang_sisi/2), titik_awal.y + panjang_sisi, titik_awal.x, titik_awal.y + (panjang_sisi/2))) #sisi bawah kiri
	res.append_array(lineDDA(titik_awal.x + (panjang_sisi/2), titik_awal.y + panjang_sisi, titik_awal.x + panjang_sisi, titik_awal.y + (panjang_sisi/2))) #sisi bawah kanan
	return res
	
func jajaran_genjang(titik_awal : Vector2, alas, tinggi):
	var res = PoolVector2Array()
	res.append_array(lineDDA(titik_awal.x, titik_awal.y, titik_awal.x + alas, titik_awal.y)) #sisi atas
	#alas yang berukuran kecil (atau alas yang dipotong dengan tinggi) dianggap 1/3 dari total alas
	var alaskecil = alas/3
	res.append_array(lineDDA(titik_awal.x, titik_awal.y, titik_awal.x + alaskecil, titik_awal.y + tinggi)) #sisi miring kiri
	res.append_array(lineDDA(titik_awal.x + alas, titik_awal.y, titik_awal.x + alas + alaskecil, titik_awal.y + tinggi)) #sisi miring kanan
	res.append_array(lineDDA(titik_awal.x + alaskecil, titik_awal.y + tinggi, titik_awal.x + alas + alaskecil, titik_awal.y + tinggi)) #sisi bawah
	return res
	
func layang_layang(titik_awal : Vector2, diagonal : Vector2):
	var res = PoolVector2Array()
	#diagonal.y terpendek = 1/4 dari total diagolnal.y
	#diagonal.y terpanjang = 3/4 dari total diagolnal.y
	res.append_array(lineDDA(titik_awal.x - diagonal.x/2, titik_awal.y - diagonal.y*2/3, titik_awal.x, titik_awal.y - diagonal.y)) #sisi atas kiri
	res.append_array(lineDDA(titik_awal.x + diagonal.x/2, titik_awal.y - diagonal.y*2/3, titik_awal.x, titik_awal.y - diagonal.y)) #sisi atas kanan
	res.append_array(lineDDA(titik_awal.x, titik_awal.y, titik_awal.x - diagonal.x/2, titik_awal.y - diagonal.y*2/3)) #sisi bawah kiri
	res.append_array(lineDDA(titik_awal.x, titik_awal.y, titik_awal.x + diagonal.x/2, titik_awal.y - diagonal.y*2/3)) #sisi bawah kanan
	return res
	
func lingkaran(Center : Vector2, radius: int):
	var res = PoolVector2Array()
	var x = 0
	var y = radius
	var p = 1 - radius
	
	res = circlePlotPoints(Vector2(Center.x, Center.y), x, y)
	
	while(x < y):
		x += 1
		if (p < 0):
			p += 2 * x + 1
		else:
			y -= 1
			p += 2 * (x-y) + 1
		res.append_array(circlePlotPoints(Vector2(Center.x, Center.y), x, y))
	return res
	
func circlePlotPoints(Center : Vector2, x: int, y: int):
	var res = PoolVector2Array()
	res.append(Vector2(Center.x + x, Center.y + y))
	res.append(Vector2(Center.x - x, Center.y + y))
	res.append(Vector2(Center.x + x, Center.y - y))
	res.append(Vector2(Center.x - x, Center.y - y))
	res.append(Vector2(Center.x + y, Center.y + x))
	res.append(Vector2(Center.x - y, Center.y + x))
	res.append(Vector2(Center.x + y, Center.y - x))
	res.append(Vector2(Center.x - y, Center.y - x))
	return res
	
func ellips(Center : Vector2, Rx: int, Ry: int):
	var res = PoolVector2Array()
	var Rx2 = pow(Rx, 2)
	var Ry2 = pow(Ry, 2)
	var twoRx2 = 2*Rx2
	var twoRy2 = 2*Ry2
	var p
	var x = 0
	var y = Ry
	var px = 0
	var py = twoRx2 * y
	
	res = ellipsePlotPoints(Vector2(Center.x, Center.y), x, y)
	
	p = round(Ry2 - (Rx2 * Ry) + (0.25 * Rx2))
	while(px < py):
		x += 1
		px += twoRy2
		if(p < 0):
			p += Ry2 + px
		else:
			y -= 1
			py -= twoRx2
			p += Ry2 + px - py
			
		res.append_array(ellipsePlotPoints(Vector2(Center.x, Center.y), x, y))
	
	p = round(Ry2*pow(x+0.5, 2) + Rx2*pow(y-1, 2) - Rx2*Ry2)
	while(y > 0):
		y -= 1
		py -= twoRx2
		if (p > 0):
			p += Rx2 - py
		else:
			x += 1
			px += twoRy2
			p += Rx2 - py + px
			
		res.append_array(ellipsePlotPoints(Vector2(Center.x, Center.y), x, y))
	return res
	

func ellipsePlotPoints(Center : Vector2, x: int, y: int):
	var res = PoolVector2Array()
	res.append(Vector2(Center.x + x, Center.y + y))
	res.append(Vector2(Center.x - x, Center.y + y))
	res.append(Vector2(Center.x + x, Center.y - y))
	res.append(Vector2(Center.x - x, Center.y - y))
	res.append(Vector2(Center.x - x, Center.y - y))
	return res

func segi_lima(Center: Vector2, radius):
	var res = PoolVector2Array()
	var points = PoolVector2Array()
	points.insert(0, Vector2(Center.x, Center.y - radius))
	
	for i in range(1, 5):
		var pt = PoolVector2Array()
		pt.insert(0, points[i-1])
		
		matrix3x3SetIdentity(theMatrix)
		rotate2(72, Center)
		pt = transformPoints2(1, pt)
		points.insert(i, pt[0])
	
	for i in range (1, 5):
		 res.append_array(lineDDA(points[i-1].x, points[i-1].y, points[i].x, points[i].y))
	res.append_array(lineDDA(points[4].x, points[4].y, points[0].x, points[0].y))
	return res
	
func segi_enam(Center: Vector2, radius):
	var res = PoolVector2Array()
	var points = PoolVector2Array()
	points.insert(0, Vector2(Center.x, Center.y - radius))
	
	for i in range(1, 6):
		var pt = PoolVector2Array()
		pt.insert(0, points[i-1])
		
		matrix3x3SetIdentity(theMatrix)
		rotate2(60, Center)
		pt = transformPoints2(1, pt)
		points.insert(i, pt[0])
	
	for i in range (1, 6):
		res.append_array(lineDDA(points[i-1].x, points[i-1].y, points[i].x, points[i].y))
	res.append_array(lineDDA(points[5].x, points[5].y, points[0].x, points[0].y))
	return res

func segi_delapan_custom(Center: Vector2, radius):
	var res = PoolVector2Array()
	var points = PoolVector2Array()
	points.insert(0, Vector2(Center.x, Center.y - radius))
	
	for i in range(1, 8):
		var pt = PoolVector2Array()
		pt.insert(0, points[i-1])
		
		matrix3x3SetIdentity(theMatrix)
		if (i%2 == 0):#genap
			rotate2(30, Center)
		else:
			rotate2(60, Center)
		pt = transformPoints2(1, pt)
		points.insert(i, pt[0])
	
	for i in range (1, 8):
		res.append_array(lineDDA(points[i-1].x, points[i-1].y, points[i].x, points[i].y))
	res.append_array(lineDDA(points[7].x, points[7].y, points[0].x, points[0].y))
	return res

#pola2d
func pola1(Center: Vector2, rad):
	rad = rad/2
	var res = PoolVector2Array()
	
	matrix3x3SetIdentity(theMatrix)
	#lingkaran
	res.append_array(lingkaran(Center, rad))
	#segiempat
	var sisi = (rad/3)
	res.append_array(persegi(Vector2(Center.x - sisi/2, Center.y - sisi/2), sisi))
	
	return res
	
func pola2(Center: Vector2, rad):
	rad = rad/2
	var res = PoolVector2Array()
	var art = PoolVector2Array()
	
	#segienam
	art = segi_delapan_custom(Center, rad)
	matrix3x3SetIdentity(theMatrix)
	rotate2(15.5, Center)
	art = transformPoints2(art.size(), art)
	res.append_array(art)
	#persegipanjang
	var panjang = rad
	var lebar = rad/4
	for i in (3) :
		art = persegi_panjang(Vector2(Center.x - panjang/2, Center.y - lebar/2), panjang, lebar)
		matrix3x3SetIdentity(theMatrix)
		if(i == 0):
			translate2(0,0)
		elif(i == 1):
			translate2(0,20)
		else:
			translate2(0,-20)
		art = transformPoints2(art.size(), art)
		res.append_array(art)
	
	return res
	
func pola3_part1(Center: Vector2, rad): #alas
	rad = rad/2
	var res = PoolVector2Array()
	var art = PoolVector2Array()
	
	#lingakran
	art = lingkaran(Center, rad)
	matrix3x3SetIdentity(theMatrix)
	art = transformPoints2(art.size(), art)
	res.append_array(art)
	#garis
	art = lineDDA(Center.x, Center.y - rad - rad/6, Center.x, Center.y)
	for i in (20):
		matrix3x3SetIdentity(theMatrix)
		rotate2(18, Center)
		art = transformPoints2(art.size(), art)
		res.append_array(art)
	#geometric pattern
	art = geometric_ori1(Center, rad)
	for i in (10): 
		matrix3x3SetIdentity(theMatrix)
		rotate2(36, Center)
		art = transformPoints2(art.size(), art)
		res.append_array(art)
	
	art = geometric_ori2(Center, rad)
	for i in (10): 
		matrix3x3SetIdentity(theMatrix)
		rotate2(36, Center)
		art = transformPoints2(art.size(), art)
		res.append_array(art)
	
	return res

func pola3_part2(Center: Vector2, rad): #layanglayang
	rad = rad/2
	var res = PoolVector2Array()
	var art = PoolVector2Array()
	
	#layang-layang
	art = layang_layang_custom(Center, rad)
	for i in (10): 
		matrix3x3SetIdentity(theMatrix)
		rotate2(36, Center)
		art = transformPoints2(art.size(), art)
		res.append_array(art)
	
	return res
	

func geometric_ori1(Center : Vector2, rad):
	var res = PoolVector2Array()
	var art = PoolVector2Array()
	var temp_points = PoolVector2Array()
	
	art = [Vector2(Center.x, Center.y - rad)]
	matrix3x3SetIdentity(theMatrix)
	rotate2(18, Center)
	art = transformPoints2(art.size(), art)
	temp_points.append_array(art)
	
	matrix3x3SetIdentity(theMatrix)
	rotate2(18*6, Center)
	art = transformPoints2(art.size(), art)
	temp_points.append_array(art)
	res.append_array(lineDDA(temp_points[0].x, temp_points[0].y, temp_points[1].x, temp_points[1].y))
	
	matrix3x3SetIdentity(theMatrix)
	rotate2(-18*12, Center)
	art = transformPoints2(art.size(), art)
	temp_points.append_array(art)
	res.append_array(lineDDA(temp_points[0].x, temp_points[0].y, temp_points[2].x, temp_points[2].y))
	
	return res
	
func geometric_ori2(Center : Vector2, rad):
	var res = PoolVector2Array()
	var art = PoolVector2Array()
	var temp_points = PoolVector2Array()
	
	art = [Vector2(Center.x, Center.y - rad)]
	matrix3x3SetIdentity(theMatrix)
	rotate2(18, Center)
	art = transformPoints2(art.size(), art)
	temp_points.append_array(art)
	
	matrix3x3SetIdentity(theMatrix)
	rotate2(18*8, Center)
	art = transformPoints2(art.size(), art)
	temp_points.append_array(art)
	res.append_array(lineDDA(temp_points[0].x, temp_points[0].y, temp_points[1].x, temp_points[1].y))
	
	matrix3x3SetIdentity(theMatrix)
	rotate2(-18*16, Center)
	art = transformPoints2(art.size(), art)
	temp_points.append_array(art)
	res.append_array(lineDDA(temp_points[0].x, temp_points[0].y, temp_points[2].x, temp_points[2].y))
	
	return res

func layang_layang_custom(Center : Vector2, rad):
	var res = PoolVector2Array()
	var art = PoolVector2Array()
	var temp_points = PoolVector2Array()
	var cus_layang = PoolVector2Array()
	#titik awal
	art = [Vector2(Center.x, Center.y - rad)]
	matrix3x3SetIdentity(theMatrix)
	rotate2(18, Center)
	art = transformPoints2(art.size(), art)
	temp_points.append_array(art)
	
	cus_layang.append_array(layang_layang(temp_points[0], Vector2(rad/1.73, rad/1.63)))
	matrix3x3SetIdentity(theMatrix)
	rotate2(180+18, temp_points[0])
	cus_layang = transformPoints2(cus_layang.size(), cus_layang)
	res.append_array(cus_layang)
	
	return res


func sixpointstar(Center : Vector2, radius):
	var res = PoolVector2Array()
	var points = PoolVector2Array()
	points.insert(0, Vector2(Center.x, (Center.y - radius)))
	
	for i in range(1, 12):
		var pt = PoolVector2Array()
		pt.insert(0, points[i-1])
		
		matrix3x3SetIdentity(theMatrix)
		rotate2(30, Center)
		if (i%2 == 0):#genap
			scale2(2, 2, Center)
		else:
			scale2(0.5, 0.5, Center)
		pt = transformPoints2(1, pt)
		points.insert(i, pt[0])
	
	for i in range (1, 12):
		res.append_array(lineDDA(points[i-1].x, points[i-1].y, points[i].x, points[i].y))
	res.append_array(lineDDA(points[11].x, points[11].y, points[0].x, points[0].y))
	return res
	
