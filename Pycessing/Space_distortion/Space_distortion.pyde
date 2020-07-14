obj = []
def setup():
    size(640,480, P3D)
    for i in range(50):
        x = random(-2*width,2*width)
        y = random(height)
        z = random(-500,-100)
        obj.append((x, y,z))
def draw():
    background(255)
    lights()
    Z = map(mouseX, 0, width, -200,200)
    # noStroke()
    stroke(255)
    fill(0)
    pushMatrix()
    for o in obj:
        pushMatrix()
        translate(o[0], o[1], o[2])
        rotateY(1.25)
        rotateX(-0.4)
        box(50)
        popMatrix()
    rotateZ(mouseX)
    rotateX(mouseY)
    popMatrix()
    # # noFill()
    # stroke(255)
    # pushMatrix()
    # translate(500, height*0.35, Z)
    # sphere(280)
    # popMatrix()