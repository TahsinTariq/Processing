import processing.video.*;
Capture movie;
PImage p;
int i = 1;
void setup() {
  size(640, 480);
  //fullScreen();
  printArray(Capture.list());
  //movie = new Capture(this, Capture.list()[10]);  
  movie = new Capture(this, Capture.list()[20]);
  movie.start();
}

void captureEvent(Capture movie) {
  movie.read(); 
}

void draw() {
  p = loadImage("E:/Drawings/New folder/shifatt"+i+".png");
  pushMatrix();
  translate(width/2, height/2);
  scale(-1, 1);
  image(movie, -width/2, -height/2);
  popMatrix();
  pushMatrix();
  scale(0.5);
  image(p, 0, 0);
  popMatrix();
}

void keyPressed() {
  if (key == 32)
    i = (i+1)%2;
}
