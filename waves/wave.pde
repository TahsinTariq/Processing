class Wave {
  float A ;
  float w = 5;
  int n;
  float del;
  Wave(float A, int n) {
    this.A = A;
    this.n = n;
  }
  void show() {
    pushMatrix();
    PVector position = new PVector(0, 0); 
    for (position.x = 0; position.x<width; position.x += 1) {
      position.y = calcY(position.x);
      ellipse(position.x, position.y, 20, 20);
    }
    popMatrix();
  }
  
  float calcY(float x){
    return A*sin(-n *map(x, 0, width, 0, w*PI));
  }
  void add(Wave w){
    for (float i = 0; i<width; i += 1) {
      float j = w.calcY(i)+calcY(i);
      ellipse(i, j, 20, 20);
    }
  }
  


}
