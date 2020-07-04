
void setup(){
  size(640,380,P2D);
  background(255);
  drawCircle(width/2,height/2, 100);
}

void draw(){
 // fill(0);
 //noStroke();
 //for(int i= 0; i<100; i++)
  drawCircle(mouseX,mouseY, 100);
  smooth();
}

void drawCircle(int x, int y, float radius){ 
  //fill(random(50,200),random(50,200),random(50,200));
       ellipse(x, y, radius, radius); 
       if(radius      >      2)  { 
         radius *=0.75f; 
         drawCircle(x, y, radius);            
       }
     }
