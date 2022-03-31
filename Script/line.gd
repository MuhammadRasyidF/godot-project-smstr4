extends "res://Script/primitif.gd"

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

const MarginLeft = 90
const MarginUp = 40
var X_width = 0
var Y_height = 0
var window_center = Vector2()


func _init():
	X_width = ProjectSettings.get('display/window/size/width')
	Y_height = ProjectSettings.get('display/window/size/height')
	window_center.x = X_width/2
	window_center.y = Y_height/2

#line_dda
func lineDDA(xa : float, ya : float, xb : float, yb : float):
	var dx = xb - xa
	var dy = yb - ya
	var steps
	var xIncrement
	var yIncrement
	var x = xa
	var y = ya
	var res = PoolVector2Array()
	
	if (abs(dx) > abs(dy)) :
		steps = abs(dx)
	else : 
		steps = abs(dy)
		
	xIncrement = dx/ float(steps)
	yIncrement = dy/ float(steps)
	res.append(Vector2(round(x), round(y)))
	
	for k in steps:
		x += xIncrement
		y += yIncrement
		res.append(Vector2(round(x), round(y)))
	return res

#Line_Bresenham
func lineBres(xa, ya, xb, yb):
	var dx = abs(xa - xb)
	var dy = abs(ya - yb)
	var p = 2 * dy - dx
	var twoDy = 2 * dy
	var twoDyDx = 2 * (dy - dx)
	var x
	var y
	var xEnd
	var k = 1
	var res = PoolVector2Array()
	
	if xa > xb : 
		x = xb
		y = yb
		xEnd = xa
	else : 
		x = xa
		y = ya
		xEnd = xb
	
	res.append(Vector2(round(x), round(y)))
	
	while x < xEnd :
		x += 1
		if p < 0 :
			p += twoDy
		else : 
			y += 1
			p += twoDyDx
		res.append(Vector2(round(x), round(y)))
		k += 1
	return res
