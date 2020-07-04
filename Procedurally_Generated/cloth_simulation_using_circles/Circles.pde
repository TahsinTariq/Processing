class Circle {
  int x;
  int y;
  float angle;
  float a = 0;
  PVector p;
  PVector p2;
  PVector s = new PVector(0, 0);
  color c;
  Circle(int x, int y) {
    this.x =x;
    this.y = y;
    this.angle = random(1, 3);
  }

  void show() {
    p = new PVector(x, y);

    pushMatrix();
    //translate(x, y);
    //uniformRotation();
    chaoticRotation();
    //translate(offset, 0);
    //noFill();
    //ellipse(0, 0, r, r);
    popMatrix();



    p2 = new PVector(x, y);
    s = new PVector(sin(radians(-a))*offset, cos(radians(-a))*offset);
    p.sub(s);
    points.add(new PVector(p.x, p.y));
    fill(0, 0, 0);
  }

  void uniformRotation() {
    //rotate(radians(a));
    rotate(radians(a+p.x/10+p.y/10));
    a+=2;
  }

  void chaoticRotation() {
    //rotate(radians(a +x/10+y/10));
    a+=angle;
  }
  color col(){
  return c;
  }
}
