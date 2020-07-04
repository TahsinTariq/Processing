class Wave2 {
  float A ;
  float w = 5;
  int n1;
  float n2;
  float del;
  Wave2(float A, int n1, float n2) {
    this.A = A;
    this.n1 = n1;
    this.n2 = n2;
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
    return A*sin(-n2 *map(x, 0, width, 0, w*PI))*cos(-.5* n1 *map(x, 0, width, 0, w*PI));
  }
}
