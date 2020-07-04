import org.processing.wiki.triangulate.*;
ArrayList<Circle> c = new ArrayList<Circle>();
ArrayList triangles = new ArrayList();
ArrayList points;
int offset = 75;
int r = 5;
float a =0;
boolean b = false;
float max = 0;
void setup() {
  //size(600, 600);  
  size(1920, 1080);
  surface.setLocation(0,0);
  //fullScreen(P3D, 2);
  for (int i = 00; i< width; i+=100)
    for (int j = 00; j < height; j +=100) {
      c.add(new Circle(i, j));
    }
  background(255);
  background(#634390);
  //filter(INVERT);
}

void draw() {
  points = new ArrayList();
  if (frameCount<80 || true) {
    colorMode(RGB);
    background(#ffffff);
  }
  for (Circle C : c) {
    C.show();
  }
  tri();
  
  //if (a <=260 && b ==false) {
  //  change();
  //}
  //if(b == true){
  //a-=0.2;
  ////println(a);
  //}
  //if(a < 0){
  //noLoop();
  //exit();
  //}
  println(frameCount);
  //saveFrame("Frame/#####.png");
}
void mousePressed(){
saveFrame("Frame/#####.png");
}
void change() {
  a+=.2;
  if (a > 260) {
    b = true;
    //println("TRUEEEEE");
  }
}

void tri() {
  triangles = Triangulate.triangulate(points);
  // draw the mesh of triangles
  strokeWeight(2);
  stroke(255, 100);
  //stroke(255,188,40, 20);
  stroke(41,83,99, 20);
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
    float c1 = map(d1+d2+d3, 0, max, 0, 360);
    //float c1 = map(max(t.p1.x, t.p1.y), 0, width, -40, 100)+ a;
    float c2 = map(max(t.p2.x, t.p2.y), 0, width, 70, 80);
    float c3 = map(max(t.p3.x, t.p3.y), 0, width, 90, 95);
    //fill(c1, c2, c3, 5);

    vertex(t.p1.x, t.p1.y);
    vertex(t.p2.x, t.p2.y);
    vertex(t.p3.x, t.p3.y);
  }
  endShape();
}
