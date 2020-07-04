from Chaikin import *
pts = []
# pts = [(0,0), (640, 100), (0, 200), (640, 400)]
def setup():
    colorMode(HSB, 360,100,100)
    # size(640, 480)
    fullScreen()
    background(255)
    strokeWeight(5)
    for i in range(200):
        pts.append((random(width), random(height)))
    pts.sort()
    # print("Pts: " + str(pts))
    global c
    c = chaikin(pts, iteration = 200, percent = 50)
def draw():
    background(0,0,0)
    fill(0)
    noStroke()
    # for i in pts:
    #     ellipse(i[0],i[1], 20,20)
    noFill()
    l = len(c.iter)
    print(l)
    if l < c.iteration:
        c.update()
        delay(100)
    else:
         noLoop()   
    c.show()
    # noLoop()
