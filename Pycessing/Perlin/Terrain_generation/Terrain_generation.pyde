add_library('VideoExport')

from delunator import *
from poissonDiskSampling import *
from convex_hull import *

points = []
tri = []
r = {}
rec = False
factor = 300
maxHeight = 500
scale = 0.5
rx = 0
def setup():
	global points, tri, videoExport, pg, r, factor, scale
	fullScreen(P3D)

	if rec:
		dst = "output/" + str(hour()) + "_" + str(minute()) +"_" + str(second()) + "_" + str(millis())
		# videoExport = VideoExport(this,dst+".mp4")
		videoExport = VideoExport(this)
		videoExport.startMovie()

	stroke(255)
	strokeWeight(2)
	strokeCap(ROUND)
	strokeJoin(ROUND)
	colorMode(HSB, 360,100,100)
	pg = createGraphics(width, height, P3D)
	pg.beginDraw()
	pg.colorMode(HSB, 360,100,100)
	pg.stroke(0, 100, 0)
	pg.strokeWeight(2)
	pg.strokeCap(ROUND)
	pg.strokeJoin(ROUND)
	pg.fill(125)
	pg.endDraw()

	pts = poisson_disc_samples(pg.width*2, pg.height+200, r=30, k=30)
	for p in pts:
		points.append([p[0], p[1]])
	points.append([0,0])
	points.append([0,height])
	points.append([width,0])
	points.append([width, height])

def draw():
	triangles = Delaunator(points)
	# hull = convex_hull(points)
	# hull.append(convex_hull(points - hull))
	# hull.append(convex_hull([item for item in points if item not in hull]))
	tri = triangles.get_triangles()
	pg.beginDraw()

	pg.background(0,0,100)
	pg.scale(scale)
	# X = map(mouseX, 0, width, -width, width)
	# pg.translate(0, mouseY)

	pushMatrix()
	pg.translate(map(mouseX, 0, width, -width, width), mouseY,0)
	# pg.sphere(200)
	pg.fill(125, 50)
	pg.rect(0,0,pg.width, pg.height)
	popMatrix()

	# print("translate : " + str(X)+ " " + str(mouseY))
	# pg.translate(width/2, height/2, -500)
	# pg.translate(0, 0, -mouseX)
	pushMatrix()
	translate(width/2, height/2)
	pg.sphere(200)
	pg.rotateX(rx)
	popMatrix()
	# pg.rotateZ(frameCount*0.01)
	pg.stroke(0, 100, 0)

	for t in range(len(tri)):
		pg.beginShape()
		for e in tri[t]:
			z = 0
			zoff = 0
			# if e not in hull:
			# zoff = map(mouseX, 0, width, 0, 5000)
			# z = noise((e[0])/factor, e[1]/factor, zoff/factor)*maxHeight
			# if not 50<e[0]<(width*2-50) and not 50<e[1]<(height+200-50):
			# 	z = 0
			zcol = map(z, 0, maxHeight, 0, 360)
			pg.fill(zcol, 75, 90)
			xpos = map(e[0], 0, width*2, -width/2, width+ width/2)
			ypos = map(e[1], 0, height+200, -200, height)
			pg.vertex(xpos, ypos, z)
		pg.endShape(CLOSE)

	updatePoints()

	pg.endDraw()
	image(pg, 0, 0)
	if rec:
		videoExport.saveFrame()

def updatePoints():
	for i in range(len(points)):
		# points[i][0]+=map(mouseX, 0, width, -10, 10)
		# points[i][1]+=map(mouseY, 0, height, -10, 10)
		if points[i][0]> width*2:
			points[i][0]-= width*2
		if points[i][0]<0:
			points[i][0]+= width*2
		if points[i][1]> height+200:
			points[i][1]-= height+200
		if points[i][1]<0:
			points[i][1]+= height+200

def quitvid():
	if rec:
		videoExport.endMovie()
		exit()


def keyPressed():
	global scale, rx
	if key=='q':
		scale*=0.90
	if key=='e':
		scale/=0.90
	if key=='w':
		rx+=PI/10
	if key=='s':
		rx-=PI/10
	print("Scale :" + str(scale))