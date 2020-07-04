int n = 6;
float w, h;
float hue;
void setup() {
  //size(600, 600);
  //size(1920, 1080);
  //surface.setLocation(0, 0);
  fullScreen(2);
  background(255);
  w = width/n;
  h = height/n;
}

void draw() {
  noLoop();
  background(255);
  for (int i = int(w/2); i<width; i+=w ) {
    for (int j = int(h/2); j<height; j+=h ) {
      pushMatrix();
      int p = int(random(1, 5));
      if (p ==4)
        translate(i, j - 10);
      if (p ==3)
        translate(i, j+10);
      if (p ==2)
        translate(i+10, j);
      if (p ==1)
        translate(i-10, j);
      hue = random(360*2);
      rec(w, h);
      popMatrix();
    }
  }
  println(int(random(1, 5)));
  //noLoop();
}

//void mousePressed(){
//saveFrame("Frame/#####.png");
//}

void rec(float w, float h) {
  rectMode(CENTER);
  float low = 20;
  float d = 0.7;
  if (w>low && h > low) {
    colorMode(HSB, 360, 100, 100);
    hue = hue*0.5;
    fill(hue, random(40,85), random(70,95));
    noStroke();
    rect(0, 0, w, h);
    pushMatrix();
    translate(random(-2, 5), random(-5, 5));
    rec(w*d, h*d);
    popMatrix();
  }
}
