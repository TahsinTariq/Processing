def setup():
    global img, mas

    size(640,480)
    
def draw():
    global img, mas

    background(255,0,0)
    img = createGraphics(width, height)
    mas = createGraphics(width, height)
    img.beginDraw()
    img.background(0,255, 0)
    img.ellipse(mouseX, mouseY, 10,20)
    img.endDraw()
    mas.beginDraw()
    mas.noStroke()
    mas.circle(width/2, height/2, min(width, height))
    mas.endDraw()
    img.mask(mas)
    image(img, 0,0)
