class r {
  float x = random(width);
  float y = random(-100, -height);
  float len = random(20, 40);
  float speed = random(10, 20);

  void show() {
    rotate(map(mouseX, 0, width, 0.0002, -0.0002));
    y = y + speed;
    if (y> height) {
      y = random(-100, -height);
      x = random(width);
      speed = random(10, 20);
    }
    stroke(255);
    pushMatrix();
    scale(len/20);
    image(drop, x, y);
    popMatrix();
    //line(x, y, x, y+ len);
  }
}
