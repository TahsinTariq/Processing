

def setup():
	global points, pg
	# size(640,640, P3D)
	fullScreen(P3D, 2)
	# fullScreen()
	background(0)
	pg = createGraphics(width, height, P3D)


def draw():
	background(255)
	noFill()
	# rotateX(PI/3)
	# translate(mouseX, mouseY)
	stroke(255)

	pg.beginDraw()
	pg.background(0)
	pg.noFill()
	pg.translate(mouseX, mouseY)
	pg.colorMode(HSB, 360,100,100)
	pg.fill(map(mouseX, 0, width, 0,360), 80,90)
	pg.ellipse(0,0, 50,50)
	pg.stroke(255)

	fill(255, 0, 0, 150)
	pg.beginShape()
	pg.fill(255, 0, 0)
	pg.vertex(100, 100)
	pg.fill(0,255, 0)
	pg.vertex(0,700)
	pg.fill(255)
	pg.vertex(700,700)
	pg.fill(0, 0, 255)
	pg.vertex(700,0)
	pg.endShape(CLOSE)
	pg.endDraw()

	image(pg, 0 ,0)

	# noLoop()