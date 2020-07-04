void settings() {
  size(640, 480);
  smooth(8);
}
void setup() {
  background(255);
}

void draw() {  
  background(255);  
  translate(width/2, height/2);
  PVector mouse = new PVector (mouseX, mouseY);
  PVector center = new PVector (width/2, height/2);
  ////line(center.x, center.y, mouse.x, mouse.y);
  //line(center.x, center.y, center.x, mouse.y);
  //line(center.x, center.y, mouse.x, center.y);
  mouse.sub(center);
  strokeWeight(50);
  line(0, 0, mouse.x, mouse.y);

}
