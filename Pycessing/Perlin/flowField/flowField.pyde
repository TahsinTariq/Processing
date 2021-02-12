add_library('VideoExport')

from particles import Particle
from poissonDiskSampling import *

n = 2500
gridDensity = 40
rec = False
zoff = 0
pts = []


def setup():
    global gridDensity, gridSize, videoExport, pg, n
    size(640, 480, P3D)
    # fullScreen(P3D, 2)
    colorMode(HSB, 360,100,100)
    background(0,0,0)
    frameRate(120)
    pg = createGraphics(width, height, P3D)
    pg.colorMode(HSB, 360,100,100)
    # pg.blendMode(BLEND)
    pg.strokeCap(ROUND)
    pg.strokeJoin(ROUND)
    # pg.strokeWeight(0.5)

    if rec:
        dst = "output/video_{}_{}_{}_{}".format(hour(), minute(), second(), millis())
        # Saving only.................................PGraphics!
        videoExport = VideoExport(this, dst + ".mp4", pg)
        videoExport.setQuality(100, 0)
        videoExport.setFrameRate(60)
        videoExport.startMovie()

    gridSize = width / gridDensity if width < height else height / gridDensity
    # print(gridSize)
    
    # for i in range(1000):
    #     pts.append(Particle(PVector(random(width), random(height))))
    createPoints(n)

def createPoints(n, effect_radius = 50, hue_val = (180, 360), s_val = (40,95), v_val = (65,95)):
    global pts
    # pts = []
    if len(pts)<n:
        points = poisson_disc_samples(width, height, r = effect_radius, k=30)
        for p in points:
            pts.append(Particle(PVector(p[0], p[1]), hue_val = hue_val, maxSpeed = (4,6)))
    else: pts = pts[150 : n]
        
def draw():
    global zoff
    zoff += 0.008
    
    # background(0,0,100)
    pg.beginDraw()
    # pg.background(0,0,0,5)
    pg.fill(0,0,0,5)
    pg.noStroke()
    pg.rect(0,0,width,height)
    if frameCount%100 ==0: 
        createPoints(n)
        # pg.fill(0,0,100,1)
        # pg.rect(0,0,width,height)
    flowfield = []
    xoff = 0
    for i in range(0, width, gridSize):
        flowfield.append([])
        yoff = 0
        for j in range(0, height, gridSize):
            angle = noise(xoff, yoff, zoff) * TWO_PI
            vector = PVector.fromAngle(angle)
            vector.setMag(1)
            flowfield[-1].append(vector)
            
            pg.pushMatrix()
            pg.translate(i + gridSize/2, j + gridSize/2)
            pg.rotate(angle)
            # pg.line(0,0, gridSize/2, gridSize/2)
            pg.popMatrix()
            
            yoff += 0.15
        xoff += 0.15
        
    for p in pts:
        p.followVec(flowfield, gridSize)
        p.update()
        pos = p.position()
        pre = p.prePosition()
        c = p.colors()
        pre2,pre3,pre4 = p.allPos()
        pg.pushStyle()
        
        pg.strokeWeight(5)
        pg.stroke(0)
        pg.beginShape()
        pg.curveVertex(pos.x, pos.y)
        pg.curveVertex(pre.x, pre.y)
        pg.curveVertex(pre2.x, pre2.y)
        pg.curveVertex(pre3.x, pre3.y)
        pg.curveVertex(pre4.x, pre4.y)
        pg.endShape()
        # pg.point(pos.x, pos.y)
        # pg.line(pre.x, pre.y, pos.x, pos.y)
        pg.strokeWeight(3)
        pg.stroke(c)
        pg.beginShape()
        pg.curveVertex(pos.x, pos.y)
        pg.curveVertex(pre.x, pre.y)
        pg.curveVertex(pre2.x, pre2.y)
        pg.curveVertex(pre3.x, pre3.y)
        pg.curveVertex(pre4.x, pre4.y)
        pg.endShape()
        
        pg.popStyle()
        
    pg.endDraw()
    pg.blendMode(BLEND)
    image(pg, 0, 0)
    
    # print(frameRate)

    if rec:
        videoExport.saveFrame()
    # noLoop()


def mousePressed():
	
	pass

def keyPressed():
    if key == 's':
        save("output/" + str(hour()) + "_" + str(minute()) +"_" + str(second()) + "_" + str(millis())+".png")
            
    if key == 'q':
        if rec:
            videoExport.endMovie()
            exit()
