int n = 50;
PImage img;
import org.processing.wiki.triangulate.*;
//import gab.opencv.*;
ArrayList triangles = new ArrayList();
ArrayList points = new ArrayList();
//OpenCV opencv;
void settings() {
  img = loadImage("shaan2.jpg");
  size(img.width, img.height);
}
void setup() {  
  //opencv = new OpenCV(this, img);
}

void draw() {
  points = new ArrayList();
  //image(img, 0, 0);
  background(255);
  int detail = width/n;
  for (int i=0; i<width; i+=detail) {
    for (int j=0; j<height; j+=detail) {
      PImage newImg = img.get(i, j, detail, detail);
      int c = extractColorFromImage(newImg);
      //noFill();
      fill(c);
      //strokeWeight(3);
      //rect(i, j, detail, detail);
      makePoints(i, j, detail, detail, c);
    }
  }
  tri();
  //noLoop();
  //saveFrame("Frame/####.png");
}


void makePoints(int x, int y, int w, int h, int c) {
  int NumberofPoints = int(map(c, 0, 255, 3, 0));
  fill(255);
  noStroke();
  for (int i = 0; i<NumberofPoints; i++) {
    int x_ = int(random(x, x+w));
    int y_ = int(random(y, y+h));
    //ellipse(x_, y_, 5, 5);
    points.add(new PVector(x_, y_));
  }
  textSize(20);
  text(str(NumberofPoints), x, y, w, h);
}

color extractColorFromImage(PImage img) {
  img.loadPixels();
  int r = 0, g = 0, b = 0;
  for (int i=0; i<img.pixels.length; i++) {
    color c = img.pixels[i];
    //r += c>>16&0xFF;
    r += red(c);
    g += c>>8&0xFF;
    b += c&0xFF;
  }
  r /= img.pixels.length;
  g /= img.pixels.length;
  b /= img.pixels.length;
  //println(img.pixels.length);
  color c;
  //c =(r+g+b)/3;
  //if (mousePressed)
  c = max(r, g, b);
  //return color(r, g, b);
  return c;
}

void tri() {
  triangles = Triangulate.triangulate(points);
  // draw points as red dots     
  //fill(255, 0, 0);
  // draw the mesh of triangles
  stroke(0, 40);
  fill(255, 0, 0);
  noFill();
  beginShape(TRIANGLES);

  for (int i = 0; i < triangles.size(); i++) {
    Triangle t = (Triangle)triangles.get(i);
    vertex(t.p1.x, t.p1.y);
    vertex(t.p2.x, t.p2.y);
    vertex(t.p3.x, t.p3.y);
  }
  endShape();
}
