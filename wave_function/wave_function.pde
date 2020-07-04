float y = 0;
float r=50;
float x=-r/2;
float a=150;
int i = 1;
void setup() {
  size(1080, 720);
  frameRate(120);
  smooth();
  background(255);
} 
void draw() {
  noStroke();
  fill(255, 7);
  rect(0, 0, width, height);
  
  pushMatrix();
  translate(0, height/2);
  fill(220, 50, 240, 255);
  ellipse(-2*r+x, a*sin(y), r, r);
  fill(50, 150, 240, 255);
  ellipse(x, a*cos(y), r, r);
  translate(width/2, height/2);
  popMatrix();
  
  //pushMatrix();
  //translate(width/2, height/2);
  //rotate(10*x);
  //popMatrix();
  x+=1;
  y+=.02;
  if (x > width+ 2*r)
    x=0;
  i+=25;
}
