int n = 20;
int w, h;
void setup() {
  size(640, 480);
  background(255);
  w = width/n;
  h = height/n;
  fill(50, 60, 200);
}

void draw() {
  noStroke();
  for (float i = w; i < width; i+=w) {
    line(i, 0, i, height);
  }
  for (float i = w; i < height; i+=w) {
    line(0, i, width, i);
  }
  rectMode(CENTER);

  if (mousePressed) {
    int i = (int)map(mouseX, 0, width, 1, n+1);
    int j = (int)map(mouseY, 0, height, 1, 1+((float)height/width)*n);
    rect((i-.5)*w, (j-.5)*w, w, w);
    println(i, j);
  }
}


void keyPressed() {
  if (key == 'q') {
    exit();
  }
  if (key == 'w') {
    fill(255);
  }
  if (key == 'p') {
    fill(#FF48E1);
  }
  if (key == 'b') {
    fill(50, 60, 200);
  }
  if (key == 's') {
    saveFrame("frame/world.png");
  }
}
