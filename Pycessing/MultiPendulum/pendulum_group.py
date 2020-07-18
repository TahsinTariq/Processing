class funky:
    def __init__(self,position, childNumber, parentRadius):
        self.a = []
        self.angle = []
        self.colors = []
        self.position = position
        self.childNumber = childNumber+1
        self.parentRadius = parentRadius
        colorMode(HSB, 360,100,100)
        for i in range(self.childNumber):
            self.a.append(random(-500,500))
            self.angle.append(random(-0.5,0.5))
            self.colors.append(color(random(360), random(50,70),random(70,90)))
    def show(self):
        pts = self.version1()
        noFill()
        for i in range(len(pts)-1):
            stroke(self.colors[i], 30)
            if i>2:
                line(pts[i].x, pts[i].y, pts[i+1].x, pts[i+1].y)
    
    def version1(self):
        parentRadius = self.parentRadius
        temp3 = PVector(self.position.x, self.position.y)
        pts = []
        pts.append(PVector(self.position.x, self.position.y))
        for i in range(self.childNumber):
            temp = PVector(sin(radians(-self.a[i]))*parentRadius, cos(radians(-self.a[i]))*parentRadius)
            temp2 = PVector(temp3.x, temp3.y)
            temp3.add(temp)
            pts.append(temp2)
            parentRadius*=0.90
            self.a[i] += self.angle[i]
        return pts
            
