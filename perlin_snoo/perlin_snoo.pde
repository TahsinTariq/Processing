PImage snoo; 
float t = 0;
float s = 2;
float r=15;

void setup(){
  background(255);
  fullScreen();
  snoo = loadImage("snoo.png");
}

void draw() {
  noStroke();
  float n = noise(t);
  float y = map(n,0,1,0,height);
    fill(map(t,0,width,0,255),125,map(y,0,height,0,255));
  ellipse(t,map(y,0,255,-255,255),r,r);
//
imageMode(CENTER);
image(snoo,width/2,height/2 + 50);
//
  t += s;
  if(t>=width){
  r=r+20;
  s=s*1.1;
  t=0;
}
constrain(r,0,100);
println(s);
}
