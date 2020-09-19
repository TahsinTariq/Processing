import gab.opencv.*;
import java.awt.*;
import processing.video.*;
OpenCV ocv;
Capture video;
Rectangle[] faces;
PImage hat;
void setup() {
  size(640, 480);
  printArray(Capture.list());
  video = new Capture(this, width, height,30);
  video.start();

  ocv = new OpenCV(this, width, height);
  ocv.loadCascade(OpenCV.CASCADE_FRONTALFACE);
}

void captureEvent(Capture vid) {
  vid.read();
}

void draw() {
  PImage img = video;
  hat = loadImage("hat.png");
  image(img, 0, 0);
  noFill();
  stroke(255);
  strokeWeight(3);
  textAlign(CENTER, CENTER);
  textSize(20);

  ocv.loadImage(img);
  faces = ocv.detect();
  //faces = ocv.detect();

  if (faces.length >=1) {
    for (int i = 0; i < faces.length; i++) {
      fill(255,0,0);
      noStroke();
      rect(faces[i].x, faces[i].y, faces[i].width, faces[i].height);
      noFill();
      //int faceWidth = int(faces[i].width*(1+map(mouseX, 0,width, 0,1)));
      int faceWidth = int(faces[i].width*(1+0.5));
      hat.resize(faceWidth, int(1.5*hat.height*faceWidth/hat.width));
      pushMatrix();
      translate(faces[i].x, faces[i].y);
      translate(-faceWidth/5, -faces[i].height*100/100);
      image(hat, 0, 0);
      popMatrix();
    }
    //println(faces.length);
  } else text("Nothing detected", 0, 0, width, height);
}
