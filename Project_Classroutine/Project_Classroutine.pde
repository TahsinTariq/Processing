

box a, b;
int l=0,k=0,j=0;


boolean tgl= false;
void setup(){
  size(1000,600);
  a = new box();
  b = new box();
}

void draw(){  
  if(l==0){
  l= a.display(tgl);
  tgl=false;}
  if (l>0){
    if (k==0){
    k=a.display2(l, tgl);
    tgl=false;}
    if (k>0)
      if(j==0) 
      j=a.display3(k,tgl);
      tgl=false;
  }
  
}


void mousePressed(){
  tgl = ! tgl;
}
