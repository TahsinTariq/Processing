import processing.video.*;
Capture movie;
int hueN = 2;
void setup(){
  size(640,480);
  //fullScreen();
  printArray(Capture.list());
  movie = new Capture(this, Capture.list()[19]);
  movie.start();
  //movie = loadImage();
  frameRate(15);
}

void captureEvent(Capture movie){
  movie.read();
}

void draw(){ 
  if (frameCount % 60 == 0)
    println("fps = " + frameRate);
    
  hueN = int(map(mouseX, 0, width, 1, 100));
  pushMatrix();
  translate(width/2, height/2);
  scale(-1, 1);
  //if (mousePressed)
  manipulate();
  image(movie, -width/2, -height/2);
  popMatrix();
}
int index(int x, int y) {
  return x + y * movie.width;
}
void manipulate(){
  colorMode(HSB, 360,100,100);
  movie.loadPixels();
   for (int y = 1; y< movie.height-1; y++)
    for (int x = 1; x< movie.width-1; x++) {
      int index = index(x, y);
      color c = movie.pixels[index];
      float hue = hue(c);
      float sat = saturation(c);
      float bri = brightness(c);
      hue = int(map(hue, 0,360, 1, hueN))* 360/hueN;
      sat = int(map(sat, 0,360, 1, hueN))* 360/hueN;
      bri = int(map(bri, 0,360, 1, hueN))* 360/hueN;
      movie.pixels[index] = color(hue ,sat, bri);
      //movie.pixels[index] = color(hue ,100, bri);
    }
    movie.updatePixels();

}
void mousePressed(){
  int m, n, h, s;
   m = minute();
  h = hour();
  s = second();
  n = millis();
saveFrame("Frame/"+h+"_"+m+"_"+s+"_"+n+"_"+"#####.png");
}


//[0] "name=HP Wide Vision HD Camera,size=640x360,fps=15"
//[1] "name=HP Wide Vision HD Camera,size=640x360,fps=30"
//[2] "name=HP Wide Vision HD Camera,size=176x144,fps=15"
//[3] "name=HP Wide Vision HD Camera,size=176x144,fps=30"
//[4] "name=HP Wide Vision HD Camera,size=320x240,fps=15"
//[5] "name=HP Wide Vision HD Camera,size=320x240,fps=30"
//[6] "name=HP Wide Vision HD Camera,size=352x288,fps=15"
//[7] "name=HP Wide Vision HD Camera,size=352x288,fps=30"
//[8] "name=HP Wide Vision HD Camera,size=640x480,fps=15"
//[9] "name=HP Wide Vision HD Camera,size=640x480,fps=30"
//[10] "name=HP Wide Vision HD Camera,size=1280x720,fps=30"
//[11] "name=HP Wide Vision HD Camera,size=640x360,fps=15"
//[12] "name=HP Wide Vision HD Camera,size=640x360,fps=30"
//[13] "name=HP Wide Vision HD Camera,size=176x144,fps=15"
//[14] "name=HP Wide Vision HD Camera,size=176x144,fps=30"
//[15] "name=HP Wide Vision HD Camera,size=320x240,fps=15"
//[16] "name=HP Wide Vision HD Camera,size=320x240,fps=30"
//[17] "name=HP Wide Vision HD Camera,size=352x288,fps=15"
//[18] "name=HP Wide Vision HD Camera,size=352x288,fps=30"
//[19] "name=HP Wide Vision HD Camera,size=640x480,fps=15"
//[20] "name=HP Wide Vision HD Camera,size=640x480,fps=30"
