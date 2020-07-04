float x = 0;


void setup() {
  background(255);
  size(1080, 720);
  stroke(0, 50);
  //noStroke();

  frameRate(120);
}

void draw() {
  fill(255, 5);
  rect(0, 0, width, height);
  fill(220, tan(x), 250);
  pushMatrix();
  translate(width/2, height/2);
  rotate(x);
 //ellipse(100, 100, 200, sin(x));
  ellipse(100, 100, 200, 100);
  popMatrix();
  x+=.05;
}
