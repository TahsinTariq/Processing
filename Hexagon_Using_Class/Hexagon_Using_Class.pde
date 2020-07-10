form hexagon;
void setup() {
  hexagon=new form();
  size(600, 600);
}

void draw() {
  background(255);
  line(width/2, 0, width/2, height);
  line(0, height/2, width, height/2);
  hexagon.display();
}

class form {
  PVector center;
  float r =150;
  int npoints;
  float angle;
  form() {
    npoints = 6;
    angle = TWO_PI / npoints;
    center=new PVector(width/2, height/2);
  }
  void display() {
    beginShape();
    for (float a = 0; a < TWO_PI; a += angle) {
      PVector b=new PVector(cos(a)*r,sin(a)*r);
      b.add(center);
      vertex(b.x,b.y);
    }
    endShape(CLOSE);
  }
}
