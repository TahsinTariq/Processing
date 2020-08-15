import pthreading.*;

PThreadManager manager;
drawer x,y;
int n  = 1000;
float radius = 10;
void settings() {  
  size(640, 480);
}
void setup() {
  manager = new PThreadManager(this, drawer.class, 2, 60, 1000); // instantiate manager with 2 threads
  
  manager.addThread(drawer.class, 2, 60, 2000); // create two threads using Gravicubes class

  x = new drawer(this, 5000); // create a fifth thread (instance)
  y = new drawer(this, 5000); // create a sixth thread (instance)
  manager.addThread(x); // add thread instance to manager to run it
  manager.addThread(y); // add thread instance to manager to run it
}

void draw() {
  
  fill(255, 100);
  rect(0, 0, width, height);
  manager.draw();
  
}
