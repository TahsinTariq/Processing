/*
    Barnsley Fern for Processing 3.4
*/

// declaring variables x and y
float x, y;

// creating canvas
void setup() {
  size(600, 600);
  background(255);
}

/* setting stroke,  mapping canvas and then
   plotting the points */
void drawPoint() {
  stroke(34, 139, 34);
  strokeWeight(1);
  float px = map(x, -2.1820, 2.6558, 0, width);
  float py = map(y, 0, 9.9983, height, 0);
  point(px, py);
}

/* algorithm for calculating value of (n+1)th
   term of x and y based on the transformation
   matrices */
void nextPoint() {
  float nextX, nextY;
  float r = random(1);
  if (r < 0.01) {
    nextX =  0;
    nextY =  0.16 * y;
  } else if (r < 0.86) {
    nextX =  0.85 * x + 0.04 * y;
    nextY = -0.04 * x + 0.85 * y + 1.6;
  } else if (r < 0.93) {
    nextX =  0.20 * x - 0.26 * y;
    nextY =  0.23 * x + 0.22 * y + 1.6;
  } else {
    nextX = -0.15 * x + 0.28 * y;
    nextY =  0.26 * x + 0.24 * y + 0.44;
  }
  x = nextX;
  y = nextY;
}

/* iterate the plotting and calculation
   functions over a loop */
void draw() {
  for (int i = 0; i < 1000; i++) {
    drawPoint();
    nextPoint();
  }
}
