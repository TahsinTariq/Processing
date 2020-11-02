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

def setup():
	global points, tri, videoExport, pg, r, factor
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

	pts = poisson_disc_samples(pg.width*2, pg.height+200, r=30, k=30)
	for p in pts:
		points.append([p[0], p[1]])

def draw():
	triangles = Delaunator(points)
	hull = convex_hull(points)
	# hull.append(convex_hull(points - hull))
	hull.append(convex_hull([item for item in points if item not in hull]))
	tri = triangles.get_triangles()

	pg.beginDraw()
	pg.colorMode(HSB, 360,100,100)
	pg.strokeWeight(2)
	pg.strokeCap(ROUND)
	pg.strokeJoin(ROUND)
	# pg.noFill()
	pg.fill(125)
	pg.background(0,0,100)
	# pg.translate(map(mouseX, 0, width, -width, width), mouseY)
	pg.translate(0, height/2, -500)
	pg.rotateX(PI/3)
	# pg.rotateZ(frameCount*0.01)
	pg.stroke(0, 100, 0)

	for t in range(len(tri)):
		pg.beginShape()
		for e in tri[t]:
			z = 0
			if e not in hull:
				z = noise(e[0]/factor, e[1]/factor)*maxHeight
			if not 50<e[0]<(width*2-50) and not 500<e[1]<(height+200-50):
				z = 0
			pg.fill(map(z, 0, 1, 0, 360), 75, 90)
			pg.vertex(map(e[0], 0, width*2, -width/2, width+ width/2), e[1], z)
		pg.endShape(CLOSE)

	for i in range(len(points)):
		points[i][0]+=map(mouseX, 0, width, -10, 10)
		points[i][1]+=map(mouseY, 0, height, -10, 10)
		if points[i][0]> width*2:
			points[i][0]-= width*2
		if points[i][0]<0:
			points[i][0]+= width*2
		if points[i][1]> height+200:
			points[i][1]-= height+200
		if points[i][1]<0:
			points[i][1]+= height+200

	pg.endDraw()
	image(pg, 0, 0)
	if rec:
		videoExport.saveFrame()

def quitvid():
	if rec:
		videoExport.endMovie()
		exit()