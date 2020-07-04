class Particle {
  float x, y;
  float vx, vy;

  Particle() {
    x = width/2;
    y= height/2;
    float a = random(TWO_PI);
    float speed = random(1, 3);
    vx = cos(a)*speed;
    vy = sin(a)*speed;
  }

  void display() {
    image.loadPixels();
    color c = image.pixels[int(y)*width + int(x)];
    fill(c);
    ellipse(x, y, 5, 5);
  }

  void move() {
    x = x + vx;
    y = y + vy;
    if (y <=0) {
      y = height;
    }
    if (y >= height) {
      y = 0 ;
    }
    if (x <=0) {
      x = width;
    }
    if (x >= width) {
      x = 0;
    }
  }
}
