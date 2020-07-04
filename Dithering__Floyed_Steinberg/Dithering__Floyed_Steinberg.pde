int f = 2;
PImage me;
void settings(){
  me = loadImage("me.jpg");
    size(3*me.width, me.height*3);

}
void setup() {
  //size(921, 1060);
  surface.setLocation(0,0);
  //me.filter(GRAY);
  me.resize(width,height);
  //image(me, 0, 0);
}

int index(int x, int y) {
  return x + y * me.width;
}
void draw() {
  //scale(3);
  background(255);
  me.loadPixels();

  for (int y = 1; y< me.height-1; y++)
    for (int x = 1; x< me.width-1; x++) {
      color pix = me.pixels[index(x, y)];

      float r = red(pix);
      float g = green(pix);
      float b = blue(pix);
      int nr = round(f* r/255)*(255/f);
      int ng = round(f* g/255)*(255/f);
      int nb = round(f* b/255)*(255/f);
      me.pixels[index(x, y)] = color(nr, ng, nb);
      float er = r - nr;
      float eg = g - ng;
      float eb = b - nb;

      int index = index(x+1, y);
      color c = me.pixels[index];
      r = red(c);
      b = blue (c);
      g = green (c);
      r = r + er * 7/16.0;
      g = g + eg * 7/16.0;
      b = b + eb * 7/16.0;
      me.pixels[index] = color(r, g, b);

      index = index(x-1, y +1);
      c = me.pixels[index];
      r = red(c);
      b = blue (c);
      g = green (c);
      r = r + er * 7/16.0;
      g = g + eg * 7/16.0;
      b = b + eb * 7/16.0;
      me.pixels[index] = color(r, g, b);

      index = index(x, y+1);
      c = me.pixels[index];
      r = red(c);
      b = blue (c);
      g = green (c);
      r = r + er * 7/16.0;
      g = g + eg * 7/16.0;
      b = b + eb * 7/16.0;
      me.pixels[index] = color(r, g, b);

      index = index(x+1, y+1);
      c = me.pixels[index];
      r = red(c);
      b = blue (c);
      g = green (c);
      r = r + er * 7/16.0;
      g = g + eg * 7/16.0;
      b = b + eb * 7/16.0;
      me.pixels[index] = color(r, g, b);
    }
  me.updatePixels();
  image(me, 0, 0);
    filter(BLUR,1);

  //int I = int(map(mouseX, 0, width, 0, 30));
  //int J = int(map(mouseY, 0, height, 0, 30));  
  //println(I,J);
  //for (int i = 0; i <1; i ++) {
  //  //filter(DILATE);
  //  filter(ERODE);
  //}
  //for (int i = 0; i <1; i ++) {
  //  //filter(ERODE);
  //  filter(DILATE);
  //}
}
void mousePressed(){
  saveFrame("data/####.png");
}
