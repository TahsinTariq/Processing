Particle[] particles;
PImage image;

void settings(){
  image = loadImage("a.jpg");
  size(image.width,image.height);
}

void setup(){
  background(255);
  surface.setLocation(0,0);
  particles = new Particle[2000];
  for (int i=0; i < particles.length ; i++){
    particles[i]= new Particle();
    noStroke();
  }
}

void draw(){
 //background(255);
 for ( int i=0; i< particles.length ; i++){
   particles[i].display();
   particles[i].move();
 }
}
