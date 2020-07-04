import gab.opencv.*;
OpenCV opencv;
PImage [] img = new PImage[366];
PImage o;
  PImage create = createImage(640, 480, RGB);

void setup() {
  size( 640, 480);
  background(255);
//  create.loadPixels();
//for (int i = 0; i < create.pixels.length; i++) {
//  create.pixels[i] = color(0, 90, 102); 
//}
//create.updatePixels();
}

void draw() {
  for (int i=0; i<366; i++) {
    //i=13;
    try {
      if (i<10)
        img[i] = loadImage("E:/Assignment/For Maliha apu/dataset-master/dataset-master/JPEGImages/BloodImage_0000"+i+".jpg");
      if (i>9 && i<100)
        img[i] = loadImage("E:/Assignment/For Maliha apu/dataset-master/dataset-master/JPEGImages/BloodImage_000"+i+".jpg");
      if (i>99 && i<1000)
        img[i] = loadImage("E:/Assignment/For Maliha apu/dataset-master/dataset-master/JPEGImages/BloodImage_00"+i+".jpg");
      image(img[i], 0, 0);
      opencv = new OpenCV(this, img[i]);
      o = img[i];
    }
    catch (NullPointerException a ) {
    }
    opencv.findCannyEdges(20, 75);
    PImage t = opencv.getSnapshot();     
    t.loadPixels();
    for (int x = 0; x<t.width; x++)
      for (int y = 0; y<t.height; y++) {
        int loc = x+ y* t.width;
        color c = t.pixels[loc];
            create.loadPixels();
        if (c == 255) {
          create.pixels[loc]=c;
        }
        else  {
          o.loadPixels();
          c= o.pixels[loc];
          create.pixels[loc]=c;
      }
      create.updatePixels();
        //} 
        //stroke(0, 255, 0);
        //  strokeWeight(50);
          t.updatePixels();
        //o.loadPixels();
        //  o.pixels[i] = color(0, 255, 0);
          o.updatePixels();
        image(create, 0, 0);
        //for (Contour contour : c) {
        //  stroke(0, 255, 0);
        //  contour.draw();
        //}
        create.save("/frame/"+i+".png");
        println(i);
        delay(30000);
        //saveFrame("/frame/"+i+".png");
      }
  }
}
