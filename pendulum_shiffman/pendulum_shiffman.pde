Pendulum p;

void setup() {
  size(640,360);
  // Make a new Pendulum with an origin position and armlength
  p = new Pendulum(new PVector(width/2,0),175);

}

void draw() {

  background(255);
  p.go();
}

void mousePressed() {
  p.clicked(mouseX,mouseY);
}

void mouseReleased() {
  p.stopDragging();
}
