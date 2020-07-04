from convex_hull import *
r = 10

point_list = []
def setup():
    size(640, 480)
    # fullScreen(P2D, 2)
    background(255)
    for i in range(100):
        point_list.append((random(1) * width, random(1) * height))
def draw():
    colorMode(HSB, 360,100,100)
    background(0,0,100)
    noFill()
    for p in point_list:
        ellipse(p[0],p[1], r,r)
    # single_hull()
    recursive_hull()

def single_hull():
    pts = convex_hull(point_list)
    # fill(0,0,50,10)
    beginShape()
    for p in pts:
        vertex(p[0], p[1])
    endShape(CLOSE)
    
def recursive_hull():
    noStroke()
    copiedList = point_list
    while len(copiedList) >= 1:
        pts = convex_hull(copiedList)
        fill(map(len(copiedList),0,len(point_list), 0,360), 90,85,100)
        beginShape()
        for p in pts:
            vertex(p[0], p[1])
        endShape(CLOSE)
        copiedList = list(set(copiedList) - set(pts))
        noLoop()
