class block:

    def __init__(self, val):
        self.val = val
        self.pval = self.val
        self.dir = (0,-1)
        self.isDigit = isinstance(self.val, (int, float))
        if not self.isDigit:
        	if self.val == "n":
        		self.pval = -1
        	if self.val == "p":
        		self.pval = 1
        	if self.val == "b":
        		self.pval = "Wall"

    def showDir(self, i,j):
        a = self.dir
        pushMatrix()
        translate(i,j)
        if a[1] == 1:
            rotate(PI)
        rotate(HALF_PI * a[0])
        translate(0,-65)
        circle(0,0,20)
        popMatrix()
