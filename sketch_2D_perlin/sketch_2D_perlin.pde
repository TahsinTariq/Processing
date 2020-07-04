

void setup() {
  size(640, 480);
  //rotateX(45);
  background(0);
}
void draw() {
  loadPixels(); 
  //pixels[mouseX+mouseY*width] = color(map(noise(mouseX, mouseY), 0,1,0,255));
  
  float xoff=0.0;
  for (int x = 0; x < width; x++) { 
    float yoff=0.0;
    for (int y = 0; y < height; y++) {
      float zoff=0.0;
      //for (int z = 0; z < mouseX; z++) {
         noiseDetail((int)map(mouseX,0,width,0,10),map(mouseY,0,height,0,1));
        float bright = map(noise(xoff, yoff, mouseX), 0, 1, 0, 255);
        pixels[x+y*width] = color(bright);
        zoff+=.01;
      //}
      yoff+=.01;
    } 
    xoff+=.01;
  } 
  updatePixels();
}


void keyPressed(){
  if(key =='s'){
    saveFrame("frames/####.png");
  }
}
