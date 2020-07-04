class box{
int sq_len=100 , sq_num=5 , sq_spc=sq_len+20,p,q,r,m;

box(){
}

int display(boolean tgl){
  background(255);
  textSize(15);
  //__________________________________________________________STRINGS
  String s1= "sunday";
String s2= "monday";
String s3 = "tuesday";
String s4 ="wednesday";
String s5 ="thursday";
  //__________________________________________________________STRINGS
  for (int i=1; i<sq_num+1; i++/*,sq_spc+=60*/){
      //__________________________________________________________TEXT
    fill(0,0,255);
    if(i==1)
    text(s1,sq_spc*i+sq_len/8,height/2+sq_len/2);
    if(i==2)
    text(s2,sq_spc*i+sq_len/8,height/2+sq_len/2);
    if(i==3)
    text(s3,sq_spc*i+sq_len/8,height/2+sq_len/2);
    if(i==4)
    text(s4,sq_spc*i+sq_len/8,height/2+sq_len/2);
    if(i==5)
    text(s5,sq_spc*i+sq_len/8,height/2+sq_len/2);
      //__________________________________________________________TEXT
    fill(255,0,255,127);
    if (mouseX>sq_spc*i && mouseX<sq_spc*i+sq_len && mouseY>height/2 && mouseY<height/2+sq_len)
    {
      rect(sq_spc*i,height/2,sq_len,sq_len,15);
    if(tgl==true)
    {
      tgl=false;
      m=i;
      int p=days(i);
      return p;
    }
    }
    else
    rect(sq_spc*i,height/2,sq_len,sq_len);
    
  }
  return 0;
}



int display2(int sq_num, boolean tgl){
  background(255);
  fill(255,127,0);
  textSize(15);
  //m and i
    //__________________________________________________________STRINGS
  String m1i1= "FEEE";
String m1i2= "FEEE LAB";
String m2i1 = "ACCOUNTING";
String m2i2 ="PROGRAMMING";
String m2i3 ="MATH";
String m2i4 ="FME LAB";
String m3i3 ="ENGLISH";
String m4i2 ="PROGRAMMING LAB";
String m3i1 ="FME";
  //__________________________________________________________STRINGS
  
  for (int i=1; i<sq_num+1; i++/*,sq_spc+=60*/){
    
          //__________________________________________________________TEXT
    fill(50,127,255);
    if(m==1 && i==1 || m==3 && i==2)
    text(m1i1,sq_spc*i,height/2);
    if(m==1 && i==2)
    text(m1i2,sq_spc*i,height/2);
    if(m==2 && i==1 || m==5 && i==1)
    text(m2i1,sq_spc*i,height/2);
    if(m==2 && i==2 || m==4 && i==1 || m==4 && i==3)
    text(m2i2,sq_spc*i,height/2);
    if(m==2 && i==3 || m==5 && i==3)
    text(m2i3,sq_spc*i,height/2);
    if(m==2 && i==4)
    text(m2i4,sq_spc*i,height/2);
    if(m==3 && i==3 || m==5 && i==4)
    text(m3i3,sq_spc*i,height/2);
    if(m==4 && i==2)
    text(m4i2,sq_spc*i,height/2);
    if(m==3 && i==1 || m==5 && i==2)
    text(m3i1,sq_spc*i,height/2);
      //__________________________________________________________TEXT
      
      fill(0,255,127);
    if (mouseX>sq_spc*i && mouseX<sq_spc*i+sq_len && mouseY>height/2 && mouseY<height/2+sq_len)
    {
      rect(sq_spc*i,height/2,sq_len,sq_len,15);
      if (tgl==true){
      tgl=false;
      q=i;
      
      return(q);
      }
    }
    else
    rect(sq_spc*i,height/2,sq_len,sq_len);
   
  }
  return 0;
}



int display3(int i , boolean tgl){
  background(255);
  textSize(15);
  
  //__________________________________________________________STRINGS
  String p1= "8:30-9:50";
String p2= "10:00-11:20";
String p3 = "11:30-12:50";
String p4 ="2:00-3:20";
String p5 ="2:30-4:50";
String p6 ="10:00-12:50";
  //__________________________________________________________STRINGS
  
  //__________________________________________________________TEXT
    fill(50,127,255);
    if(m==2 && i==1 || m==5 && i==1 || m==4 && i==1)
    text(p1,(sq_spc*4)-25,height/2);
    if(m==2 && i==2 || m==3 && i==1 || m==5 && i==2)
    text(p2,(sq_spc*4)-25,height/2);
    if(m==1 && i==1 ||m==2 && i==3 ||m==3 && i==2 ||m==5 && i==3)
    text(p3,(sq_spc*4)-25,height/2);
    if(m==3 && i==3 || m==4 && i==3 || m==5 && i==4)
    text(p4,(sq_spc*4)-25,height/2);
    if(m==1 && i==2 || m==2 && i==4)
    text(p5,(sq_spc*4)-25,height/2);
    if(m==4 && i==2)
    text(p6,(sq_spc*4)-25,height/2);
      //__________________________________________________________TEXT
      
  fill(127,127,255,127);
    if (mouseX>width/2-sq_len/2 && mouseX<width/2+sq_len/2 && mouseY>height/2-sq_len/2 && mouseY<height/2+sq_len/2)
    {rect(width/2-sq_len/2,height/2-sq_len/2,sq_len,sq_len,15);
    if (tgl==true){
      tgl=false;
      return(0);
      }
    }
     else
    rect(width/2-sq_len/2,height/2-sq_len/2,sq_len,sq_len);
    //println(w);
  return 0;
}


int days(int n){
  if(n==1)
  return 2;
  else if(n==2)
  return 4;
  else if(n==3)
  return 3;
  else if(n==4)
  return 3;
  else if(n==5)
  return 4;
  else return 0;
}



}
