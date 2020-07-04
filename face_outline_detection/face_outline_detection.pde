import gab.opencv.*;
import java.awt.*;
import processing.video.*;
OpenCV ocv;
Capture video;
Rectangle[] faces;
void setup() {
  size(352, 288);
  printArray(Capture.list());
  video = new Capture(this, width, height);
  video.start();
  ocv = new OpenCV(this, width,height);
  
  
}

void captureEvent(Capture vid) {
  vid.read();
}

void draw() {
  ocv.loadImage(video);
  image(video, 0, 0);
  ocv.loadCascade(OpenCV.CASCADE_FRONTALFACE);
    faces = ocv.detect();
    ocv.loadCascade(OpenCV.CASCADE_EYE);
    Rectangle[] EYE = ocv.detect();
  noFill();
  stroke(255);
    strokeWeight(3);
     textAlign(CENTER, CENTER);
    textSize(20);
    if (faces.length >=1 && EYE.length>=1){
       //text("Nothing detected",0,0, width, height);
  for (int i = 0; i < faces.length; i++) {
    rect(faces[i].x, faces[i].y, faces[i].width, faces[i].height);
    rect(EYE[i].x, EYE[i].y, EYE[i].width, EYE[i].height);
}
println(faces.length);
    }
else text("Nothing detected",0,0, width, height);
}
