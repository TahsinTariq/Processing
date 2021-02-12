class Particle():
    """docstring for Particle"""
    def __init__(self, pos, maxSpeed = (2,4), hue_val = (0, 50), s_val = (70,90), v_val = (80,90)):
        self.pos = pos
        self.vel = PVector(0,0)
        self.acc = PVector(0,0)
        self.maxSpeed = random(maxSpeed[0], maxSpeed[1])
        self.pre = self.pos.copy()
        
        self.pre2 = self.pos.copy()
        self.pre3 = self.pos.copy()
        self.pre4 = self.pos.copy()
        colorMode(HSB, 360,100,100)
        self.col = color(random(hue_val[0], hue_val[1]), random(s_val[0], s_val[1]), random(v_val[0], v_val[1]))

    def show(self):
        pushStyle()
        strokeWeight(15)
        point(self.pos.x, self.pos.y)
        popStyle()

    def position(self):
        return self.pos
    
    def prePosition(self):
        return self.pre
    
    def allPos(self):
        return (self.pre2, self.pre3, self.pre4)
    
    def colors(self):
        return self.col 

    def update(self):
        self.pre2 = self.pre.copy()
        self.pre3 = self.pre2.copy()
        self.pre4 = self.pre3.copy()
        self.pre.x = self.pos.x
        self.pre.y = self.pos.y
        
        
        self.vel.add(self.acc)
        self.vel.limit(self.maxSpeed)
        self.pos.add(self.vel)
        self.acc.mult(0)
        self.edgeCases()
    
    def edgeCases(self):
        err = 5
        if self.pos.x < -err: self.pos.x = width+err
        if self.pos.x > width+err: self.pos.x = -err
        if self.pos.y < -err: self.pos.y = height+err
        if self.pos.y > height+err: self.pos.y = -err
        if abs(self.pre.x-self.pos.x) >= width or abs(self.pre.y-self.pos.y) >= height:
            self.pre.x = self.pos.x
            self.pre.y = self.pos.y
            self.pre2 = self.pre.copy()
            self.pre3 = self.pre2.copy()
            self.pre4 = self.pre3.copy()
            
        
    def followVec(self, vectors, gridSize):
        x = floor(self.pos.x / gridSize)
        y = floor(self.pos.y / gridSize)
        # print(x, y)
        f = vectors[x-1][y-1]
        self.acc = f
        # print(f)
