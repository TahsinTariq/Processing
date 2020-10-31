add_library('VideoExport')

from delunator import *
from poissonDiskSampling import *
# from delunayUsingHull import *
# points = [(1,2), (3,8), (6, 10), (7,5), (8,9)]
points = []
tri = []
tri2 = []
col = []
n = 0
n2 = 0
h, m, s, mi = 0,0,0,0
rec = False
def setup():
	global triangles, points, tri, col, tri2, h, m, s, mi, n, videoExport
	# size(640,480)
	# size(1200,1200)
	# h = hour()
	# m = minute()
	s = second()
	mi = millis()
	fullScreen()
	background(255)

	if rec:
		dst = "output/" + str(hour()) + "_" + str(minute()) +"_" + str(second()) + "_" + str(millis())
		# videoExport = VideoExport(this,dst+".mp4")
		videoExport = VideoExport(this)
		videoExport.startMovie()

	stroke(255)
	colorMode(HSB, 360,100,100)
	# for i in range(10000):
	# 	points.append((random(width),random(height)))
		# col.append(color(random(360), random(60,80), random(85,95)))

	points = poisson_disc_samples(width, height, r=50, k=30)
	# points = [(212.9808914965057, 343.53093953960195), (395.3985559096435, 868.0178032991112), (522.175139547924, 179.5220465736472), (583.6915850791283, 572.9826610428377), (866.0022315529168, 244.96615099406287), (883.4946980451499, 934.856196648084), (933.3507409663016, 588.4252872530875)]
	print("points: ",  len(points))
	triangles = Delaunator(points)
	tri = triangles.get_triangles()
	# print(len(tri), int(len(tri)/10)*10)
	# tri2 = delunay(points)

def draw():
	# noLoop()
	global n, n2
	background(0)
	translate(mouseX, mouseY)
	# if n<= len(points):
	# 	n+=1
	fill(0,0,100)
	for p in points:
		ellipse(p[0], p[1], 5, 5)
	noFill()

	strokeWeight(2)
	strokeCap(ROUND)
	strokeJoin(ROUND)
	for t in range(len(tri)):
		beginShape()
		for e in tri[t]:
			vertex(e[0], e[1])
		endShape(CLOSE)


	# s2 = second()
	# mi2 = millis()
	# print("second: ", s2-s)
	# print("millis: ", mi2-mi)
	# noLoop()
	if rec:
		videoExport.saveFrame()

def quitvid():
	if rec:
		videoExport.endMovie()
		exit()
