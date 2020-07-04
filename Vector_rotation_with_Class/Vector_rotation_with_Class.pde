Funky f;
//ArrayList<Funky> f2 = new ArrayList<Funky>(10);
void setup() {
  size(600, 600);
  strokeWeight(5);
  surface.setLocation(0, 0);
  background(255);
  frameRate(12000);
  f = new Funky(new PVector(width/2, height/2), 20, 100);
  //for(int i = 0 ; i < f2.size(); i++){
  //  f2.add(new Funky(new PVector(width/2, height/2), 15, 50));
  //}
}
void draw() {
  colorMode(RGB, 255, 255, 255);
  //background(255);
  fill(255, 2);
  //rect(0, 0, width, height);
  //translate(width/2, height/2);
  //scale(map(mouseX,0,width, 0.0000001, 2));
  fill(255, 0, 0);
  //ellipse(width/2, height/2, 10, 10);
  //delay(1000);
  //noLoop();
  //for(Funky q : f2){
  //  q.show();
  //}
  //for(int i = 0 ; i < f2.size(); i++){
  //  f2.show();
  //}
  f.show();
}
