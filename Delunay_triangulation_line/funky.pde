class Funky {
  float[] a;
  float[] angle;
  float[] colors;
  float angle2 =0.2;
  PVector position;
  int child;
  float parentR;
  Funky(PVector position, int child, float parentR) {
    this.position = position;
    this.child = child;
    this.parentR = parentR;
    a = new float[child];
    angle = new float[child];
    colors = new float[child];
    colors[0] = 0;
    for (int i = 0; i < child; i ++) {
      a[i] = random(-500, 500);
      angle[i] = random(-0.5, 0.5);
      //println(a[i]);
      if(i>0){
      //colors[i] = colors[i-1] +360/child;
      colors[i] = random(360);
      }
    }
  }

  void show() {
    version1();
  }

  void version1() {
    colorMode(HSB, 360, 100, 100);
    PVector temp3 = new PVector(position.x, position.y);
    float parentR2 = parentR;
    beginShape();
    for (int i = 0; i < this.child; i++) {
      PVector temp = new PVector(sin(radians(-a[i]))*parentR2, cos(radians(-a[i]))*parentR2);
      PVector temp2 = new PVector(temp3.x, temp3.y);
      temp3.add(temp);
      //color c = color((i*18)-map(temp3.mag(),200,700 ,200,100), 50, 70, 40);
      //c = color(0, 10);
      color c = color(colors[i], 70, 100, 30);
      stroke(c);
      fill(c);
     drawLines(i, temp2, temp3);
     //drawCurve(i, temp2, temp3);
      a[i] += angle[i];
      parentR2 *= 0.90;
      //update();
    }    
    endShape();

    //position.x = temp3.x;
    //position.y = temp3.y;
  }
  void drawCurve(int i, PVector temp2, PVector temp3){
    noFill();
    
   //if (i > this.child-7)
      //if (i > 1)
      //if (i < this.child)

      {
        curveVertex(temp2.x, temp2.y);
    }
  }
  void drawLines(int i, PVector temp2, PVector temp3){
   //if (i > this.child-7)
      if (i > 1)
      //if (i < this.child)

      {
        line(temp2.x, temp2.y, temp3.x, temp3.y);
      //if (i > this.child-2)
      //if (i%5 == 0 && i < this.child-3)
        ellipse(temp3.x, temp3.y, 2, 2);
      //points.add(new PVector(temp3.x, temp3.y));
    }
  }
}
