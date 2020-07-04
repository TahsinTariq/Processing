class Ball {
  PVector pos;
  PVector vel;
  float r;
  color c;
  Ball(PVector pos, float r) {
    this.pos = pos;
    this.r = r;
    vel = new PVector(random(-2, 2), random(-2.5, 2.5));
    c = color(random(150, 255), random(155, 255), random(155, 255));
  }

  void update() {
    pos.add(vel);
    if ((pos.x<0) || (pos.x>width))
      vel.x *=-1;
    if ((pos.y<0) || (pos.y>height))
      vel.y *=-1;
  }

  void show() {
    fill(c);
    ellipse(pos.x, pos.y, r, r);
  }
}
