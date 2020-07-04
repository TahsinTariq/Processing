/**
 * Edge Detection. 
 * 
 * A high-pass filter sharpens an image. This program analyzes every
 * pixel in an image in relation to the neighboring pixels to sharpen 
 * the image. This example is currently not accurate in JavaScript mode.
 */

float[][] kernel = {{ -1, -1, -1}, { -1,  9, -1}, { -1, -1, -1}};

//float[][] kernel = { { -.25, 0, .25 },{ -0,  .03, 0 },{ .25, 0, -.25 } }; 

 //sobel                    
//float[][] Ymatrix = { { -1, -2, -1 },{ 0,  0, 0 },{ 1, +2, 1 } }; 
//float[][] Xmatrix = { { -1, 0, 1 },{ -2,  0, +2 },{ -1, 0, 1 } };
                    
PImage img;

void setup() { 
  size(800, 600);
  img = loadImage("wahmen.png"); // Load the original image
  noLoop();
}

void draw() {
  image(img, 0, 0); // Displays the image from point (0,0) 
  img.loadPixels();
  // Create an opaque image of the same size as the original
  PImage edgeImg = createImage(img.width, img.height, RGB);
  // Loop through every pixel in the image.
  for (int y = 1; y < img.height-1; y++) { // Skip top and bottom edges
    for (int x = 1; x < img.width-1; x++) { // Skip left and right edges
      float sum = 0; // Kernel sum for this pixel
      for (int ky = -1; ky <= 1; ky++) {
        for (int kx = -1; kx <= 1; kx++) {
          // Calculate the adjacent pixel for this kernel point
          int pos = (y + ky)*img.width + (x + kx);
          // Image is grayscale, red/green/blue are identical
          float val = red(img.pixels[pos]);
          // Multiply adjacent pixels based on the kernel values
          sum += kernel[ky+1][kx+1] * val;
         //float sumX =0;
         //sumX += Xmatrix[ky+1][kx+1] * val;
         //float sumY =0;
         //sumY+= Ymatrix[ky+1][kx+1] * val;
         //sum =sqrt(sumX*sumX+sumY*sumY);
        }
      }
      // For this pixel in the new image, set the gray value
      // based on the sum from the kernel
      edgeImg.pixels[y*img.width + x] = color(sum);
    }
  }
  // State that there are changes to edgeImg.pixels[]
  edgeImg.updatePixels();
  image(edgeImg, width/2, 0); // Draw the new image
}
