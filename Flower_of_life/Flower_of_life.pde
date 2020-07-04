void setup()
{
  size(1080,650);
  background(255);
  strokeWeight(2);
  stroke(150,90,170);
}
void draw()
{
          flower();
          delay(100);
}
void flower()
{
  for (int x=100;x<900;x+=90)
   {if ((x-100)%180==0)
    {for(int y=50;y<600;y+=100)
      {
        ellipse(x,y,100,100);
        rndfill();
      }}
      else
      for(int y=50;y<600;y+=100)
      {
        ellipse(x,y+50,100,100);
        rndfill();
      }}
}
void rndfill()
{
  fill(random(255),random(255),random(255));
}
