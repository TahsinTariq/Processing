class Particle {
  float x, y;
  float vx, vy;
  
  Particle(){
    x = width/2;
    y= height/2;
    float a = random(TWO_PI);
    float speed = random(29,30);
    vx = cos(a)*speed;
    vy = sin(a)*speed;
    
    
 }
 
 void display(){
   noStroke();
   color c = movie.get(int(x),int(y));
   fill(c);
   ellipse(x,y,5,5);
 }
 
 void move(){
   x = x + vx;
   y = y + vy;
   if (y < 0){
     y = height;
   }
   if (y > height){
     y = 0 ;
   }
   if (x < 0){
     x = width;
   }
   if (x > width){
     x = 0;
   }
 }
 
}
