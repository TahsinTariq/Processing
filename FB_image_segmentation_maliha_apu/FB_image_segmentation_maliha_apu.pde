// Daniel Shiffman
// http://codingtra.in
// http://patreon.com/codingtrain
// Code for: https://youtu.be/nCVZHROb_dE

import processing.video.*;

Capture video;

color trackColor; 
float threshold = 50;

void setup() {
  size(1280, 480);
  String[] cameras = Capture.list();
  printArray(cameras);
  video = new Capture(this, 640,480);
  video.start();
  trackColor = color(255, 0, 0);
}

void captureEvent(Capture video) {
  video.read();
}

void draw() {
  video.loadPixels();
  
  //image(video, 0, 0);
  background(0);
image(video,video.width,0);
if(keyPressed)
  threshold = map(mouseX, 0, width, 0, 100);
  //threshold = 80;

  float avgX = 0;
  float avgY = 0;

  int count = 0;

  // Begin loop to walk through every pixel
  for (int x = 0; x < video.width; x++ ) {
    for (int y = 0; y < video.height; y++ ) {
      int loc = x + y * video.width;
      /*if(loc%14==0)
      trackColor = video.pixels[loc];*/
      // What is current color
      color currentColor = video.pixels[loc];
      float r1 = red(currentColor);
      float g1 = green(currentColor);
      float b1 = blue(currentColor);
      float r2 = red(trackColor);
      float g2 = green(trackColor);
      float b2 = blue(trackColor);

      float d = distSq(r1, g1, b1, r2, g2, b2); 

      if (d < threshold*threshold) {
       // stroke(255);
        //stroke(trackColor);
        //stroke(random(1)*random(25,225),random(255)*0+50,random(255)*0+25);
        stroke(225);
        strokeWeight(2);
        if((x+y)%2==0)
        point(x, y);
        avgX += x;
        avgY += y;
        count++;
      }
    }
  }
  //saveFrame("video/output_####.png");

  // We only consider the color found if its color distance is less than 10. 
  // This threshold of 10 is arbitrary and you can adjust this number depending on how accurate you require the tracking to be.
 /* if (count > 0) { 
    avgX = avgX / count;
    avgY = avgY / count;
    // Draw a circle at the tracked pixel
    fill(255);
    strokeWeight(4.0);
    stroke(0);
    ellipse(avgX, avgY, 24, 24);
  }*/
}

float distSq(float x1, float y1, float z1, float x2, float y2, float z2) {
  float d = (x2-x1)*(x2-x1) + (y2-y1)*(y2-y1) +(z2-z1)*(z2-z1);
  return d;
}

void mousePressed() {
  // Save color where the mouse is clicked in trackColor variable
  int loc = mouseX + mouseY*video.width;
  trackColor = video.pixels[loc];
  println();
  print("Colors chosen: "+red(trackColor)+" "+green(trackColor)+" "+blue(trackColor));
}
