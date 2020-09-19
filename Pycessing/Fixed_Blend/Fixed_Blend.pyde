r = 200
x = 0
def setup():
	global pg
	# size(640, 480)
	fullScreen()
	pg = createGraphics(width, height)
	background(255)
	pg.beginDraw()
	pg.fill(0)
	pg.ellipse(width/2, height/2, r, r)

	pg.endDraw()


def draw():
	global x
	x+=1
	# fill(255)
	for i in range(5):
		pushMatrix()
		translate(width/2,height/2)
		rotate(x*100+i*10)
		fill(map(x+i, 2*r, width/2, 255, 100))
		stroke(map(x+i, 0, height/2, 0, 255))
		ellipse(x+i,0, 50,50)
		popMatrix()
	# ellipse(mouseX, mouseY, 50, 50)
	pg.blendMode(DIFFERENCE)
	image(pg, 0,0)

def mousePressed():
	save("outputs/" + str(hour()) + "_" + str(minute()) +
             "_" + str(second()) + "_" + str(millis()) + ".jpg")