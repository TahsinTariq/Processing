//import pthreading.PThread;

class drawer extends PThread {

  int n;
  Ball[] b;
  
  public drawer(PApplet p, int n) {
    super(p);
    b = new Ball[n];
    this.n = n; 
    for (int i =0; i< n; i++) {
      PVector pv = new PVector(width/2, height/2);
      b[i] = new Ball(p,pv, radius);
    }
  }
  
  @Override
    public void draw() {
    for (Ball c : b) {
      c.update();
      c.show();
    }
  }
  
}
