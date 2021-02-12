PImage img;
int n = 50;
void settings() {
  //img = loadImage("StarryNight.jpg");
  img = loadImage("shaan.jpg");
  size(img.width, img.height);
  
}

void setup() {
  surface.setLocation(0,0);
}
void draw() {
  //scale(2);
  imageMode(CENTER);
  background(255);
  int detail = width/int(map(mouseX, 0, width, 1, 100));
  noStroke();
  for (int i=0; i<width; i+=detail/2) {
    for (int j=0; j<height; j+=detail/2) {
      PImage newImg = img.get(i, j, detail, detail);
      fill(extractColorFromImage(newImg));
      pushMatrix();
      translate(i+detail/2, j+detail/2);
      rotate(map(mouseY,0, height, -PI, PI));
      //rect(0,0, detail, detail);
      image(newImg, 0, 0);
      popMatrix();
      //ellipse(i,j,detail*0.9, detail*0.9);
    }
  }
}

color extractColorFromImage(PImage img) {
  img.loadPixels();
  int r = 0, g = 0, b = 0;
  for (int i=0; i<img.pixels.length; i++) {
    color c = img.pixels[i];
    //r += c>>16&0xFF;
    r += red(c);
    g += c>>8&0xFF;
    b += c&0xFF;
  }
  r /= img.pixels.length;
  g /= img.pixels.length;
  b /= img.pixels.length;
  //println(img.pixels.length);
  color c;
  c = color(r,g,b);
  //c =(r+g+b)/3;
  //if (mousePressed)
  //  c = max(r, g, b);
  //return color(r, g, b);
  return c;
}

void keyPressed(){
  if(key == 's')
  save("outputs/" + str(hour()) + "_" + str(minute()) +
             "_" + str(second()) + "_" + str(millis()) + ".jpg");

}
