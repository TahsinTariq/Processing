add_library('VideoExport')
import os
from pendulum_group import *
l = 200
number = 4
rec = False
def setup():
    blendMode(MULTIPLY)
    # size(640,480)
    fullScreen()
    global c, videoExport
    if rec:
        dst = str(hour()) + "_" + str(minute()) +"_" + str(second()) + "_" + str(millis())
        videoExport = VideoExport(this,dst+".mp4")
        videoExport.startMovie()
    c = []
    c .append(funky(PVector(width / 2, height / 2), number, l))
    colorMode(HSB, 360, 100, 100)
    background(0, 0, 100)

def draw():
    strokeWeight(2)
    for i in c:
        i.show()
    if rec:
        videoExport.saveFrame()
def keyPressed():
    if key == 's':
        save("outputs/" + str(hour()) + "_" + str(minute()) +
             "_" + str(second()) + "_" + str(millis()) + ".jpg")
    if key == 'n':
        c.remove(c[0])
        c.append(funky(PVector(width / 2, height / 2), number, l))
    if key == 'c':
        background(0, 0, 100)
        c.remove(c[0])
        c.append(funky(PVector(width / 2, height / 2), number, l))
    if key == 'q':
        videoExport.endMovie()
        # dst = str(hour()) + "_" + str(minute()) +"_" + str(second()) + "_" + str(millis())
        # os.rename(r'E:\Programme outputs\Processing\Pycessing\MultiPendulum\processing-movie.mp4',
        #           r'E:\Programme outputs\Processing\Pycessing\MultiPendulum\outputs\\'+dst+'.mp4')
        exit()
