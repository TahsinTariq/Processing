t = 0

def x(t):
    return sin(t/10) * 100 + sin(t/5) * 50
def y(t):
    return cos(t/10) * 100
def x2(t):
    return sin(t/10)*100 + sin(t) * 2
def y2(t):
    return cos(t/20)*100 + cos(t/12) * 20

def setup ():
    size (500,500)
    background (20)

def draw ():
    global t
    stroke(255)
    strokeWeight(5)
    translate (width/2,height/2)
    background (20)

    for i in range(10):
        line (x(round(t+i)), y(round(t+i)),x2(round(t+i)), y2(round(t+i)))

    t = t + .5
