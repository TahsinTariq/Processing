class voronoi:
    def __init__(self, number, w, h, 
                hue_ = (70, 150), 
                sat_mid =80, sat_thresh = 20, 
                bri_mid = 80, bri_thresh = 20):
        self.hue_ = hue_
        self.sat_mid = sat_mid
        self.bri_mid = bri_mid
        self.sat_thresh = sat_thresh
        self.bri_thresh = bri_thresh
        self.n = number
        self.w , self.h = w, h
    def preCalc(self):
        colorMode(HSB, 360,100,100)
        self.r = map(self.n, 100,1000,500, 200)
        self.points = []
        self.colors = []
        for i in range(self.n):
            self.points.append(PVector(random(1)*self.w, random(1)*self.h))
            self.colors.append((random(self.hue_[0],self.hue_[1]), 
                                self.sat_mid+random(-self.sat_thresh,self.sat_thresh), 
                                self.bri_mid+random(-self.bri_thresh,self.bri_thresh)))
        print("\n\nHue: " + str(self.hue_)+"\nSaturation: " + str(self.sat_mid)+"\nBrightness: "+ str(self.bri_mid))
    def show(self):
        for c, p in enumerate(self.points):
            fill(self.colors[c][0], self.colors[c][1], self.colors[c][2])
            ellipse(p.x,p.y, self.r,self.r)
    def update(self):
        self.r-=1
