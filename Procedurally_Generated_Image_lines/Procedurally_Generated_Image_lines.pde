PImage img;
float decel(float x) { // as an easing function
  return 1-(x-1)*(x-1);
}
void settings() {
  img = loadImage("ujan.jpg");
  size(img.width, img.height, P2D);
}
void setup() {  
  //surface.setLocation(-1920,-400);

  background(255);

  strokeWeight(2);
  noFill();
  for (float y=0.0; y<50; y++) {
    float l = 0;
    beginShape(LINES);
    for (float x=0; x<width*4; x++) {
      float xx=x/4.0;

      // using this version will generate a squished image due to using map(...) in line 26
      // color c = img.get(int(xx),int(y*height/50.0));
      color c = img.get(int(xx), int(map(y*height/50.0, 0, height, 50, height-50)));

      l += (255-blue(c))/255/4.0; // period of the wave

      // 5*decel(m) sets the amplitude of the wave
      // map(...) sets the position of the wave
      float m = (255-red(c))/255.0; // separate it from an increasing variable (l)
      vertex(xx, map((y+0.5)*height/50.0, 0, height, 50, height-50)+sin(l*PI/2.0)*5*decel(m));
    }
    endShape();
  }
  //saveFrame("image-edit.png");
  noLoop();
}
