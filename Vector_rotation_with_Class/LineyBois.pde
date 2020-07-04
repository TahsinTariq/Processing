class liney {
  PVector origin;
  //float r;
  float a = random(3, 5);
  float angle = random(3, 5);
  
  liney(PVector origin, float a) {
    this.origin = origin;
    this.a = a;
  }
  
  void upLine(){
    this.a += this.angle;
  }
}
