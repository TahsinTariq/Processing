class Ball {
  PVector pos;
  PVector vel;
  float r;
  color c;
  Ball(PApplet p,PVector pos, float r) {this.pos = pos;
    this.r = r;
    vel = new PVector(p.random(-2, 2), p.random(-2.5, 2.5));
    c = color(p.random(150, 255), p.random(155, 255), p.random(155, 255));
  }

  void update() {
    pos.add(vel);
    if ((pos.x<0) || (pos.x>width))
      vel.x *=-1;
    if ((pos.y<0) || (pos.y>height))
      vel.y *=-1;
  }

  void show() {
    g.fill(c);
    g.ellipse(pos.x, pos.y, r, r);
  }
}
