class rectSet:
    def __init__(self, position, edgeLength, radius, numberOfRect , rotation = lambda x:random(PI)):
        rectMode(CENTER)
        colorMode(HSB, 360,100,100)
        self.pos = position
        self.edge = edgeLength
        self.r = radius
        self.n = numberOfRect
        self.colors = []
        self.rot = []
        for i in range(self.n):
            # self.rot.append(rotation(1))
            self.rot.append(random(PI))
            self.colors.append(color(random(360), random(60,90), random(45,90)))
        
    def show(self):
        pass
    def update(self):
        edge = self.edge
        pushMatrix()
        translate(self.pos.x, self.pos.y)
        for i in range(self.n):
            # rotate(self.rot[i])
            self.rot[i]+= PI/1024
            fill(self.colors[i])
            rect(0,0, edge,edge, edge/4)
            edge-=50
        popMatrix()
