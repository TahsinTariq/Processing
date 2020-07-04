import processing.video.*;
Capture video;
int w = 120;
void setup() {
  size(640, 480);
  printArray(Capture.list());
  video = new Capture(this, Capture.list()[20]);
  video.start();
}

void captureEvent(Capture movie) {
  movie.read();
}

void draw() {
  image(video, 0, 0);
 // filter(INVERT);
  noFill();
  int xstart = constrain(mouseX - w/2, 0, video.width);
  int ystart = constrain(mouseY - w/2, 0, video.height);
  int xend = constrain(mouseX + w/2, 0, video.width);
  int yend = constrain(mouseY + w/2, 0, video.height);
  loadPixels();
  // Begin our loop for every pixel in the smaller image
  for (int x = xstart; x < xend; x++) {
    for (int y = ystart; y < yend; y++ ){
    int loc = x + y*video.width;
      pixels[loc] = color(255-red(get(x,y)), 255-green(get(x,y)), 255-blue(get(x,y)));
 //pixels[loc] = color(0);  
 }}
   updatePixels();
        blendMode(DARKEST);

  //rect(mouseX, mouseY, 100, 100);
}
