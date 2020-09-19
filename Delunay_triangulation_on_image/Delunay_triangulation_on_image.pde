int thresholdOCV = 150;
PWindow win;
PImage t;
import org.processing.wiki.triangulate.*;
import gab.opencv.*;
ArrayList triangles = new ArrayList();
ArrayList points = new ArrayList();
PImage img, dst;
OpenCV opencv;
ArrayList<Contour> contours;
ArrayList<Contour> polygons;
void settings() {
  img = loadImage("uttsha2.jpg");
  //img = loadImage("shaan.jpg");
  img.resize(img.width/4, img.height/4);
  size(img.width, img.height);

}
void setup() {
     surface.setLocation(0, 0);
  //win = new PWindow();
  opencv = new OpenCV(this, img);
  //opencv.gray();
  //opencv.threshold(thresholdOCV);
  //dst = opencv.getOutput();
  //contours = opencv.findContours();
}
void draw() {
  background(255);
  //opencv = new OpenCV(this, t);
  opencv.gray();
  //opencv.brightness((int)map(mouseY, 0, height, -255, 255));

  //opencv.threshold(int(map(mouseX, 0, width, 0, 255)));
  opencv.threshold(116);
  println(int(map(mouseX, 0, width, 0, 255)));
  println(int(map(mouseY, 0, height, 0, 255)));
  dst = opencv.getOutput();
  contours = opencv.findContours();
  for (Contour contour : contours) {
    contour.draw();
  }
  image(dst, 0, 0);

  //background(255);
  //thresh();
  //noFill();
  filter(DILATE);
  filter(ERODE);
  filter(THRESHOLD);
  loadPixels();
  for (int i   = 0; i< width; i++)
    for (int j   = 0; j< height; j++) {
      int loc = i + j * width;
      if (red(color(pixels[loc])) < 255)
        points.add(new PVector(i, j));
    }
  delay(1000);
  background(255);
  print("thresh");
  tri();
  print("Done");
  noLoop();
  //saveFrame("frame/####.jpg");
}

//void mousePressed() {
//  saveFrame("frame/####.jpg");
//}

void thresh() {
  //int i = 0;
  for (int i = 0; i< 255; i++) {
    //0, 43, 122, 142
    //if ((i>=0 && i<44) || (i>=122 && i< 142)) {
      if (i == map(mouseX, 0, width, 0, 255)){
      opencv = new OpenCV(this, img);
      opencv.gray();
      //opencv.brightness(122);
      opencv.threshold(i);
      dst = opencv.getOutput();
      contours = opencv.findContours();
      noFill();
      for (Contour contour : contours) {
        stroke(0);
        beginShape();
        for (PVector point : contour.getPoints()) {
          vertex(point.x, point.y);
        }
        endShape();
      }
    }
  }
}

void thresh2() {
  //112,173

  opencv = new OpenCV(this, img);
  opencv.gray();
  opencv.threshold(112);
  opencv.brightness(173);

  dst = opencv.getOutput();
  contours = opencv.findContours();
  noFill();
  for (Contour contour : contours) {
    stroke(1);
    beginShape();
    for (PVector point : contour.getPoints()) {
      vertex(point.x, point.y);
    }
    endShape();
  }
}

void tri() {
  println(points.size());
  triangles = Triangulate.triangulate(points);
  // draw points as red dots     
  fill(255, 0, 0);
  // draw the mesh of triangles
  stroke(0, 40);
  fill(255, 0, 0, 40);
  noFill();
  beginShape(TRIANGLES);
  println(triangles.size());
  for (int i = 0; i < triangles.size(); i++) {
    Triangle t = (Triangle)triangles.get(i);
    vertex(t.p1.x, t.p1.y);
    vertex(t.p2.x, t.p2.y);
    vertex(t.p3.x, t.p3.y);
  }
  endShape();
}
