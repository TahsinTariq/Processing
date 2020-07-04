class chaikin:

    def __init__(self, ptsList, iteration=20, percent=20):
        self.ptsList = ptsList
        self.percent = percent/100.0
        self.iteration = iteration
        self.iter = []

    def show(self):
        for itered, iterList in enumerate(self.iter):
            stroke(50*itered/self.iteration, 100, 100,200*itered/self.iteration)
            beginShape()
            for i, pts in enumerate(iterList):
                vertex(pts[0], pts[1])
            endShape()

    def update(self):
        l = len(self.iter)
        if l == 0:
            self.iter.append(self.ptsList)
            return None
        if 0< l < self.iteration:
            self.iter.append([])
            for i in range(len(self.iter[l-1]) - 1):
                closestPoint_x = lerp(
                    self.iter[l-1][i][0], self.iter[l-1][i + 1][0], self.percent)
                closestPoint_y = lerp(
                    self.iter[l-1][i][1], self.iter[l-1][i + 1][1], self.percent)
                farthestPoint_x = lerp(
                    self.iter[l-1][i][0], self.iter[l-1][i + 1][0], 1- self.percent)
                farthestPoint_y = lerp(
                    self.iter[l-1][i][1], self.iter[l-1][i + 1][1], 1- self.percent)
                self.iter[l].append((closestPoint_x, closestPoint_y))
                self.iter[l].append((farthestPoint_x, farthestPoint_y))
        self.iter[l] = sorted(list(set(self.iter[l]))) 
        # print("From update: " +str(self.iter[l]))
