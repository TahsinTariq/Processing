float y;
float x;
float r = 100;
float a = 0.0;
float t = 0;

void setup() {
  size(600, 600);
}

void draw() {
  background(255);


  translate(width/2, height/2);
  y = r*sin(a);
  x = r*cos(a);
  fill(0);
  line(0, 0, x, y);
  ellipse(x, y, 50, 50);

  a+= 0.1;
  float n = noise(t);
  r = map(n, 0, 1, 0, 200);
  t+= 0.01;
}
