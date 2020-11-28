w, h = 1000, 1000

colors = [[(188, 216, 193), (214, 219, 178), (227, 217, 133), (229, 122, 68)], [(219, 177, 188), (211, 196, 227), (143, 149, 211), (137, 218, 255)], [(191, 107, 99), (217, 163, 132), (91, 158, 166), (169, 212, 217)]]
random_colors = int(random(3))

def get_random_element(l):
    return l[int(random(len(l)))]


def deformed_circle(x, y, r, random_colors):
    pushMatrix()
    translate(x, y)
    
    points = []
    for i in range(0, 360, 15):
        points.append((r/2*sin(radians(i)), r/2*cos(radians(i))))
        
    # Create the deformed circle
    final = []
    for p in points:
        x_change = p[0] / 55.0
        y_change = p[1] / 55.0
        
        change = random(-3, 3)
        p = (p[0] + x_change * change, p[1] + y_change * change)
        final.append(p)
        
    # Create outline and deformed shape

    fill(*get_random_element(colors[random_colors]))
    strokeWeight(4)
    beginShape()
    for p in final:
        curveVertex(*p)
    curveVertex(*final[0])
    curveVertex(*final[1])
    curveVertex(*final[2])
    endShape()
    
    
    popMatrix()
    
def setup():
    size(w, h)
    pixelDensity(2)
    frameRate(1)

def draw():
    random_colors = int(random(3))
    background(*get_random_element(colors[random_colors]))
    strokeWeight(1)
    noFill()
    
    current_size = 900
    while (current_size >= 0):
        deformed_circle(w/2, h/2, current_size, random_colors)
        
        current_size -= 10
        
    # save("Examples/" + str(int(random(10000))) + ".png")
        
    
    
    
    
