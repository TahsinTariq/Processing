import processing.video.*;
Capture movie;
float r;
void setup() {
  size(640, 480);
  //fullScreen();
  printArray(Capture.list());
  movie = new Capture(this, Capture.list()[20]);
  movie.start();
  ellipseMode(RECT);
}

void captureEvent(Capture movie) {
  movie.read();
}

void draw() {
  background(255);
  //image(movie, 0, 0);
  translate(width, 0);
  scale(-1,1);
  noStroke();
  //r = map(mouseX, 0, width, 10, 100);
  r = 10;
  for (int i =0; i< width; i+=r) {
    for (int j =0; j< height; j+=r) {
      color c = movie.get(i, j);
      fill(int(map(brightness(c), 0, 100, 0, 5))*255/5);
      //float b = brightness(c);
      //r = map(r,0, 100, 0, b);
      ellipse(i, j, r,r);
    }
  }
}
