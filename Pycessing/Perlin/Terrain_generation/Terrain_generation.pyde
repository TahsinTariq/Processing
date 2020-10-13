gridRadius = 10
incrementRate = 0.1
s = 0

def setup():
	size(640, 480)
	background(0)

def draw():
	global s
	# noFill()
	stroke(255)
	incrementRate = map(mouseX, 0, width,0.1, 0.5 )
	xoffset = s
	for x in range(height):
		yoffset = 0
		for y in range(width):
			yoffset+=incrementRate
			fillColor = map(noise(xoffset, yoffset), 0, 1, 0, 255)
			fill(fillColor)
			rect(x*gridRadius, y*gridRadius, gridRadius, gridRadius)
		xoffset+=incrementRate
	s+=2