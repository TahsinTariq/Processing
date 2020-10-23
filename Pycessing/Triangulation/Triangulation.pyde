from a import *
# from collections import namedtuple
l = []

def setup():
	global l
	size(640,480)
	background(255)
	# for i in range(3):
	# 	a = (random(width),random(height))
	# 	l.append(a)
	l.append((0,0))
	l.append((400, 100))
	l.append((300,0))


def draw():
	background(255)


	a = Point(l[0][0], l[0][1])
	b = Point(l[1][0], l[1][1])
	c = Point(l[2][0], l[2][1])
	# t = Triangle(l[0], l[1], l[2])
	t = Triangle(a, b, c)
	# circl = namedtuple('circl', ['x', 'y', 'r'])
	# cir = circl(width/2, height/2, 100)
	cir = t.circumCircle()
	inside = t.inCircle(Point(mouseX, mouseY))
	if inside:
		fill(255,0,0)
	else:
		noFill()
	println(cir)
	ellipse(cir.x, cir.y, 2*cir.r, 2*cir.r)

	beginShape()
	for i in l:
		vertex(i[0],i[1])
		fill(0)
		ellipse(i[0],i[1], 10,10)
	noFill()
	endShape(CLOSE)







def mousePressed():
	while l:
		l.pop(-1)

	for i in range(3):
		a = (random(width),random(height))
		l.append(a)
