PImage image;
float r = 15;
void setup(){
 size(1366,768);
 image = loadImage("joker.png");
 background(255);
 strokeWeight(0);
}

void draw(){
  for (int i=0;i<1000;i++){
   float x= random(width);
   float y= random(height);
   color c = image.get(int(x),int(y));
   fill(c);
   ellipse(x,y,r,r);
  }
   //saveFrame("video/output_####.png");
}
