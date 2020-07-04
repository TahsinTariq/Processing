class Pendulum{
  PVector origin;
  PVector end;
  
  Pendulum(int o_x, int o_y, int x, int y){
    origin = new PVector(o_x,o_y);
    end = new PVector(x,y);
  }
  
  void show(){
    line(origin.x,origin.y, end.x,end.y);
    ellipse(end.x,end.y, 20,20);
  }
  
  void move(){
    
  }
}
