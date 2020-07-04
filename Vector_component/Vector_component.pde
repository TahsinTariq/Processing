  float mx=0,my=0,mz=0;
  float rx=0,ry=0;
  
  void setup() {
    size(1080, 720, P3D); 
    background(0);
    lights();
    stroke(255);
  }
  
  void draw() {
    background(255);
    
    pushMatrix();
    translate(width/2,0);
    
    fill(200,127,50,150);
   if (mouseButton == LEFT && mouseX > 0 && mouseX<width 
       && mouseY > height-50-10 && mouseY<height-50+20+10)
    mx=mouseX-width/2;
    rect(mx,height-50,20,20);
    
    fill(127,50,200,150);
    if (mouseButton == LEFT && mouseX > 0 && mouseX<width 
       && mouseY > height-100-10 && mouseY<height-100+20+10)
    my=mouseX-width/2;
  rect(my,height-100,20,20);
    
    fill(50,127,200,150);
     if (mouseButton == LEFT && mouseX > 0 && mouseX<width 
       && mouseY > height-150-10 && mouseY<height-150+20+10)
    mz=mouseX-width/2;
    rect(mz,height-150,20,20);
    popMatrix();
    
    pushMatrix();
    translate(width>>1, height>>1);
    
   
    
    if (mouseButton == RIGHT){
    rx=(map(mouseX, 0,width, 0, 10));
    ry=(map(mouseY, 0,width, 0, 10));
  }
  rotateY(rx);
  rotateX(ry);
  
  strokeWeight(1);
   stroke(0);
    line(0,50,0,0,0,0);
    line(0,0,0,50,0,0);
    line(0,0,0,0,0,50);
    
  
  noFill();
    stroke(0);
    box(200);
    strokeWeight(3);
    //X coordinate
    map(mx,0,width,-500,500);
    stroke(200,127,50);
    line(0,mx,0,0,0,0);
    //Y coordinate
    map(my,0,width,-500,500);
    stroke(127,50,200);
    line(0,0,0,my,0,0);
    //Z coordinate
    map(mz,0,width,-500,500);
    stroke(50,127,200);
    line(0,0,0,0,0,mz);
    //NET vector
    stroke(200,50,127);
    line(0,0,0,my,mx,mz);
    popMatrix();
  
  }
