int n  = 100;
float radius = 30;
Ball[] b = new Ball[n];
void settings() {  
  size(640, 480);
  smooth(8);
}
void setup() {
  for (int i =0; i< n; i++) {
    PVector p = new PVector(width/2, height/2);
    b[i] = new Ball(p, radius);
  }
}

void draw() {
  background(255);
  for (int i =0; i< n; i++) {
    b[i].update();
    b[i].show();
  }
}
