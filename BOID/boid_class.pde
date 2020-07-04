class boid {
  float x, y;
  float r=20, a;
  float maxspeed = 10;

  boid(float x, float y) {
    this.x = x;
    this.y = y;
  }
  void show() { 
        move();

    pushMatrix();  
    tri(x, y);
    rotate(PI/2);
    popMatrix();    
                
    borders();
        



  }
  void tri(float x, float y) {
    pushMatrix();
    translate(x, y);
    
    rotate(PI/2);
    move();
    beginShape(TRIANGLES);
    vertex(-20, 0);
    vertex(10, 10);
    vertex(10, -10);
    endShape();
    popMatrix();
  }

  void move() {
    x+=maxspeed;
  }

  void borders() {
    if (x < -30) x = width+30;
    if (y < -30) y = height+30;
    if (x > width+30) x = -30;
    if (y > height+30) y = -30;
  }
}
