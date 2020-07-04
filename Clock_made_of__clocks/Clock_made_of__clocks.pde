
ArrayList<Clock> clock;
int n=15;
void setup(){
  //fullScreen();
  size(800,600);
  background (255);
   clock = new ArrayList<Clock>();
   for (int i=n;i<width; i += height/n){
    for(int j=n;j<height; j += height/n){
      clock.add(new Clock(i,j));
    }
  }
  strokeWeight(3);
}

void draw(){
  background(255);
  
  for (Clock c : clock){
   c.update();
    c.show();
    
  }
}
