import gab.opencv.*;

PImage src,canny;
OpenCV opencv;
ArrayList<Contour> contours;
ArrayList<Contour> polygons;

void setup() {
  //src = loadImage("1.jpg");
  src = loadImage("E:/Assignment/For Maliha apu/dataset-master/dataset-master/JPEGImages/BloodImage_0000"+ str(1)+".jpg"); 
  size(640, 480);
}

void draw() {  opencv = new OpenCV(this, src);

  //contouring();
background(src);
  opencv.useColor();
  opencv.erode();
    opencv.findCannyEdges(mouseX,mouseY);
  canny = opencv.getSnapshot();
  image(canny, 0, 0);
  //saveFrame("/frame/#"+".png");
  //noLoop();
}


void contouring() {
  opencv.gray();
  //opencv.threshold(190);
  opencv.threshold(int(map(mouseX, 0, width, 0, 300)));
  println("t:"+int(map(mouseX, 0, width, 0, 300)));
  //dst = opencv.getOutput();

  contours = opencv.findContours();
  println("found " + contours.size() + " contours");
  image(src, 0, 0);
  noFill();
  strokeWeight(3);

  for (Contour contour : contours) {
    stroke(0, 0, 0);
    contour.draw();
  }
}
