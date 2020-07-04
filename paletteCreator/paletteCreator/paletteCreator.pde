// PALETTE CREATOR
// by cameyo 2015
// paletteCreator.pde
// processing 3,x

// needed for precision
import java.lang.Math;

PFont font;
// max colors
int maxCol = 256;
// number of palette colors
int numCol;
// more than maxCol on palette
boolean overColor;
// define palette
color[] palette = new color[maxCol];
double[] dist = new double[maxCol];
// Max distance between colors
float maxDist;
// image parameters
PImage img;
String imgName;
int imgW, imgH;
float imgX, imgY, lenX, lenY;
float lenXs, lenYs;
float scale;
int totPixels, numPixel;
// distance method
// 1 ->  CIE74
// 2 ->  CIE94 (graphic arts)
// 3 ->  CIE94 (textiles)
int distMethod;
// start calc palette
boolean start;
// update GUI
boolean updateGUI;
// color picked
color pCol;
//GUI
Button btnSAVE, btnSTART, btnOPEN, btnSORT;
Button btnM1, btnM2, btnM3;
SpinBound spnM, spnD;
// first run
boolean first;
//double delta;


//*********************************
void setup()
{
  size(640, 480);
  smooth();
  background(60);
  font = createFont("Calibri Bold", 14);
  textFont(font);
  textAlign(LEFT);
  first = true;
 
  // set globar var
  maxDist = 10;
  distMethod = 2;  
  // load image
  imgName = "gioconda.jpg";
  img = loadImage(imgName);
  // set image GUI values
  imgW = img.width;
  imgH = img.height;
  totPixels = imgW * imgH;
  numPixel = 0;  
  imgX = 0;
  imgY = 170;
  lenX = 320;
  lenY = 240;
 
  // create GUI
  btnSTART = new Button(imgX + lenX + 160, imgY + 60 , 120, 30, "btn_START", "Create Palette", color(100), color(#93a1a1));
  btnSAVE = new Button(imgX + lenX + 160, imgY + 180 , 120, 30, "btn_SAVE", "Save Palette", color(100), color(#93a1a1));
  btnOPEN = new Button(imgX + lenX + 160, imgY + 240 , 120, 30, "btn_OPEN", "Open Image", color(100), color(#93a1a1));
  //btnOPEN = new Button(imgX + lenX + 160, imgY + 180 , 120, 30, "btn_OPEN", "Open Image", color(100), color(#93a1a1));
  btnSORT = new Button(imgX + lenX + 160, imgY + 120 , 120, 30, "btn_SORT", "Sort colors", color(100), color(#93a1a1));
  //btnSORT = new Button(imgX + lenX + 160, imgY + 240 , 120, 30, "btn_SORT", "Sort colors", color(100), color(#93a1a1));
  btnM1 = new Button(imgX + lenX + 11, imgY + 36 , 20, 20, "btn_M1", "1", color(100), color(#93a1a1));
  btnM2 = new Button(imgX + lenX + 36, imgY + 36 , 20, 20, "btn_M2", "2", color(100), color(#93a1a1));  
  btnM3 = new Button(imgX + lenX + 61, imgY + 36 , 20, 20, "btn_M3", "3", color(100), color(#93a1a1));
  spnD = new SpinBound(imgX + lenX + 10, imgY + 78, 80, 20, 10, 0.5, 1, 32, color(100), "update_D");  
  
  init();  

}

void init()
{
  start = false;
  updateGUI = true;
  numCol = 0;
  overColor = false;
  pCol = color(0);
  numPixel = 0;  
  first = true;
  for (int i=0; i < maxCol; i++)
  {
    //palette[i] = (int)sqrt(-1);
    palette[i] = color(255);    
    dist[i] = 0.0;
  }  
    
}  
  
//*********************************
void draw() 
{
  if (start)
  {
    start = false;
    // create palette from image 
    cursor(WAIT);
    createPalette(img);
    cursor(ARROW);
  }
  
  if (updateGUI)
  {
    updateGUI = false;
    background(#002b36);    
    // draw palette on canvas
    drawPalette();
    // show image
    showIMG();
    // draw picked color
    stroke(#93a1a1);
    fill(pCol);
    rect(width-46, imgY, 20, 20);
    fill(#93a1a1);
    text("#" + hex(pCol,6), width-60, imgY + 32);
    // show info
    showInfo();
    // draw buttons and spinners
    btnSTART.show();
    btnSAVE.show();
    btnOPEN.show();
    btnSORT.show();
    btnM1.show();
    btnM2.show();
    btnM3.show();
    spnD.show();
  }  
 
}  

void showInfo()
{
  String mm="";
  fill(#93a1a1);
  text("Image: " + imgName, 10, imgY + lenY + 22);
  text("Dimension: "+ img.width + " x " + img.height + " --> " + (img.width*img.height) + " pixels", 10, imgY + lenY + 40);
  fill(#839496);
  text("P A L E T T E   C R E A T O R", 10, imgY + lenY + 60);
  fill(#93a1a1);  
  if (overColor)
  {
    fill(#dc322f);
    text("Palette colors: more than " + numCol, imgX + lenX + 10, imgY + 14);
  }
  else
  {
    text("Palette colors: " + numCol, imgX + lenX + 10, imgY + 14);
  }
  fill(#93a1a1);  
  if (distMethod == 1) { mm = "CIE76"; }
  else if (distMethod == 2) { mm = "CIE94 (graphic arts)"; }
  else if (distMethod == 3) { mm = "CIE94 (textiles)"; }
  text("Method " + distMethod + ": " + mm, imgX + lenX + 10, imgY + 32);  
  text("Distance", imgX + lenX + 10, imgY + 75);  
}  

//*********************************
void drawPalette()
{
  int s = 20;
  int r = 8; 
  int c = 32;
  int x = 0;
  int y = 0;
  int k = 0;  

  if (numCol != 0)
  {
  noStroke();
  for (int i = 0; i < r; i++)
  {
    if (numCol < k+1) { break; }
    for (int j = 0; j < c; j++)
    { 
      if (numCol < k+1) { break; }
      fill(palette[k]);
      rect(x + (j*s), y + (i*s), s, s);
      k++;
    }
  }
  }
}

//*********************************
void savePalette()
{
  String[] txt = new String[numCol];
  int k=0;
  while (k < numCol) 
  {
    txt[k] = "#" + hex(palette[k], 6) + ", ";
    k++;
  }
  saveStrings(newFilename()+".txt", txt);
}  

//*********************************
// pick some random good color
color somecolor() 
{
  return palette[int(random(0, numCol))];
}

//*********************************
void createPalette(PImage imgPal) 
{
  //PImage b;
  //int x=0, y=0;
  //b = loadImage(fn);
  //image(b,0,0);
  imgPal.loadPixels();
  imgW = imgPal.width;
  imgH = imgPal.height;
  totPixels = imgW * imgH;
  numPixel = 0;
  numCol = 0;
  if (first)
  {
   first = false;
   numCol = 0;    
  }
  else
  {
   palette[0] = pCol;
   numCol = 1;
  }    
  // scan image pixels
  for (int x=0; x < imgPal.width; x++)
  {
    for (int y=0; y < imgPal.height; y++) 
    {
      numPixel++;
      // get color
      //color c = imgPal.get(x, y);
      color c = imgPal.pixels[y*imgPal.width+x];
      boolean exists = false;
      // check if color exists
      for (int n=0; n<numCol; n++) 
      {
        //if (c == palette[n])
        if (deltaE(c, palette[n], distMethod) < maxDist)
        {
          //println(deltaE(c, palette[n]));
          exists = true;
          break;
        }
      }
      // add color to paletteA6693A
      if (!exists) 
      {
        // palette is full ?
        if (numCol<maxCol) 
        {
          palette[numCol] = c;
          numCol++;
        } 
        // exit function
        else 
        { 
          //println("More than " +maxCol+ " colors...");
          overColor = true;
          x = imgPal.width; 
          y = imgPal.height;
          numPixel = totPixels;
          //println(numCol);
          break;
        }
      }
    }
  }
  pCol = palette[0];
  //println(hex(pCol,6));  
  
  //println(numCol);
}  

//*********************************
void mousePressed()
{
  int mx = mouseX;
  int my = mouseY;
  //println(mx,my);

  updateGUI = true;
  
  if (((my < 160+lenY)&&(mx < lenX)) ||  (my < 160))
  {
    pCol = get(mx,my);
  }

  // Check buttons
  btnSTART.onClick();
  btnSAVE.onClick();
  btnOPEN.onClick();
  btnSORT.onClick();
  btnM1.onClick();
  btnM2.onClick();
  btnM3.onClick();
  spnD.onClick();
}  

//*********************************
void keyPressed()
{
  // show info
  if (key==' ')  { btn_START(); }
  // save image
  if (key=='o'||key=='O') { btn_SAVE(); }
  
  // change max color distance value
  if (key=='+') 
  {
    maxDist += 0.5;
    maxDist = (constrain(maxDist,1,32));
    spnD.setValue(maxDist);    
    updateGUI = true;
  }
  if (key=='-') 
  { 
    maxDist -= 0.5;
    maxDist = (constrain(maxDist,1,32));    
    spnD.setValue(maxDist);
    updateGUI = true;
  }  

  // sort colors
  if (key=='c'||key=='C') { btn_SORT(); }
 

  // save image
  if (key=='s'||key=='S') { 
    saveIMG();
    updateGUI = true;    
  }
  
  // distance method
  if (key=='1') { btn_M1(); }
  if (key=='2') { btn_M2(); }
  if (key=='3') { btn_M3(); }

  // change max color distance value
  if (key=='+') 
  {
    maxDist += 0.5;
    maxDist = (constrain(maxDist,1,32));
    spnD.setValue(maxDist);    
    updateGUI = true;
  }
  if (key=='-') 
  { 
    maxDist -= 0.5;
    maxDist = (constrain(maxDist,1,32));    
    spnD.setValue(maxDist);
    updateGUI = true;
  }  
  

}

//*********************************
void info()
{
  String FM = "col = " + numCol;
  FM = FM + ", dist = " + maxDist;
  FM = FM + ", method = " + distMethod;
  FM = FM + ", pixel: " + numPixel + " of " + totPixels; 
  //FM = FM + nf(frameRate, 0, 0);
  surface.setTitle(FM);
}    

//*********************************
void showIMG()
{
  scaleIMG();
  imageMode(CENTER);
  image(img, imgX+lenX/2, imgY+lenY/2, lenXs, lenYs);
  imageMode(CORNER);
  // draw rect image
  noFill();
  stroke(#93a1a1);
  rect(imgX, imgY,  lenX, lenY);
}  

//*********************************
void saveIMG()
{
  String filename = newFilename();
  save(filename+".png");
  savePalette();
}

//*********************************
String newFilename()
{
  int y, m, d;
  int hh, mm, ss;
  String name, out;
  y=year(); 
  m=month(); 
  d=day();
  hh=hour(); 
  mm=minute(); 
  ss=second();
  name=getClass().getSimpleName();
  out=name+"-"+y+"-"+nf(m, 2)+"-"+nf(d, 2)+"."+nf(hh, 2)+"-"+nf(mm, 2)+"-"+nf(ss, 2);
  return out;
}

//*********************************
void openLoad()
{
  noLoop();
  selectInput("Select an image to process", "loadIMG");
}

//*********************************
void loadIMG(File selection) 
{
  if (selection == null) 
  {
    //println("No file selected.");
  } 
  else 
  {
    img = loadImage (selection.getAbsolutePath());
    imgName=selection.getAbsolutePath();
    init();
  }
  loop();
}

//*********************************
void scaleIMG()
{
  scale = min(lenX/img.width, lenY/img.height);
  lenXs = img.width * scale;
  lenYs = img.height * scale;
}

//*********************************
void sortColors()
{
  // calculate color distance from black
  //for (int i = 0; i < numCol; i++)
  //{
  //  dist[i] = deltaE(color(1,1,1), palette[i], distMethod);
  //}
  
  //calculate color distance as luminosity
  for (int i = 0; i < numCol; i++)
  {
   double rr = ((palette[i] >> 16) & 0xFF) / 255.0;
   double gg = ((palette[i] >> 8) & 0xFF) / 255.0;
   double bb = (palette[i] & 0xFF) / 255.0;
   //dist[i] = rr * 0.241 + gg * 0.691 + bb * 0.068;
   dist[i] = Math.pow(rr,2.2) * 0.2126 + Math.pow(gg,2.2) * 0.7152 + Math.pow(bb,2.2) * 0.0722;
  }  
  
  // sort
  double temp = 0.0;
  color tempC = color(1,1,1);

  for (int i = 0; i < numCol; i++) 
  {
    for (int j = 1; j < (numCol - i); j++) 
    {
      if (dist[j-1] > dist[j]) 
      {
        temp = dist[j-1];
        dist[j-1] = dist[j];
        dist[j] = temp;
        tempC = palette[j-1];
        palette[j-1] = palette[j];
        palette[j] = tempC;
      }   
    }
  }
  // print ordered colors
  //for (int i = 0; i < numCol; i++)
  //{
  //  println(hex(palette[i],6), dist[i]);
  //}  
}

//*********************************    
void btn_START()
{
  start = true;
  updateGUI = true;    
  numCol = 0;
  overColor = false;
}
//*********************************
void btn_SAVE()
{
  updateGUI = true;  
  saveIMG();
}
//*********************************
void btn_OPEN()
{
  updateGUI = true;    
  openLoad();
}
//*********************************
void btn_SORT()
{
  updateGUI = true;  
  sortColors();
}
//*********************************
void btn_M1()
{
  updateGUI = true;  
  distMethod = 1;
}
//*********************************
void btn_M2()
{
  updateGUI = true;  
  distMethod = 2;
}    
//*********************************
void btn_M3()
{
  updateGUI = true;  
  distMethod = 3;
}    
//*********************************
void update_D()
{
  maxDist = spnD.getValue();
  updateGUI = true;
}