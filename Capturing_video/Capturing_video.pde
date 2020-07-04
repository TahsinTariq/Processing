import processing.video.*;
Capture movie;

void setup(){
  //size(640,480);
  fullScreen();
  printArray(Capture.list());
  movie = new Capture(this, Capture.list()[20]);
  movie.start();
}

void captureEvent(Capture movie){
  movie.read();
}

void draw(){
  image(movie,0,0);
 // filter(DILATE);
 textAlign(CENTER, CENTER);
  textSize(20);
    // text("Nothing detected", 0, 0, width, height);
}
