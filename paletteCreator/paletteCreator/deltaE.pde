// https://en.wikipedia.org/wiki/Color_difference
//*********************************
double deltaE(color col1, color col2, int m) 
{
  double result = 0.0;
  if (col1 == col2) { return result; }
  //if (col1==color(0,0,0)) {col1=color(1,1,1);}
  //if (col2==color(0,0,0)) {col2=color(1,1,1);}
  double[] xyz1 = rgb2xyz(col1);  
  double[] lab1 = xyz2lab(xyz1);
 
  double[] xyz2 = rgb2xyz(col2);
  double[] lab2 = xyz2lab(xyz2);
 
  double c1 = Math.sqrt(lab1[1]*lab1[1]+lab1[2]*lab1[2]);
  double c2 = Math.sqrt(lab2[1]*lab2[1]+lab2[2]*lab2[2]);
  double dc = c1-c2;
  double dl = lab1[0]-lab2[0]; // lightness difference
  double da = lab1[1]-lab2[1]; // color difference
  double db = lab1[2]-lab2[2]; // opponent difference

  double dh = Math.sqrt((da*da)+(db*db)-(dc*dc));

  // color distance CIE76
  // deltaE = 2.3 correspond to JND (just noticeable difference)
  if (m == 1)
  {
    result = Math.sqrt((da*da)+(db*db)+(dc*dc));
    if (isNaN(result)) { println("is NaN"); }; 
  }

  double primo, secondo, terzo;

  // color distance CIE94 (graphic arts)  
  if (m == 2)
  {
    primo = dl;
    secondo = dc / (1.0 + 0.045*c1);
    terzo = dh / (1.0 + 0.015*c1);    
    result = (Math.sqrt(primo*primo + secondo*secondo + terzo*terzo));
    if (isNaN(result)) { println("is NaN"); };    
   
  }    
  
  // color distance CIE94 (textiles)
  if (m == 3)
  {  
    primo = dl / 2.0;
    secondo = dc / (1.0 + 0.048*c1);
    terzo = dh / (1.0 + 0.014*c1);
    result = (Math.sqrt(primo*primo + secondo*secondo + terzo*terzo));
    if (isNaN(result)) { println("is NaN"); };    
  }  
  return result;
}
 
//********************************* 
double [] rgb2xyz(color rgb) {
 
  double[] result = new double[3];
 
  //double rr = red(rgb)/255.0;
  //double gg = green(rgb)/255.0;
  //double bb = blue(rgb)/255.0;
  double rr = ((rgb >> 16) & 0xFF) / 255.0;
  double gg = ((rgb >> 8) & 0xFF) / 255.0;
  double bb = (rgb & 0xFF) / 255.0;  
 
  if (rr > 0.04045) {
    rr = (rr + 0.055) / 1.055;
    rr = Math.pow(rr, 2.4);
  } else {
    rr = rr / 12.92;
  }
  if (gg > 0.04045) {
    gg = (gg + 0.055) / 1.055;
    gg = Math.pow(gg, 2.4);
  } else {
    gg = gg / 12.92;
  }
  if (bb > 0.04045) {
    bb = (bb + 0.055) / 1.055;
    bb = Math.pow(bb, 2.4);
  } else {
    bb = bb / 12.92;
  }
 
  bb *= 100.0;
  rr *= 100.0;
  gg *= 100.0;
 
  result[0] = rr * 0.4124 + gg * 0.3576 + bb * 0.1805;
  result[1] = rr * 0.2126 + gg * 0.7152 + bb * 0.0722;
  result[2] = rr * 0.0193 + gg * 0.1192 + bb * 0.9505;
 
  return result;
}
 
//********************************* 
double [] xyz2lab(double[] xyz) {
 
  double[] result = new double[3];

  // luminance values
  double x = xyz[0] / 95.047;
  double y = xyz[1] / 100.0;
  double z = xyz[2] / 108.8900;
 
  if (x > 0.008856) {
    x = Math.pow(x, 1.0/3.0);
  } else {
    x = 7.787*x + 16.0/116.0;
  }
  if (y > 0.008856) {
    y = Math.pow(y, 1.0/3.0);
  } else {
    y = (7.787*y) + (16.0/116.0);
  }
  if (z > 0.008856) {
    z = Math.pow(z, 1.0/3.0);
  } else {
    z = 7.787*z + 16.0/116.0;
  }
 
  result[0] = 116.0*y - 16.0;
  result[1] = 500.0*(x-y);
  result[2] = 200.0*(y-z);
 
  return result;
}

boolean isNaN(double x)
{
  return (x != x);
}  