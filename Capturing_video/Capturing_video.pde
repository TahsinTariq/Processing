import com.hamoid.*;
VideoExport videoExport;
boolean rec = false;

import processing.video.*;
Capture movie;

void setup(){
  size(640,480);
  //fullScreen();
  printArray(Capture.list());
  movie = new Capture(this, Capture.list()[21]);
  movie.start();
  
  String dst = str(hour()) + "_" + str(minute()) + "_" + str(second()) + "_" + str(millis()) +".mp4";
  videoExport = new VideoExport(this, dst);
  videoExport.setQuality(100, 128);
  videoExport.setFrameRate(60);  
  videoExport.startMovie(); 
}

void captureEvent(Capture movie){
  movie.read();
}

void draw(){
  image(movie,0,0);
  if(rec){
        videoExport.saveFrame();
  }
}
  
  
void mousePressed(){
  rec=!rec;
}

void keyPressed() {
  if (key == 'q') {
    videoExport.endMovie();
    exit();
  }
}
