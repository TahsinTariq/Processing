boid b;
void setup() {
  size(1080, 700);
  background(255);
  b = new boid(width/2, height/2);
}
void draw() {
  background(0);
  b.show();
}
