import org.processing.wiki.triangulate.*;
ArrayList triangles = new ArrayList();
ArrayList points = new ArrayList();
PImage img;
int i =0;
int j = 0;
int f = 3;
int increment = 4;
int x1 = 0;
int y1 = 0;
void settings() {
  img = loadImage("av.png");
  size(img.width, img.height);
}
void setup() {
  background(255);
    delunay();
  //image(img, 0, 0);
  filter(THRESHOLD);
  for (int i = 0; i< 1; i++) {
    filter(DILATE);
  }
}
void draw() {
  background(255);
  //past();
  //current();
  
  triangles = Triangulate.triangulate(points);
  // draw points as red dots     
  noStroke();
  fill(0);

  for (int i = 0; i < points.size(); i++) {
    PVector p = (PVector)points.get(i);
    ellipse(p.x, p.y, 2.5, 2.5);
  }

  // draw the mesh of triangles
  stroke(0, 40);
  //fill(255, 40);
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

void mouseDragged() {
  //makeline(mouseX, mouseY);
    points.add(new PVector(mouseX, mouseY));
}


void past() {
  //image(img, 0, 0);
  //println(mouseX, mouseY);
  img.loadPixels();
  //loadPixels();
  //println(width, height);
  //if (i == 50) {
  //makeline(i, j);
  //}
  //println(i, j);
  //println(img.width-2);
  //i+= 1;
  j+=1;
  if (i>= height)
    i = 0;
  j = 0;
  if (j>= width)
    j = 0;
  i+=1;
  int loc = i + j* height;
  //img.pixels[loc] = color(0); 
  //makeline(i,j);
  color p = img.pixels[loc];
  if (p < -1) {
    makeline(j, i);
    println(p);
  }
  img.updatePixels();
}

void current() {
  //img.loadPixels();

  for (int y = 1; y< img.height-1; y+=increment)
    for (int x = 1; x< img.width-1; x+=increment) {
      int loc = x + y * img.width;
      color pix = img.pixels[loc];
      //println(red(pix));
      if (red(pix) < 200) {
        //fill(255, 0, 0);
        //ellipse(x, y, 10, 10);
        makeline2(x, y);
      }
    }
  if (frameCount ==f)
    noLoop();
//  img.updatePixels();
}


void makeline(int x, int y) {
  int x1 = int(random(width));
  int y1 = int(random(height));
  line(x1, y1, x, y );
  int x2 = int(lerp(x1, x, 5));
  int y2 = int(lerp(y1, y, 5));
  line(x, y, x2, y2);
}

void makeline2(int x, int y) {
  line(x1, y1, x, y );
  x1 = x;
  y1 = y;
  int x2 = int(lerp(x1, x, 5));
  int y2 = int(lerp(y1, y, 5));
  line(x, y, x2, y2);
}


void delunay(){
for (int y = 1; y< img.height-1; y+=increment)
    for (int x = 1; x< img.width-1; x+=increment) {
      int loc = x + y * img.width;
      color pix = img.pixels[loc];
      if (red(pix) < 200) {
        points.add(new PVector(x,y));
      }
    }
}
