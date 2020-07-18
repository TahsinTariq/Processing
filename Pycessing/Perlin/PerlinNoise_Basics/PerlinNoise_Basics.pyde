start = 0
def setup():
    size(640, 480)
    # fullScreen()
    colorMode(HSB, 360, 100, 100)
    background(0, 0,100)
    noiseSeed(1450)
    # noSoff1roke()
def draw():
    # noiseSeed(mouseX)
    # print(mouseX)
    global off1, start
    off1 = start
    background(0, 0,100)
    noFill()
    # fill(random(-5, 5) + 70, 70, frameCounoff1 * 5)
    fill(0,0,0)
    beginShape()
    vertex(0, height/2)
    # vertex(0, height)
    for x in range(width):
        y = map(noise(off1), 0, 1, 0, height/2)
        sin_y = map(sin(off1), -1, 1, 0, height/2)
        y = sin_y+y
        # unConstrain...
        y =constrain(y, 0, height/2)
        vertex(x, y)
        off1 += 0.005
    # vertex(width, height)
    vertex(width, height/2)
    start+=0.05
    endShape()
