void setup()
{
  size(1080,620);
  background(0);
  strokeWeight(2);
  stroke(255);
}
void draw()
{
  for (int x=0; x<width;x=x+10)
  {
    //fill(random(255),random(255),random(255));
      fill(random(255),0,0);
  
    for(int y=0; y<width;y=y+10)
      {
        //fill(random(255),random(255),random(255));
            fill(random(255),0,0);

          rect(x,y,10,10);
      }
  }        delay(1);
}
