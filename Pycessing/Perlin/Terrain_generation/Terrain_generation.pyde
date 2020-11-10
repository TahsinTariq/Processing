add_library('VideoExport')

from delunator import *
from poissonDiskSampling import *
from convex_hull import *

points = []
tri = []
rec = True
factor = 300
maxHeight = 500
scale = 1
x_rot = PI/3
z_rot = [False, 0 ,0]
perspective = [False, 10]
noise_offset = [ 0, 0, 0]

def setup():
	global points, tri, videoExport, pg, pg2, factor, scale, delunay_size
	fullScreen(P3D, 2)
	background(0,0,255)

	delunay_size = (width*2, height+200)

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
	pg.fill(0, 0,100)
	pg.endDraw()

	pg2 = createGraphics(width, height, P3D)
	pg2.beginDraw()
	pg2.colorMode(HSB, 360,100,100)
	pg2.stroke(0, 100, 0)
	pg2.strokeWeight(2)
	pg2.strokeCap(ROUND)
	pg2.strokeJoin(ROUND)
	pg2.fill(0, 100, 0)
	pg2.background(0, 100, 100)
	# pg.clear()
	pg2.endDraw()

	pts = poisson_disc_samples(delunay_size[0], delunay_size[1], r=100, k=30)
	for p in pts:
		points.append([p[0], p[1]])
	points.append([0,0])
	points.append([0,height])
	points.append([width,0])
	points.append([width, height])

def draw():
	triangles = Delaunator(points)
	tri = triangles.get_triangles()
	pg.beginDraw()
	# pg.clear()

	pg.background(0, 0,100)
	pg.scale(scale)
	pg.stroke(0, 100, 0)
	# pg.fill(0, 0,100)

	pg2.beginDraw()
	pg2.background(0, 0, 0)
	# pg2.ellipse(width/2, height/2, 500,500)
	pg2.scale(scale)
	pg2.stroke(0, 0, 100)

	pg.pushMatrix()
	pg.translate(width/2, height)
	pg.rotateX(x_rot)
	pg.translate(0, -height/2)

	pg2.pushMatrix()
	pg2.translate(width/2, height)
	pg2.rotateX(x_rot)
	pg2.translate(0, -height/2)
	if z_rot[0]:
		z_rot[2] = z_rot[2] + z_rot[1]*0.1
	pg.rotateZ(z_rot[2])

	pg2.rotateZ(z_rot[2])
	updateNoise()
	for t in range(len(tri)):
		pg.beginShape()

		pg2.beginShape()
		for e in tri[t]:

			if not perspective[0]:
				perspective[1] = map(mouseX, 0, width, 1, (delunay_size[1]-height)/5)
			else: noise_offset[2] = map(mouseX, 0, width, 0, 5000)

			# z = noise((e[0])/factor, e[1]/factor, noise_offset[]/factor)*maxHeight
			z = noise((e[0]+noise_offset[0])/factor, (e[1]+noise_offset[1])/factor, noise_offset[2]) * maxHeight

			shiftY = 10
			if e[0] < shiftY or e[0] > delunay_size[0] -shiftY or e[1] < shiftY or e[1] > delunay_size[1] -shiftY:
				z = 0

			zcol = map(z, 0, maxHeight, 130, 340)
			# pg.fill(zcol, 75, 90)
			# pg2.fill(0, 75, 90)
			xpos = map(e[0], 0, delunay_size[0], -delunay_size[0]/2, delunay_size[0]/2)
			ypos = map(e[1], 0, delunay_size[1], height/2-delunay_size[1]-shiftY*perspective[1], height/2 +shiftY*perspective[1])
			pg.vertex(xpos, ypos, z)

			pg2.vertex(xpos, ypos, z)
		pg2.endShape(CLOSE)
		pg.endShape(CLOSE)

	pg2.popMatrix()
	pg.popMatrix()


	updatePoints()

	pg2.endDraw()
	pg.endDraw()
	# pg2.background(pg)

	image(pg, 0, 0)

	image(pg2.get(width/2, 0, width/2, height), width/2, 0)
	# image(pg.get(0, 0, width/2, height), 0, 0)
	if rec and frameCount>20:
		videoExport.saveFrame()

def updatePoints():
	for i in range(len(points)):
		if key=='x':
			points[i][0]-=10
		if key=='X':
			points[i][0]-=10
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
	global scale, x_rot, perspective
	if key=='q':
		scale*=0.90
	if key=='e':
		scale/=0.90
	if key=='w':
		x_rot+=PI/30
	if key=='s':
		x_rot-=PI/30
	if key=='a':
		z_rot[0] = not z_rot[0]
		z_rot[1] += PI/30
	if key=='d':
		z_rot[0] = not z_rot[0]
		z_rot[1] -= PI/30
	if key=='p':
		perspective[0] = not perspective[0]
	if key=='v':
		quitvid()
	if key=='c':
		save("output/" + str(hour()) + "_" + str(minute()) +"_" + str(second()) + "_" + str(millis())+".png")
	# print("Scale :" + str(scale))

def updateNoise():
	if key=='x':
		noise_offset[0] += 10
	if key=='X':
		noise_offset[0] -= 10
	if key=='y':
		noise_offset[1] += 10
	if key=='Y':
		noise_offset[1] -= 10
	if key=='z':
		noise_offset[2] += 0.01
	if key=='Z':
		noise_offset[2] -= 0.01