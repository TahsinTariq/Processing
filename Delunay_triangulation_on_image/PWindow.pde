class PWindow extends PApplet {

  PWindow() {
    super();
    PApplet.runSketch(new String[] {this.getClass().getSimpleName()}, this);
  }
  OpenCV ocv;
  void settings() {
    size(img.width, img.height);
    ocv = new OpenCV(this, img); 
  }

  void setup() {
    surface.setTitle("GUI Window");
    surface.setResizable(false);
    surface.setLocation(-1920, 0);
    background(150);
  }

  void draw() {
    ocv.loadImage(img);
   ocv.brightness((int)map(mouseX, 0, width, -255, 255));
   //opencv.threshold(int(map(mouseX, 0, width, 0,255)));
   //println((int)map(mouseX, 0, width, -255, 255));
   t =ocv.getOutput();
  image(t,0,0);
  }
}
