import processing.video.*;

/**
 * Convolution
 * by Daniel Shiffman.  
 * 
 * Applies a convolution matrix to a portion of an image. Move mouse to 
 * apply filter to different parts of the image. This example is currently
 * not accurate in JavaScript mode.
 */

Capture img;
int w = 120;

// It's possible to convolve the image with many different 
// matrices to produce different effects. This is a high-pass 
// filter; it accentuates the edges. 
float[][] matrix = { { -1, -1, -1 },
                     { -1,  9, -1 },
                     { -1, -1, -1 } }; 
                     
//float[][] matrix = { { -.25, 0, .25 },{ -0,  .03, 0 },{ .25, 0, -.25 } }; 
 //sobel                    
//float[][] Ymatrix = { { -1, -2, -1 },{ 0,  0, 0 },{ 1, +2, 1 } }; 
//float[][] Xmatrix = { { -1, 0, 1 },{ -2,  0, +2 },{ -1, 0, 1 } }; 
//robert                     
//float[][] Ymatrix = { { 0, 1 },{ -1,  0}}; 
//float[][] Xmatrix = { { 1, 0 },{ 0,  -1 }};

void setup() {
  size(640, 480);
  img = new Capture(this, 640,480);
  
  img.start();
}

void captureEvent(Capture vid) {
  vid.read();
}
void draw() {
  // We're only going to process a portion of the image
  // so let's set the whole image as the background first
  image(img, 0, 0);
 // image(img,0,img.height);
  filter(GRAY);
  // Calculate the small rectangle we will process
  //int xstart = constrain(mouseX - w/2, 0, img.width);
  //int ystart = constrain(mouseY - w/2, 0, img.height);
  //int xend = constrain(mouseX + w/2, 0, img.width);
  //int yend = constrain(mouseY + w/2, 0, img.height);
  int xstart = 0;
  int ystart=0;
  int xend= img.width;
  int yend = height;
  int matrixsize = matrix.length;
  loadPixels();
  // Begin our loop for every pixel in the smaller image
  for (int x = xstart; x < xend; x++) {
    for (int y = ystart; y < yend; y++ ) {
      color c = convolution(x, y, matrix, matrixsize, img);
      
      //2 matricis
      //color c = convolution(x, y, Xmatrix,Ymatrix, matrixsize, img);
      int loc = x + y*img.width;
      pixels[loc] = c;
    }
  }
  updatePixels();
}

color convolution(int x, int y, float[][] Xmatrix,float[][] Ymatrix, int matrixsize, PImage img)
{
  //float rtotal = 0.0;
  //float gtotal = 0.0;
  //float btotal = 0.0;
  float grayX =0;
   float grayY =0;
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
      //rtotal += (red(img.pixels[loc]) * matrix[i][j]);
      //gtotal += (green(img.pixels[loc]) * matrix[i][j]);
      //btotal += (blue(img.pixels[loc]) * matrix[i][j]);
      grayY += (img.pixels[loc]) * Ymatrix[i][j];
      grayX += (img.pixels[loc]) * Xmatrix[i][j];
    }
  }
  // Make sure RGB is within range
  //rtotal = constrain(rtotal, 0, 255);
  //gtotal = constrain(gtotal, 0, 255);
  //btotal = constrain(btotal, 0, 255);
  grayY = constrain(grayY,0,255);
  grayX = constrain(grayX,0,255);
  // Return the resulting color
 // return color(rtotal, gtotal, btotal);
  return color(constrain(sqrt(grayX*grayX+grayY*grayY),0,255));
}


color convolution(int x, int y, float[][] matrix, int matrixsize, Capture img)
{
  //float rtotal = 0.0;
  //float gtotal = 0.0;
  //float btotal = 0.0;
  float gray =0;
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
      //rtotal += (red(img.pixels[loc]) * matrix[i][j]);
      //gtotal += (green(img.pixels[loc]) * matrix[i][j]);
      //btotal += (blue(img.pixels[loc]) * matrix[i][j]);
      gray += (img.pixels[loc]) * matrix[i][j];
    }
  }
  // Make sure RGB is within range
  //rtotal = constrain(rtotal, 0, 255);
  //gtotal = constrain(gtotal, 0, 255);
  //btotal = constrain(btotal, 0, 255);
  gray = constrain(gray,0,255);
  // Return the resulting color
 // return color(rtotal, gtotal, btotal);
  return color(gray);
}
