from delunator import *
from delunayUsingHull import *
# points = [(1,2), (3,8), (6, 10), (7,5), (8,9)]
points = []
tri = []
tri2 = []
col = []

def setup():
	global triangles, points, tri, col, tri2
	# size(640,480)
	size(640,640)
	# fullScreen()
	background(255)
	# noLoop()
	frameRate(12)
	stroke(255)
	colorMode(HSB, 360,100,100)
	for i in range(100):
		points.append((random(width),random(height)))
		col.append(color(random(360), random(60,80), random(85,95)))
	triangles = Delaunator(points)
	tri = triangles.get_triangles()
	tri2 = delunay(points)

def draw():
	background(0)
	# p = float('inf')
	# println(p> 1)
	fill(0,0,100)
	for p in points:
		ellipse(p[0], p[1], 10,10)
	noFill()
	stroke(0,100,100)
	strokeWeight(5)
	for t in range(len(tri)):
		# fill(col[t%100])
		beginShape()
		for e in tri[t]:
			vertex(e[0], e[1])
		endShape(CLOSE)
	stroke(0,0,100)
	strokeWeight(1)
	for t in range(len(tri2)):
		beginShape()
		for e in tri2[t]:
			vertex(e[0], e[1])
		endShape(CLOSE)

	# try:
	# 	t = next(tri)
	# 	for i in range(len(t)):
	# 		fill(col[i])
	# 		beginShape()
	# 		for e in t[i]:
	# 			vertex(e[0], e[1])
	# 		endShape(CLOSE)
	# except:
	noLoop()
	# for t in tri:

