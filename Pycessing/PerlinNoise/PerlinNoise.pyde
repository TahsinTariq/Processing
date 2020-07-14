t = 0
def setup():
    size(640,480)
    background(255)
    
def draw():
    t=0
    beginShape()
    for x in range(width):
        y = map(noise(t), 0, 1, 0, height)
        vertex(x, y)
        t+=0.005
    endShape()
