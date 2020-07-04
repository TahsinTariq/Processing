void setup() {
  size(300, 300);
  rectMode(CENTER);
  smooth();
  
  stroke(30, 40);
  fill(255, 100, 50);
}

void draw () {
  background(255);
  
  translate(width / 2, height / 2);
  for (int s = 200; s > 0; s = s - 10) {
    fill(255, 255 - s, 255 - s);
    rotate((mouseX + mouseY) / 300.0);
    rect(0, 0, s, s);
  }
}
