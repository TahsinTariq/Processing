class Clock {

  PVector position;
  float angle1=0;
  float angle2=0;
  float r = height/n;
  float center_x;
  float center_y;
  float line1_x;
  float line1_y;
  float line2_x;
  float line2_y;
  float weight_x;
  float weight_y;

  Clock(float X, float Y) {
    center_x = X;
    center_y = Y;
    weight_x = X;
    weight_y = Y;
  }

  void show() {
    //Circle();
    Line1();
    Line2();
  }
  void update() {
    update1();
    update2();
  }

  void update1() {
    angle1 = frameCount * PI/600 * weight_x/200;
    line1_x = .5 * r * cos(angle1);
    line1_y = .5 * r * sin(angle1);
  }
  void update2() {
    angle2 = -1 * frameCount * PI/300 * weight_y/200;
    line2_x = .5 * r * cos(angle2);
    line2_y = .5 * r * sin(angle2);
  }

  void Circle() {
    noFill();
    stroke(210, 200, 30);
    ellipse(center_x, center_y, r, r);
  }

  void Line1() {
    stroke(140, 95, 50);
    pushMatrix();
    translate(center_x, center_y);
    line(0, 0, line1_x, line1_y);
    popMatrix();
  }

  void Line2() {
    stroke(40, 230, 70);
    pushMatrix();
    translate(center_x, center_y);
    line(0, 0, line2_x, line2_y);
    popMatrix();
  }
}
