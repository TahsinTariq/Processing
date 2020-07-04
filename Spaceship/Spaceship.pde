Ship ship;

void setup() {
  size(600, 600);
  background(165);
  ship = new Ship();
}

void draw() {
  background(0);
  ship.move();
  ship.draw();
}

void keyPressed() {
  switch (keyCode) {
    case UP:
      ship.thrust();
      break;
    case LEFT:
      ship.rotateLeft();
      break;
    case RIGHT:
      ship.rotateRight();
      break;
  }
}

void keyReleased() {
  ship.noThrust();
}

public static final float INCR = .1;      // spin speed
public static final float ACC = .2;      // accleration

class Ship {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float angle = 0;

  Ship() {
    location = new PVector(0, 0);
    velocity= new PVector(0, 0);
    acceleration = new PVector(0, 0);
  }
 
  void move() {
    location.add(velocity);
    velocity.mult(1);          // drag
    velocity.add(acceleration);  // add acceleration
   
    // wraparound
    if (location.x < -width / 2) {
      location.x = width / 2;
    } else if (location.x > width / 2) {
      location.x = -width / 2;
    }
    if (location.y < -height / 2) {
      location.y = height / 2;
    } else if (location.y > height / 2) {
      location.y = -height / 2;
    }
  }

  void draw() {
    stroke(255);
    noFill();
    pushMatrix();
// centre screen
    translate(width / 2, height / 2);
// position
    translate(location.x, location.y);
// orientation
    rotate(angle + HALF_PI);
    triangle(-10, 10, 0, -20, 10, 10);
    popMatrix();
  }
 
  void thrust() {
    // force is applied at an angle
    acceleration = new PVector(ACC * cos(angle), ACC * sin(angle), 0);
  }

  void noThrust() {
    acceleration = new PVector(0, 0, 0);
  }
 
  void rotateLeft() {
    angle -= INCR;
  }

  void rotateRight() {
    angle += INCR;
  }
}
