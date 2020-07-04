float a=0;
boolean t = true;
void setup(){
  //fullScreen(P2D);
  size(640,480,P2D);
  background(0);
}
void draw(){
 touchChange();
 noiseBlend();
 
 pushMatrix();
 translate(width/2,height/2);
 rotate(a);
 a+=0.1;
 gradient();
 popMatrix();
}


void gradient(){
loadPixels();
for(float x=-width/2; x<width/2; x+=10)
 for(float y=-height/2; y<height/2; y+=10){
   color xc= (int)map(x,0, width, 0,255);
   color yc= (int)map(y,0, height, 0,255);
  // stroke(xc,yc,125);
  //point(x,y);
  
  noStroke();
  fill(xc,yc,125,10);
  ellipse(x,y,10,10);
 }
}
void touchChange(){
  if (t)
  blendMode(ADD);
 else
 blendMode(SUBTRACT);
}

void mousePressed(){
t = !t;
}

void noiseBlend(){
if (noise(a)>0.5)
  t = !t;
}
