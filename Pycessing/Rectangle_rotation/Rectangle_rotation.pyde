from rectangle_set import *
r = PI/4
n  = 12
ran = 11

col = []
rol = []
def setup():
    size(800,800)
    background(255)
    rectMode(CENTER)
    colorMode(HSB, 360,100,100)
    global inst
    inst = []
    P = PVector(width/2, height/2)
    inst.append(rectSet(P, 5, 5, n))
    inst.append(rectSet(P, 5, 5, 8))
    # for i in range(ran):
    #     col.append(color(random(-50,100)+250, random(60,90), random(45,90)))
    #     rol.append(random(PI))
def draw():
    s = ran * 50
    strokeWeight(5)
    background(0,0,100)
    for i in inst:
        i.update()
    
    # global r
    # r+=PI/1024
    # strokeWeight(5)
    # pushMatrix()
    # translate(width/2, height/2)
    # # rotate(rol)
    # noFill()
    # for i in range(ran):
    #     # rotate(r)
    #     rotate(rol[i])
    #     rol[i]+= PI/512
    #     fill(col[i])
    #     rect(0,0, s, s, s/4)
    #     s-=50
    # popMatrix()
    # r+=1
def keyPressed():
    if key == 's':
        save("outputs/" + str(hour()) + "_" + str(minute()) +
             "_" + str(second()) + "_" + str(millis()) + ".jpg")
