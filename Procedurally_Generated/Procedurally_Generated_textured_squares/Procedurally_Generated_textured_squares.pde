int len = 300;
void setup() {
  size(800, 600);
}

void draw() { 
  background(0);
  //println(mouseX);
  rectMode(CENTER);
  translate(width/2, height/2);
  rect(-175, 0, len, len);
  rect(175, 0, len, len);
}
