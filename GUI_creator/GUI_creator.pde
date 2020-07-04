PWindow win;
int w =0;
int h = 0;
public void settings() {
  size(320, 240);
}

void setup() { 
  win = new PWindow();
  //println(win.width,win.height);
}

void draw() {
  background(255, 0, 0);
  ellipse(w, h, 50,50);
}

void mousePressed() {
  println("mousePressed in primary window");
} 
