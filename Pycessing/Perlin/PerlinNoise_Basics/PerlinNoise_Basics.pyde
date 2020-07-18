start = 0
def setup():
    size(640, 480)
    # fullScreen()
    colorMode(HSB, 360, 100, 100)
    background(0, 0,100)
    noiseSeed(1400)
def draw():
    # PerlinIn1D()
    PerlinIn2D()
    
    
    
    
def PerlinIn2D():
    n = 80
    inc = width/n
    global off1, off2, start
    off1 = start
    # off1 = 0
    
    # background(0, 0,100)
    # noFill()
    noStroke()
    # fill(0,0,0)
    for x in range(0, width, inc):
        off2 = 0
        for y in range(0, width, inc):
            f = map(noise(off2, off1), 0,1, 0, 100)
            fill(0,0,f)
            rect(x, y, inc, inc)
            off1 += 5
    start+=0.005
    
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
