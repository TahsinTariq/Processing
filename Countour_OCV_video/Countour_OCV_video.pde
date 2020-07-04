import processing.video.*;
import gab.opencv.*;

Capture src;
OpenCV opencv;
ArrayList<Contour> contours;

void setup() {
  size(640, 480);
  src = new Capture(this, width, height);
  src.start();
}
void captureEvent(Capture src) {
  src.read();
}

void draw() {
  opencv = new OpenCV(this, src);

  //opencv.gray();
  opencv.threshold(int(map(mouseX, 0, width, 0, 300)));
  println("t:"+int(map(mouseX, 0, width, 0, 300)));

  contours = opencv.findContours();
  println("found " + contours.size() + " contours");
  pushMatrix();
  translate(width, 0);
  scale(-1, 1);
  image(src, 0, 0);
  //background(255);
  for (Contour contour : contours) {
    stroke(255, 0, 0);
    contour.draw();
  }
  popMatrix();
  //image(dst, src.width, 0);
  noFill();
  strokeWeight(10);
  
  //saveFrame("/frame/#"+".png");
  //noLoop();
}
