int s;
PImage img;
void settings() {
  size(640, 480);
  smooth(8);
  pixelDensity(displayDensity());
}
void setup() {
  img = loadImage("Clock.png");
}

void draw() {
  pushMatrix();
  scale(.1);
  image(img, -500, 0);  
  popMatrix();

  strokeWeight(5);
  pushMatrix();
  stroke(#FF48D5);
  translate(width/2, height/2);
  s = second();
  rotate(TWO_PI*s/60);
  line(0, 0, 0, -70);
  popMatrix();

  pushMatrix();
  stroke(#48FFF1);
  translate(width/2, height/2);
  s = minute();
  rotate(TWO_PI*s/60);
  line(0, 0, 0, -70);
  popMatrix();

  pushMatrix();
  stroke(#60FF48);
  translate(width/2, height/2);
  s = hour();
  rotate(TWO_PI*s/12);
  line(0, 0, 0, -70);
  popMatrix();
}
