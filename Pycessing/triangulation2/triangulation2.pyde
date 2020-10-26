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
	size(1200,1200)
	# h = hour()
	# m = minute()
	s = second()
	mi = millis()
	# fullScreen()
	background(255)

	if rec:
		dst = "output/" + str(hour()) + "_" + str(minute()) +"_" + str(second()) + "_" + str(millis())
		# videoExport = VideoExport(this,dst+".mp4")
		videoExport = VideoExport(this)
		videoExport.startMovie()

	# noLoop()
	# frameRate(12)
	stroke(255)
	colorMode(HSB, 360,100,100)
	# for i in range(10000):
	# 	points.append((random(width),random(height)))
	# 	col.append(color(random(360), random(60,80), random(85,95)))
	points = poisson_disc_samples(width, height, r=20, k=30)
	print("points: ",  len(points))
	triangles = Delaunator(points)
	tri = triangles.get_triangles()
	# print(len(tri), int(len(tri)/10)*10)
	# tri2 = delunay(points)

def draw():
	global n, n2
	background(0)
	# p = float('inf')
	# println(p> 1)
	if n<= len(points):
		n+=10
	fill(0,0,100)
	for p in points[0:n]:
		ellipse(p[0], p[1], 5, 5)
	noFill()
	# stroke(0,100,100)

	if n>=len(points):
		if n2<int(len(tri)/10)*10:
			n2+=10
		else:
			print(n2)
			quitvid()
		strokeWeight(2)
		strokeCap(ROUND)
		strokeJoin(ROUND)
		for t in range(n2):
			# fill(col[t%100])
			beginShape()
			for e in tri[t]:
				vertex(e[0], e[1])
			endShape(CLOSE)

	# stroke(0,0,100)
	# strokeWeight(5)
	# for t in range(len(tri2)):
	# 	beginShape()
	# 	for e in tri2[t]:
	# 		vertex(e[0], e[1])
	# 	endShape(CLOSE)

	# try:
	# 	t = next(tri)
	# 	for i in range(len(t)):
	# 		fill(col[i])
	# 		beginShape()
	# 		for e in t[i]:
	# 			vertex(e[0], e[1])
	# 		endShape(CLOSE)
	# except:


	# s2 = second()
	# mi2 = millis()
	# print("second: ", s2-s)
	# print("millis: ", mi2-mi)
	# noLoop()
	if rec:
		videoExport.saveFrame()

	# exit()


def quitvid():
	if rec:
		videoExport.endMovie()
		exit()
