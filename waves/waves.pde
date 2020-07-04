Wave[] w = new Wave[2];
Wave2 wavv;
void settings() {
  size(640, 640);
}
void setup() {
  surface.setResizable(true);
  w[0] = new Wave(25, 2);
  w[1] = new Wave(25, 3);
  //wavv = new Wave2(0,0,0);
    wavv = add(w[0], w[1]);

}
void draw() {
  background(255);
  noStroke();
  fill(#F73956);
  translate(0, .5 *height/4);
  w[0].show();  
  fill(#F739EE);      
  translate(0, 1*height/4);
  w[1].show();

  fill(#3BEA42);      
  translate(0, 1.8*height/4);
  w[0].add(w[1]);
  //wavv = add(w[0], w[1]);
  //wavv.show();
  
}

Wave2 add(Wave a, Wave b){
  Wave2 temp = new Wave2(0,0,0);
  temp.A = sqrt(a.A*a.A+b.A*b.A +2* a.A*b.A);
  temp.n1 = a.n-b.n;
  temp.n2 = (a.n-b.n)/2;
  return temp;
}
