import processing.video.*;
Particle[] particles;
Capture movie;

void setup(){
  size(640,480,P3D);
 // size(1280,720);

  printArray(Capture.list());
  movie = new Capture(this,Capture.list()[20]);
  movie.start();
  
  background(255);
  particles = new Particle[4000];
  for (int i=0; i < particles.length ; i++){
    particles[i]= new Particle();
  }
}

void captureEvent(Capture video){
  video.read();
}

void draw(){
 
 for ( int i=0; i< particles.length ; i++){
   particles[i].display();
   particles[i].move();
 }
}
