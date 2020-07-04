float x = 0;
float y = 0;
float theta = 0;
float r = 100;
float h = r*3/2;

void setup(){
  size(1080,720);
  background(255);
}

void draw(){
  noStroke();
  x = r*sin(theta);
  y = r*cos(theta);
  fill(mouseX,random(50,255),random(50,255),map(theta,0,width,75,0));
  ellipse(x+theta,y+h,r,r);
  theta++;
  if(theta>width+100){
    theta=0;
    h+=r*3-10;
  }
  smooth();
}
