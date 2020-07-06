add_library('VideoExport')
import os
from ball import *
def setup():
    size(800, 800)
    background(255)
    global p, ball
    global videoExport
    dst = str(hour()) + "_" + str(minute()) + "_" + \
        str(second()) + "_" + str(millis())
    videoExport = VideoExport(this, dst + ".mp4")
    videoExport.startMovie()
    ball = []
    p = createGraphics(800, 800)
    for i in range(200):
        ball.append(Ball(PVector(random(width), random(height)), 2))

def draw():
    stroke(0, 20)
    p.beginDraw()
    p.background(255)
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
    videoExport.saveFrame()
def keyPressed():
    if key == 's':
        save("outputs_ballBounce/" + str(hour()) + "_" + str(minute()) +
             "_" + str(second()) + "_" + str(millis()) + ".jpg")
    if key == 'q':
        videoExport.endMovie()
        exit()
