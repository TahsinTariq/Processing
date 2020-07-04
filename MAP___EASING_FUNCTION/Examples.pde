String[] type = {"QUADRATIC", "CUBIC", "QUARTIC", "QUINTIC", "SINUSOIDAL", 
  "EXPONENTIAL", "CIRCULAR", "SQRT"};

String[] when = {"EASE_IN", "EASE_OUT", "EASE_IN_OUT"};           
public void settings() {
  size(640, 640);
}
void setup() {
  background(255);
}

void draw() {
  background(255);
  for (String t : type) {
    for (float i = 0; i<width; i++) {
      stroke(20*i, 0, 0);
      float j = map2(i, 0, width, 0, width, EXPONENTIAL, EASE_IN);
      ellipse(i, j, 5, 5);
    }
  }
  stroke(0, 255, 0);
  for (float i = 0; i<width; i++) {
    float j = map(i, 0, width, 0, width);
    ellipse(i, j, 5, 5);
  }
}
