import gab.opencv.*;
import java.util.Arrays;
//import com.hamoid.*;
//VideoExport videoExport;
//boolean rec = false;
OpenCV opencv;

import processing.video.*;
Capture movie;
//PImage movie;
PImage img;

int matrixsize = 3;

                     
void settings(){
  size(640*2,480);
}
void setup(){
  //fullScreen();
  printArray(Capture.list());
  movie = new Capture(this, 640,480);
  ////movie = new Capture(this, 640,480, "USB Camera", 30);
  movie.start();
  //movie = loadImage("moon-wide.jpg"); 
  img = createImage(movie.width, movie.height, RGB);
  
  opencv = new OpenCV(this, movie); 
  //String dst = str(hour()) + "_" + str(minute()) + "_" + str(second()) + "_" + str(millis()) +".mp4";
  //videoExport = new VideoExport(this, dst);
  //videoExport.setQuality(100, 128);
  //videoExport.setFrameRate(60);  
  //videoExport.startMovie(); 
}

void captureEvent(Capture movie){
  movie.read();
}

void draw(){
  
  //float[][] matrix = { { -1, -1, -1 },
  //                   { -1,  map(mouseY, 0, height, 0, 15), -1 },
  //                   { -1, -1, -1 } };
   float[][] matrix = { { -1, -1, -1 },
                        { -1,  9, -1 },
                        { -1, -1, -1 } };
  float adjustbrightness = map(mouseX, 0, width, -255, 255);
  
  //best values: -45 to -40            8.0
  println(adjustbrightness, map(mouseY, 0, height, 0, 15));
  
  image(movie,0,0, width/2, height);
  
  
  
  //Brightness
  movie.loadPixels();
  img.loadPixels();
  for (int x = 0; x < movie.width; x++) {
    for (int y = 0; y < movie.height; y++ ) {
      int loc = x + y*movie.width;
      
      float r,g,b;
      
      r = red (movie.pixels[loc]);
      g = green (movie.pixels[loc]);
      b = blue (movie.pixels[loc]);
      
      
      
      r += adjustbrightness;
      g += adjustbrightness;
      b += adjustbrightness;
      
      color c = color(r, g, b);
      img.pixels[y*movie.width + x] = c;
    }
  }
  img.updatePixels();
  
  //Sharpen
  PImage img2 = createImage(movie.width, movie.height, RGB);
  
  img2.loadPixels();
  for (int x = 0; x < movie.width; x++) {
    for (int y = 0; y < movie.height; y++ ) {
      color c = convolution(x, y, matrix, matrixsize, img);
      int loc = x + y*img.width;
      img2.pixels[loc] = c;
    }
  }
  img2.updatePixels();
  
  //Median Filter
  PImage img3 = createImage(movie.width, movie.height, RGB);
  
  img3.loadPixels();
  
  for (int x = 0; x < movie.width; x++) {
    for (int y = 0; y < movie.height; y++ ) {
      color c = med(x, y, img2);
      int loc = x + y*img3.width;
      img3.pixels[loc] = c;
      
    }
  }
  //color[] pixel=new color[9];
  //float[] R=new float[9];
  //float[] B=new float[9];
  //float[] G=new float[9];
  //for(int i=1;i<movie.width-1;i++)
  //    for(int j=1;j< movie.height-1;j++)
  //    {
  //       pixel[0]= color(img3.get(i-1,j-1));
  //       pixel[1]= color(img3.get(i-1,j));
  //       pixel[2]= color(img3.get(i-1,j+1));
  //       pixel[3]= color(img3.get(i,j+1));
  //       pixel[4]= color(img3.get(i+1,j+1));
  //       pixel[5]= color(img3.get(i+1,j));
  //       pixel[6]= color(img3.get(i+1,j-1));
  //       pixel[7]= color(img3.get(i,j-1));
  //       pixel[8]= color(img3.get(i,j));
  //       for(int k=0;k<9;k++){
  //           R[k]= red(pixel[k]);
  //           B[k]= blue(pixel[k]);
  //           G[k]= green(pixel[k]);
  //       }
  //       Arrays.sort(R);
  //       Arrays.sort(G);
  //       Arrays.sort(B);
  //       img3.set(i,j, color(R[4],B[4],G[4]));
  //    }
  img3.updatePixels();
  
  
  if(mousePressed){
    image(img3,width/2,0, width/2, height);
  }
  else image(img2,width/2,0, width/2, height);
  //if(rec){
  //      videoExport.saveFrame();
  //}
}
  
  
//void mousePressed(){
//  rec=!rec;
//}

void keyPressed() {
  //if (key == 'q') {
  //  videoExport.endMovie();
  //  exit();
  //}
  if(key =='s'){
    save("Output/"+str(hour()) + "_" + str(minute()) + "_" + str(second()) + "_" + str(millis()) +".png");
  }
}



color convolution(int x, int y, float[][] matrix, int matrixsize, PImage img)
{
  float rtotal = 0.0;
  float gtotal = 0.0;
  float btotal = 0.0;
  int offset = matrixsize / 2;
  for (int i = 0; i < matrixsize; i++){
    for (int j= 0; j < matrixsize; j++){
      // What pixel are we testing
      int xloc = x+i-offset;
      int yloc = y+j-offset;
      int loc = xloc + img.width*yloc;
      // Make sure we haven't walked off our image, we could do better here
      loc = constrain(loc,0,img.pixels.length-1);
      // Calculate the convolution
      rtotal += (red(img.pixels[loc]) * matrix[i][j]);
      gtotal += (green(img.pixels[loc]) * matrix[i][j]);
      btotal += (blue(img.pixels[loc]) * matrix[i][j]);
    }
  }
  // Make sure RGB is within range
  rtotal = constrain(rtotal, 0, 255);
  gtotal = constrain(gtotal, 0, 255);
  btotal = constrain(btotal, 0, 255);
  // Return the resulting color
  return color(rtotal, gtotal, btotal);
}


color med(int x, int y, PImage img)
{
  int matrixsize = 3;
  int offset = matrixsize / 2;
  //float[] max = new float[9];
  float[] R=new float[9];
  float[] B=new float[9];
  float[] G=new float[9];
  for (int i = 0; i < matrixsize; i++){
    for (int j= 0; j < matrixsize; j++){
      // What pixel are we testing
      int xloc = x+i-offset;
      int yloc = y+j-offset;
      int loc = xloc + img.width*yloc;
      // Make sure we haven't walked off our image, we could do better here
      loc = constrain(loc,0,img.pixels.length-1);
      // Calculate the convolution
      //max[i*matrixsize + j] = (red(img.pixels[loc])+ green(img.pixels[loc]) +blue(img.pixels[loc]));
      R[i*matrixsize + j] = red(img.pixels[loc]);
      G[i*matrixsize + j] = green(img.pixels[loc]);
      B[i*matrixsize + j] = blue(img.pixels[loc]);
    }
  }
  
  // Make sure RGB is within range
  // Return the resulting color
  return color(R[4], G[4], B[4]);
}
