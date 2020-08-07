start = 50
def setup():
    # size(640, 480)
    fullScreen()
    colorMode(HSB, 360, 100, 100)
    background(0, 0,100)
    # noiseSeed(1400)
def draw():
    # PerlinIn1D()
    PerlinIn1D_2()
    # PerlinIn2D()
    
    
    
    
def PerlinIn2D():
    n = 160
    inc = width/n
    global off1, off2, start
    # off1 = start
    off1 = map(mouseX, 0, width, 0, -10)
    
    # background(0, 0,100)
    # noFill()
    noStroke()
    # fill(0,0,0)
    for x in range(0, width, inc):
        off2 = map(mouseY, 0, height, 0, -10)
        for y in range(0, width, inc):
            # f = map(noise(off1,off2, start), 0,1, 0, 100)
            f = map(noise(cos(off1), cos(off2), (start)), 0,1, 0, 100)
            # f = int(map(f, 0,100,0,2))*100
            f = int(map(f, 0,100,0,8))
            f = map(f, 0,8, -20, 300)
            # fill(0,0,f)
            fill(f, 100, 100)
            rect(x, y, inc, inc)
            off2 +=0.05
        off1+=0.05
    start+=0.05
    
def PerlinIn1D():
    global off1, start
    off1 = start
    background(0, 0,100)
    noFill()
    # noStroke()
    fill(0,0,0)
    beginShape()
    vertex(0, height/2)
    # vertex(0, height)
    for x in range(width):
        y = map(noise(off1), 0, 1, 0, height/2)
        sin_y = map(sin(off1+random(0.1)), -1, 1, 0, height/2)
        y = sin_y+y
        # unConstrain...
        y =constrain(y, 0, height/2)
        vertex(x, y)
        off1 += 0.005
    # vertex(width, height)
    vertex(width, height/2)
    start+=0.005
    endShape()
    
def PerlinIn1D_2():
    global off1, start
    off1 = start
    off2 = 0
    background(190, 90,100)
    noFill()
    noStroke()
    for y in range(height/20):
        fill(140,90,  y*5)
        beginShape()
        vertex(0, height)
        for x in range(width):
            hpt = map(noise(off1, off2), 0, 1, 0, height/2)
            hpt =constrain(hpt, 0, height/2)
            vertex(x, hpt+y*20)
            off1 += 0.005
        off2 += 0.005
        vertex(width, height)
        endShape()
    # vertex(width, height)
    # vertex(width, height/2)
    start+=0.005
    # endShape()
