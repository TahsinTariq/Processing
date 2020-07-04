PImage img;
float r = 15;
void setup(){
 size(320,240,P2D);
 img = loadImage("car.JPG");
 background(255);
 strokeWeight(0);
}

void draw(){
  image(img,0,0);
   
   println(mouseX, mouseY); /* 96 31  148 58*/
   fill(0);
   if(frameCount>150){
   rect(96,31,148-96,58-31);
   }
   
   if(frameCount>300){
     background(255);
   rect(96,31,148-96,58-31);
   }
   
     stroke(255);
     strokeWeight(1);
     if (frameCount >450)
   rect(96,31,116-96,44-31);
   if (frameCount >510)
   rect(116,31,136-116,43-31);
   if (frameCount >570)
   rect(136,31,148-136,43-31);
   
   
   if (frameCount >630)
   rect(96,44,104-96,58-44);
   if (frameCount >690)
   rect(104,44,111-104,58-44);
  if (frameCount >750)
   rect(111,44,116-111,58-44);
   if (frameCount >810)
   rect(116,43,5,58-43);
   if (frameCount >870)
   rect(121,43,7,58-43);
   if (frameCount >930)
   rect(148-14,43,7,58-43);
   if (frameCount >1990)
   rect(148-7,43,7,58-43);
   
   //saveFrame("video/output_####.png");
}
