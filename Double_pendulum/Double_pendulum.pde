
Pendulum p;
void setup() {
  size(640, 480);
  p = new Pendulum(width/2,0,width/2,100);
}

void draw() {
  p.show();
}
