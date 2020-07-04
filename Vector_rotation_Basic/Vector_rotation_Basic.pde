PVector p;
PVector p2;
PVector origin;
float r1 = 50;
float r2 = 40;
float a = 0;
float b = 0;
void setup() {
  size(600, 600);
  background(255);
}
void draw() {
  background(255);

  origin = new PVector(100, 100);
  PVector temp = new PVector(origin.x, origin.y);

  p = new PVector(sin(radians(-a))*r1, cos(radians(a))*r1);

  p2 = new PVector(sin(radians(b))*r2, cos(radians(b))*r2);


  a += 3;
  b +=10;
  stroke(0, 0, 0);
  line(0, 0, origin.x, origin.y);
  origin.add(p);
  PVector temp2 = new PVector(origin.x, origin.y);
  line(temp.x, temp.y, origin.x, origin.y);
  origin.add(p2);
  stroke(255, 0, 0);
  line(temp2.x, temp2.y, origin.x, origin.y);
}
