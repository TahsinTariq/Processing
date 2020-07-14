add_library('VideoExport')
from pendulum_group import *
distance = 100
r = 20
sPts = []
colors = []
n = 500     
rec = True 
numberOfWalkers = 10  
def setup():
    # size(640, 480)
    fullScreen()
    background(0)
    colorMode(HSB, 360,100,100)
    global videoExport, c
    if rec:
        dst = str(hour()) + "_" + str(minute()) +"_" + str(second()) + "_" + str(millis())
        videoExport = VideoExport(this,dst+".mp4")
        videoExport.startMovie()
    for i in range(n):
        sPts.append(PVector(random(width), random(height)))
        colors.append(PVector(random(360), random(70,90), random(85, 90)))
    c = []
    for i in range(numberOfWalkers):
        # c .append(funky(PVector(width / 2, height / 2), 5, 200))
        c .append(funky(PVector(192*i, height / 2), 5, 200))
def draw():
    background(0)
    # x = mouseX
    # y = mouseY
    # xy = c[0].version1()
    # x = xy[-1][0]
    # y = xy[-1][1]
    for pen in c:
        xy = pen.version1()
        x = xy[-1][0]
        y = xy[-1][1]
        for pts, col in zip(sPts, colors):
            d = dist(x, y, pts.x, pts.y)
            if d < distance:
                fill(col.x, col.y, col.z, map(d ,0,distance,360,0))
                stroke(0,0,100)
                if mousePressed or rec:
                    line(x, y, pts.x, pts.y)
                    noStroke()
                    # ellipse(pts.x, pts.y, r,r)
    fill(0,0,100)
    if rec:
        videoExport.saveFrame()
    # ellipse(mouseX, mouseY, r, r)
def keyPressed():
    if key =="w":
        background(0)
    if key == 'q':
        videoExport.endMovie()
        exit()
