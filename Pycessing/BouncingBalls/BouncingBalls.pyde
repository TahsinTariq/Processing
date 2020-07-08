add_library('VideoExport')
import os
from ball import *
rec = False
def setup():
    size(800, 800)
    # fullScreen()
    background(255)
    global p, ball
    if rec:
        global videoExport
        dst = str(hour()) + "_" + str(minute()) + "_" + \
            str(second()) + "_" + str(millis())
        videoExport = VideoExport(this, dst + ".mp4")
        videoExport.startMovie()
    ball = []
    p = createGraphics(width, height)
    for i in range(100):
        ball.append(Ball(PVector(random(width), random(height)), 2))

def draw():
    stroke(0, 20)
    p.beginDraw()
    p.background(255,20)
    p.endDraw()
    image(p, 0, 0)
    for b in ball:
        b.update()
        for other in ball:
            if b is not other:
                d = dist(b.pos.x, b.pos.y, other.pos.x, other.pos.y)
                if d < 80:
                    line(b.pos.x, b.pos.y, other.pos.x, other.pos.y)
        # noStroke()
        # b.show()
        # stroke(0,20)
    print(frameCount)
    if rec:
        videoExport.saveFrame()
def keyPressed():
    if key == 's':
        save("outputs_ballBounce/" + str(hour()) + "_" + str(minute()) +
             "_" + str(second()) + "_" + str(millis()) + ".jpg")
    if key == 'q':
        videoExport.endMovie()
        exit()
