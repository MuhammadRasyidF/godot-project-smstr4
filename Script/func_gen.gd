extends "res://Script/line.gd"


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.

var arg = 0

#draw linear y = mx = c
func draw_linear_func(m: int, c: int, color, animasi = false):
	var xa = [0,0]
	var ya = [0,0]
	
	if (!animasi):
		arg = X-MarginLeft
	
	for k in range (arg):
		var x = k
		for back in range (2):
			if(back == 1):
				x *= -1
				
			var xb = Xcenter + x
			var this_y = ((m*x) + c)
			var yb = Ycenter - this_y
			
			if (yb >= MarginUp and yb <= Y-MarginUp) :
				if(x == 0):
					put_pixel(xb, yb, color)
				else:
					lineDDA(xa[back], ya[back], xb, yb, color)
			xa[back] = xb
			ya[back] = yb

#draw polynomial ax^2 + bx + c
func draw_polynomial_func(a: float, b: int, c: int, color, animasi = false):
	var xa = [0,0]
	var ya = [0,0]
	
	if (!animasi):
		arg = X-MarginLeft
	
	for k in range (arg):
		var x = k
		for back in range (2):
			if(back == 1):
				x *= -1
				
			var xb = Xcenter + x
			var this_y = (a*pow(x,2) + b*x - c)
			var yb = Ycenter - this_y
			
			if (yb >= MarginUp and yb <= Y-MarginUp) :
				if(x == 0):
					put_pixel(xb, yb, color)
				else:
					lineDDA(xa[back], ya[back], xb, yb, color)
			xa[back] = xb
			ya[back] = yb
	


#draw trigonometry
# SIN(a*x) + c
# COS(a*x) + c
# TAN(a*x) + c
enum {SIN, COS, TAN}
func draw_trigonometry_func(typeTrigono, a, c, yScale, color, animasi = false):
	var xa = [0,0]
	var ya = [0,0]
	
	if (!animasi):
		arg = X-MarginLeft
	
	for k in range (arg):
		var x = k
		for back in range (2):
			if(back == 1):
				x *= -1
			var xb = Xcenter + x
			var this_y = 0
			match(typeTrigono):
				SIN:
					this_y = ((sin(deg2rad(a*x)) * yScale) + c)
				COS:
					this_y = ((cos(deg2rad(a*x)) * yScale) + c)
				TAN:
					this_y = ((tan(deg2rad(a*x)) * yScale) + c)
			var yb = Ycenter - this_y
			
			if (yb >= MarginUp and yb <= Y-MarginUp) :
				if(xb >= MarginLeft and xb <= X-MarginLeft) :
					if(x == 0 or not (ya[back] >= MarginUp and ya[back] <= Y-MarginUp)):
						put_pixel(xb, yb, color)
					else:
						lineDDA(xa[back], ya[back], xb, yb, color)
			xa[back] = xb
			ya[back] = yb
