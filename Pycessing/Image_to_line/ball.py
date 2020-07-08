class Ball:

    def __init__(self, pos, r, vel_x = random(-2, 2), vel_y = random(-2.5, 2.5)):
        self.pos = pos
        self.r = r
        self.vel = PVector(vel_x, vel_y)
        self.c = color(random(150, 255), random(155, 255), random(155, 255))

    def update(self):
        self.pos.add(self.vel)
        if ((self.pos.x<0) or (self.pos.x>width)):
            self.vel.x *=-1
        if ((self.pos.y<0) or (self.pos.y>height)):
            self.vel.y *=-1

    def show(self):
        fill(self.c)
        ellipse(self.pos.x, self.pos.y, self.r, self.r)
