n = 500
r = 75
def setup():
    size(825,825)
    background(255)
def draw():
    # type1()
    type2()
def mousePressed():
    redraw()
    
def type2():
    background(255)
    noLoop()
    noStroke()
    for i in range(r, width, r):
        for j in range(r, height, r):
            fill(int(random(2))*255)
            # fill(0)
            ellipse(i,j, r,r)
            if random(1)>0.25 and ((i-r/2)/r)%2 == 0 and ((j-r/2)/r)%2 == 0:
                fill(int(random(2))*255)
                # fill(255)
                ellipse(i+r/2, j+r/2, r,r)
    # filter(BLUR,5)       +random(-r/4,0)     and ((i-r/2)/r)%2 == 0     random(1)>0.75 and 
    
def type1():
    background(255)
    noLoop()
    noStroke()
    for i in range(r/2, width, r):
        for j in range(r/2, height, r):
            fill(int(random(2))*255)
            ellipse(i,j, r,r)
            # ellipse(random(width), random(height), r,r)
    filter(BLUR,5)
    
def keyPressed():
    if key == 's':
        save("outputs/" + str(hour()) + "_" + str(minute()) +
             "_" + str(second()) + "_" + str(millis()) + ".jpg")
