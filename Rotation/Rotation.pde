void setup() {
  size(200, 200);
  smooth();
}

void draw() {
  background(0);

  // move the center of rotation 
  // to the center of the sketch
  translate(width/2, height/2);

  // rotate around the center of the sketch
  rotate(radians(frameCount));

  // draw a red dot at 
  // the center of the sketch
  fill(255, 0, 0);
  ellipse(0, 0, 20, 20);

  // draw a rectangle with 
  // its top-left corner
  // at the center of rotation
  fill(255);
  rect(0, 0, 50, 50);
}
