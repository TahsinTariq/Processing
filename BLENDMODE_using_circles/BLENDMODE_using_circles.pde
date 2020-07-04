void setup(){
  size(640,480);
  background(0);
  noStroke();
  //change blend mode to difference
  blendMode(DIFFERENCE);
  //draw circles
  for(int i = 0 ; i < 20; i++){
    float diameter = random(50,500);
    //fill(random(255));
    //fill(random(255),random(255),random(255));
    ellipse(random(width * .05,width * .95),random(height * .2,height * .8),diameter,diameter);
  }
}
//the code bellow is just to redraw on click
void draw(){}
void mouseReleased(){     
  //saveFrame("frame/0001.png");
  setup();

}
