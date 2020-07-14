add_library('VideoExport')
from ball import *
n = 50
rec = False
def settings():
    global img
    img = loadImage("shaan.jpg")
    size(img.width, img.height)
def setup():
    background(255)
    global b, videoExport
    if rec:
        dst = str(hour()) + "_" + str(minute()) +"_" + str(second()) + "_" + str(millis())
        videoExport = VideoExport(this,dst+".mp4")
        videoExport.startMovie()
    b = Ball(PVector(660, 0), 2, vel_x = -0.5, vel_y = 5)
    
def draw():
    background(255)
    # image(img, 0,0)
    # b.update()
    
    # Y = b.pos.y
    # X = b.pos.x
    Y = mouseY
    X = mouseX
    y = map(Y, 0,height, 0,100)
    if X>width/2:
        x = map(X, width/2,width, 0.5,50)
    else:
        x = map(X, 0,width/2,0.001, .5)
    print(x,y)
    print(mouseX,mouseY)
    strokeWeight(1)
    noFill()
    for j in range(n):
        l = 0
        beginShape(LINES)
        for i in range(4*width):
            # ellipse(int(i), int(map(j, 0, n, 0, height)),5,5)
            c = img.get(i/4, int(map(j, 0, n, 0, height)))
            l += (255-blue(c))/255/4.0
            m = (255-red(c))/255.0
            w = (255-green(c))/255.0
            stroke(green(c))
            # strokeWeight(map(w, 0,255, 0,3))
            vertex(i/4, map((j+0.5)*height/n, 0, height, 0, height)+sin(l*PI/x)*y*decel(m))
    endShape()
    if rec:
        videoExport.saveFrame()
    # b.show()
def decel(i):
    return (1-(i-1)*(i-1))


def keyPressed():
    if key == 's':
        save("outputs/" + str(hour()) + "_" + str(minute()) +
             "_" + str(second()) + "_" + str(millis()) + ".jpg")
    if key == 'q':
        videoExport.endMovie()
        exit()
