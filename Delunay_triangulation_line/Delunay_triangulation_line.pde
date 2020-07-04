import com.hamoid.*;
VideoExport videoExport;

import org.processing.wiki.triangulate.*;
ArrayList<Funky> c = new ArrayList<Funky>();
ArrayList triangles = new ArrayList();
ArrayList points;
int offset = 75;
int r = 2;
float a =0;
boolean save = false;
float max = 0;
int number = 4;
float len = 200;
int m, n, h, s;
void setup() {
    videoExport = new VideoExport(this);
  videoExport.startMovie();
  blendMode(MULTIPLY);
  m = minute();
  h = hour();
  s = second();
  n = millis();
  frameRate(120);
  size(1920, 1080);
  surface.setLocation(0, 0);
  //fullScreen(P3D, 2);
  //for (int i = 00; i< width; i+=300)
  //  for (int j = 00; j < height; j +=300) {
  //    //c.add(new Funky(new PVector(i, j), 10, 50));
  //    c.add(new Funky(new PVector(width/2, height/2), 50, 100));
  //  }
  c.add(new Funky(new PVector(width/2, height/2),number, len));
  background(255);
  //background(#634390);
  //filter(INVERT);
}

void draw() {
  //points = new ArrayList();
  //if (frameCount<260) {
    //colorMode(RGB);
    //background(#ffffff);
  //}
  for (Funky C : c) {
    C.show();
  }
  //tri();

  println(frameCount);
  if(save == true){
    //saveFrame("Frame_"+h+"_"+m+"_"+s+"_"+n+"/#####.jpg");
    videoExport.saveFrame();
}
}
void keyPressed() {
  if (key == 's') {
    saveFrame("Frame_"+h+"_"+m+"_"+s+"_"+n+"/#####.jpg");
  }
  if (key == 'a') {
    save = !save;
  }
  if (key == 'w') {
    c.clear();
    c.add(new Funky(new PVector(width/2, height/2), number, len));
  }
  if (key == 'c') {
    //colorMode(RGB);
    background(0,0,100);
  }
  if (key == 'q') {
    videoExport.endMovie();
    exit();
  }
}

void tri() {
  triangles = Triangulate.triangulate(points);
  strokeWeight(0.5);
  stroke(255, 100);
  //stroke(255,188,40, 20);
  //stroke(41,83,99, 20);
  //noStroke();
  //fill(255, 0, 0);
  noFill();
  //background(255);
  beginShape(TRIANGLES);
  for (int i = 0; i < triangles.size(); i++) {
    Triangle t = (Triangle)triangles.get(i);
    colorMode(HSB, 360, 100, 100);
    //float c1 = map(max(t.p1.x, t.p1.y), 0, width, -40, 100)+ map(mouseX, 0,width, 0,260);
    float d1 = dist(t.p1.x, t.p1.y, t.p2.x, t.p2.y);
    float d2 = dist(t.p1.x, t.p1.y, t.p3.x, t.p3.y);
    float d3 = dist(t.p3.x, t.p3.y, t.p2.x, t.p2.y);
    max = max(max, d1+d2+d3);
    //float c1 = map(d1+d2+d3, 0, max, 0, 360);
    float c1 = map(max(t.p1.x, t.p1.y), 0, width, -40, 100)+ a;
    float c2 = map(max(t.p2.x, t.p2.y), 0, width, 70, 80);
    float c3 = map(max(t.p3.x, t.p3.y), 0, width, 90, 95);
    fill(c1, c2, c3, 5);

    vertex(t.p1.x, t.p1.y);
    vertex(t.p2.x, t.p2.y);
    vertex(t.p3.x, t.p3.y);
  }
  colorMode(RGB);
  endShape();
}
