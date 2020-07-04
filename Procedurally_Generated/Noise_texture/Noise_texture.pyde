def setup():
    size(640,480)
    background(255)
def draw():
    background(0)
    rectMode(CORNERS)
    noStroke()
    # addNoise(75,100, 500,300)
    addNoise(0,0,width, height)
    fill(255)
    ellipse(width, -100, 500,500)
    makePlanet(375, 125, r= 50)
    makePlanet(390, 265, r= 30)
    makePlanet(100, 60, r= 70)
    makePlanet(70, 387, r= 100)
    # makePlanet(mouseX, mouseY, r= 30)

    
    # save("outputs/" + str(hour()) + "_" + str(minute()) +
    #          "_" + str(second()) + "_" + str(millis()) + ".png")
    noLoop()
    
def mousePressed():
    redraw()

def addNoise(a,s,d,f):
    c  =map(mouseX, 0, width, 0, 255)
    print(mouseX, mouseY)
    for i in range(a, d):
        for j in range(s, f):
            # fill(255, random(c))
            fill(255, random(31))
            rect(i, j, i+1, j+1)
def makePlanet(x, y,r,sun_x = 640, sun_y = -100):
    noFill()
    stroke(255)
    strokeWeight(5)
    d = dist(sun_x, sun_y,x, y)
    # print(d)
    arc(sun_x, sun_y, 2*d,2*d, 0, TWO_PI)
    noStroke()
    fill(255)
    ellipse(x, y, r,r)
