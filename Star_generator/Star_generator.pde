void setup(){
size (500,500);
background(0);
noStroke();
smooth();
}

void draw(){
 if (mousePressed){
     ellipse(mouseX+random(-50,50),mouseY+random(-50,50),3,3);
     fill(random(1,255),70);

}
}
  
void keyPressed() {
  if (key =='r' || key == 'R'){
   fill(random(1,255),mouseX,150);
}
}
