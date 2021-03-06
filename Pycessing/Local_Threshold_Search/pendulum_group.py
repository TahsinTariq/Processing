class funky:
    def __init__(self,position, childNumber, parentRadius, angleMultiplier = 1):
        self.a = []
        self.angle = []
        self.colors = []
        self.position = position
        self.childNumber = childNumber
        self.parentRadius = parentRadius
        colorMode(HSB, 360,100,100)
        for i in range(self.childNumber):
            self.a.append(random(-500,500))
            self.angle.append(random(-0.5,0.5) * angleMultiplier)
            self.colors.append(color(random(-50,75)+300, random(70,90),random(85,95)))
    def show(self):
        pts = self.version1()
        noFill()
        beginShape()
        for p in pts:
            vertex(p.x, p.y)
        endShape()
    
    def version1(self):
        parentRadius = self.parentRadius
        temp3 = PVector(self.position.x, self.position.y)
        pts = []
        pts.append(PVector(self.position.x, self.position.y))
        for i in range(self.childNumber):
            temp = PVector(sin(radians(-self.a[i]))*parentRadius, cos(radians(-self.a[i]))*parentRadius)
            temp2 = PVector(temp3.x, temp3.y)
            temp3.add(temp)
            stroke(self.colors[i], 30)
            noFill()
            pts.append(temp2)
            # if i>1:
            #     line(temp2.x, temp2.y, temp3.x, temp3.y)
                
            parentRadius*=0.90
            self.a[i] += self.angle[i]
        return pts
            
