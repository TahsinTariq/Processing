class PWindow extends PApplet {

  PWindow() {
    super();
    PApplet.runSketch(new String[] {this.getClass().getSimpleName()}, this);
  }

  void settings() {
    size(400, 200);
    
  }

  void setup() {
    surface.setTitle("GUI Window");
    surface.setResizable(false);
    surface.setLocation(width, height);
    background(150);
  }

  void draw() {
    rect(0,0, width, 40);
    if (0<mouseX && mouseX<width && 0<mouseY && mouseY<40){
      w = int(map(mouseX,0, width, 0,width ));
    }
  }
}
