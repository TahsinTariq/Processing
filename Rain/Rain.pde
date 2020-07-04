r[] rain = new r[500]; 
boolean mouse = false; 
PImage drop;
void settings() {
  fullScreen(P2D);
  smooth(8);
}
void setup() {
  //size(1000,700);

  drop = loadImage("rain drop.png");
  for (int i = 0; i< rain.length; i++)
    rain[i] = new r();
}

void draw() {
  background(0);
  textAlign(CENTER);
  noFill();
  //rectMode(CENTER);
  //rect(width/2, height/2, 500, 400);
  //line(0, 0, 433, 185);
  //line(0, height, 433, 585);
  //line(width, 0, 933, 185);
  //line(width, height, 933, 585);
  stroke(255);
  textSize(100);

  text("Rain", width/2, height/2);
  for (int i = 0; i< rain.length; i++)
    rain[i].show();
  if (mouse) {
    filter(INVERT);
  }
  //smooth();
}
//void mouseClicked() {
//  mouse = !mouse;
//}
