c = 0
def setup():
	# size(640,480)
	fullScreen()
	background(255)
	noFill()
	stroke(0)
	strokeWeight(2)

def draw():
	global l
	colorMode(RGB, 255)
	background(255)
	l = 0
	colorMode(HSB, 360, 100,100)
	Circle(width/2, height/2, 600)

def Circle(x, y, d):
	global c, l
	fill(map(d**2, 225, 3600, 80, 0), 80, 95, map(d, 15, 600, 100, 80))
	if l !=0:
		ellipse(x, y, d,d)
	c+=0.00001
	l+=1
	pushMatrix()
	translate(x, y)
	rotate(c)
	if d>20:
		Circle(3*d/2, 0, d/2)
		Circle(-3*d/2, 0, d/2)
		Circle(0, 3*d/2, d/2)
		Circle(0, -3*d/2, d/2)
	popMatrix()