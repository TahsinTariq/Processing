float t = 0;
float s = 2;
float r=15;
String l = "SARAH";

void setup(){
  background(255);
  fullScreen();
}

void draw() {
  noStroke();
  float n = noise(t);
  float y = map(n,0,1,0,height);
    fill(map(t,0,width,0,255),125,map(y,0,height,0,255));
  ellipse(t,y,r,r);
 textAlign(CENTER,CENTER);
  fill(255);
  textSize(width/5);
  text(l,0,0,width,height);
  t += s;
  if(t>=width){
  r=r+20;
  s=s*1.1;
  t=0;
}
constrain(r,0,100);
println(s);
}
