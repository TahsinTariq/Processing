int n=6;
int type = 0;

void setup() {
  fullScreen();
  frameRate(60);
}

void draw() {
  background(#FA00FF);
  fill(0);
  strokeWeight(5);
  int n =(int)map(mouseX, 0, width, 1, 25);
  float r = width/(2*n);
  for (int i = 0; i < n; i++) {
    pushMatrix();
    translate(r + i*2*r, height/2 );
    rotate(frameCount / 50.0 * pow(-1, i+1));
    if (type == 0)
      polygon(0, 0, r, (int)map(mouseY, 0, width, 2, 30));
    else if (type == 1)
      polygon(0, 0, r*(i+1)/2, (int)map(mouseY, 0, width, 2, 30));
    else {
      if (n%2==1)
        polygon(0, 0, r*(i-n/2), (int)map(mouseY, 0, width, 2, 30));
      else {
        polygon(0, 0, r*(i-.5-(n-2)/2), (int)map(mouseY, 0, width, 2, 30));
      }
    }
    popMatrix();
  }
}

void polygon(float x, float y, float radius, int npoints) {
  float angle = TWO_PI / npoints;
  beginShape();
  for (float a = 0; a < TWO_PI; a += angle) {
    float sx = x + cos(a) * radius;
    float sy = y + sin(a) * radius;
    vertex(sx, sy);
  }
  endShape(CLOSE);
}

void mousePressed() {
  if (type<3)
    type ++;
  else type = 0;
}
