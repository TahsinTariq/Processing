class bubble
{
  float x,y,r,yd;
  color c;
  
  
  bubble() {
    x= random(width);
    y=random(height,2* height);
    r= random(25,75);
    yd=random(2,3);
    c = color(random(150,255),random(150,255),random(150,255));
  }
  
  
  void display1(){
    noStroke();
    fill(0,100,160,50);
    //fill(c,200);
    ellipse(x,y,r,r);
  }
  void display2(){
      noStroke();
      fill (c,170);
      ellipse(x,y,r,r);
   }
  
  void accend()
  {
    y=y-yd;
    x=x-random(-1.5,1.5);
    
    if (y+r < 0)
    y = height+r;
  }
}
