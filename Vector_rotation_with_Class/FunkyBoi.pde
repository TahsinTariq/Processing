//class Funky {
//  PVector position;
//  int child;
//  float parentR;
//  float a = 0;
//  float angle = random(3, 5);
//  Funky(PVector position, int child, float parentR) {
//    this.position = position;
//    this.child = child;
//    this.parentR = parentR;
//  }

//  void show() {
//    version3();
//  }


//  void version3() {
//    PVector temp = new PVector(sin(radians(-a))*parentR, cos(radians(-a))*parentR);
//    PVector temp2 = new PVector(position.x, position.y);
//    position.rotate(a);
//    stroke(18, 100, 100, 90);
//    line(temp2.x, temp2.y, position.x, position.y);
//    update();
//  }
//  void update() {
//    a += angle;
//    parentR *= 0.75;
//  }

//  void version1() {
//    colorMode(HSB, 360, 100, 100);
//    for (int i = 0; i < this.child; i++) {
//      PVector temp = new PVector(sin(radians(-a))*parentR, cos(radians(-a))*parentR);
//      PVector temp2 = new PVector(position.x, position.y);
//      position.add(temp);
//      stroke(i* 18, 100, 100, 90);
//      line(temp2.x, temp2.y, position.x, position.y);
//      //update();
//    }
//  }
//  //void update2() {
//  //  temp.upLine();
//  //}
//  void version2() {
//    colorMode(HSB, 360, 100, 100);
//    for (int i = 0; i < this.child; i++) {
//      liney temp = new liney(new PVector(sin(radians(-a))*parentR, cos(radians(-a))*parentR), random(10));
//      PVector temp2 = new PVector(position.x, position.y);
//      position.add(temp.origin);
//      stroke(i* 18, 100, 100, 90);
//      line(temp2.x, temp2.y, position.x, position.y);
//      textSize(20);
//      text(i, position.x, position.y );
//      temp.upLine();
//      //update2();
//    }
//  }
//}
