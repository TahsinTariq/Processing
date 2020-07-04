int value=0;
void setup()
{
  size(1080,620);
  background(255);
  strokeWeight(2);
  stroke(0);
}
void draw()
{
  if (value==0)
          flower();
          else flowerp();
          delay(100);
  //saveFrame("movie/output_####.png");
}



void mousePressed() {
  if (value == 0) {
    value = 1;
  } else {
    value = 0;
  }
}



void flower()
{
  clear();
  background(255);
  ellipse(width/2,height/2, 100,100);
  rndfill();
}



void flowerp()
{
  ellipse(width/2,height/2, 100,100);
  rndfill();
  ellipse(width/2+90,height/2-50, 100,100);//rndfill();
  
  ellipse(width/2-90,height/2-50, 100,100);//rndfill();
  ellipse(width/2+90,height/2+50, 100,100);//rndfill();
  ellipse(width/2-90,height/2+50, 100,100);//rndfill();
  ellipse(width/2,height/2+100, 100,100);//rndfill();
  ellipse(width/2,height/2-100, 100,100);//rndfill();
}



void rndfill()
{
  fill(random(255),random(255),random(255));
}
