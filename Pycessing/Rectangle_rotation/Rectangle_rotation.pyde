r = PI/4
ran = 11

col = []
rol = []
def setup():
    size(800,800)
    background(255)
    rectMode(CENTER)
    colorMode(HSB, 360,100,100)
    for i in range(ran):
        col.append(color(random(-50,100)+250, random(60,90), random(45,90)))
        rol.append(random(PI))
def draw():
    s = ran * 50
    background(0,0,100)
    global r
    r+=PI/1024
    strokeWeight(5)
    pushMatrix()
    translate(width/2, height/2)
    rotate(r)
    noFill()
    for i in range(ran):
        # rotate(r)
        rotate(rol[i])
        rol[i]+= PI/1024
        fill(col[i])
        rect(0,0, s, s, s/4)
        s-=50
    popMatrix()
    # r+=1
