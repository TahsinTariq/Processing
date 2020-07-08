from voronoi_class import *
def setup():
    # size(640, 480)
    fullScreen()
    frameRate(120)
    background(255)
    noStroke()
    global v
    v = voronoi(100, width, height, hue_=setHueRange(),
                sat_mid=setSatMid(), bri_mid=setBriMid())
    v.preCalc()
def draw():
    if v.r >= 0:
        v.update()
    else:
        save("outputs/" + str(hour()) + "_" + str(minute()) +
             "_" + str(second()) + "_" + str(millis()) + ".jpg")
        v.hue_ = setHueRange()
        v.sat_mid = setSatMid()
        v.bri_mid = setBriMid()
        v.preCalc()
        # noLoop()
    v.show()


def setHueRange():
    return (random(360), random(360))
def setSatMid():
    return random(20, 50)
def setBriMid():
    return random(30, 80)
