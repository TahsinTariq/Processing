int n = 300;

bubble[] b= new bubble [n];

boolean tgl= true;

void setup(){
  //size(1000,600);
  fullScreen(P2D);
  for (int i=0; i<n; i++)
  b[i]= new bubble();
  
}
void draw()
{
  background(255);
  for(int i=0; i<n; i++)
  {
    if (tgl==true)
  b[i].display1();
  if (tgl==false)
  b[i].display2();
  b[i].accend();
  }
}

void mouseClicked(){
  tgl=!tgl;
}
