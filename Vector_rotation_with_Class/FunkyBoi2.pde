class Funky {
  float[] a;
  float[] angle;
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
    for (int i = 0; i < child; i ++) {
      a[i] = random(-5, 5);
      angle[i] = random(-0.5, 0.5);
      println(a[i]);
    }
  }

  void show() {
    version1();
  }

  void version1() {
    colorMode(HSB, 360, 100, 100);
    PVector temp3 = new PVector(position.x, position.y);
    float parentR2 = parentR;
    for (int i = 0; i < this.child; i++) {
      PVector temp = new PVector(sin(radians(-a[i]))*parentR2, cos(radians(-a[i]))*parentR2);
      PVector temp2 = new PVector(temp3.x, temp3.y);
      temp3.add(temp);
      //println(temp3.mag());
      //color c = color((i*18)-map(temp3.mag(),200,700 ,200,100), 70, 100, 90);
      color c = color(angle[i]*2*360, 70, 100);
      stroke(c);
      fill(c);
      //if (i > this.child-2)
      if (i > 5)
      //if (i%5 == 0 && i < this.child-3)
        {
          line(temp2.x, temp2.y, temp3.x, temp3.y);
        ellipse(temp3.x, temp3.y, 2, 2);
        }


      a[i] += angle[i];
      parentR2 *= 0.75;
      //update();
    }
    //position.x = temp3.x;
    //position.y = temp3.y;
  }

  //void update() {      

  //}
}
