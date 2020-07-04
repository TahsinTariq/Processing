import org.processing.wiki.triangulate.*;
float angle=10;
ArrayList triangles = new ArrayList();
ArrayList points;
void setup() {
  //size(600, 600);
  fullScreen(2);
  background(255);
}
void draw() {
  if( mousePressed){
  rnd();
}
  //noLoop();
}
void rnd(){
background(255);
  points = new ArrayList();
  for (int i = 0; i< width; i+=50)
    for (int j = 0; j < height; j +=50) {
      //line(i, j, i+10*sin(radians(angle)*i/100), j+10*cos(radians(angle)*j/100));
      //points.add(new PVector(i+100*sin(radians(angle)*i/100), j+100*cos(radians(angle)*j/100)));
      points.add(new PVector (random(width), random(height)));
    }
  angle+=1;
  tri();
}
void tri() {
  triangles = Triangulate.triangulate(points);
  // draw points as red dots     
  //fill(255, 0, 0);
  // draw the mesh of triangles
  stroke(0, 40);
  //noStroke();
  colorMode(HSB, 360,100,100);
  
  //noFill();
  beginShape(TRIANGLES);

  for (int i = 0; i < triangles.size(); i++) {
    Triangle t = (Triangle)triangles.get(i);
    fill(random(170,map(mouseX, 0, width, 275, 275)), random(50,70), random(90,100));
    vertex(t.p1.x, t.p1.y);
    vertex(t.p2.x, t.p2.y);
    vertex(t.p3.x, t.p3.y);
  }
  endShape();
}
