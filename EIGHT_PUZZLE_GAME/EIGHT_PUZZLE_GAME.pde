<<<<<<< HEAD
float w, h;
String[][] board = {
  {"1", "2", "3"}, 
  {"4", "5", "6"}, 
  {"7", "8", ""}
};

void setup() {
  size(600, 600);
}

void draw() {
  // Drawing Grid
  background(255);
  stroke(0);
  strokeWeight(10);
  w = width/3;
  h = height/3;
  for (float i = w; i < width; i+=w) {
    line(i, 0, i, height);
    line(0, i, width, i);
  }
  // Draw Digits
  for (int j = 0; j < 3; j++) {
    for (int i = 0; i < 3; i++) {
      float x = w * j + w / 2;
      float y = h * i + h / 2;
      String spot = board[i][j];
      if (spot == "") {
        rectMode(CENTER);
        rect(x, y, w, h);
      }
      textSize(100);
      fill(255, 150, 190);
      textAlign(CENTER);
      text(spot, x, y);
    }
  }
}

void keyPressed() {
  int i = 1; 
  int j = 0; 
  for ( int I = 0; I < 3; I++) {
    for ( int J = 0; J < 3; J++) { 
      if (board[I][J] == "") {
        i = I;
        j = J;
      }
    }
  }
  println(key, i, j);
  if (key =='w' && i-1 >=0) {
    swap(i, j, i-1, j);
  }
  if (key =='s' && i+1<3) {
    swap(i, j, i+1, j);
  }
  if (key =='a' && j-1 >=0) {
    swap(i, j, i, j-1);
  }
  if (key =='d' && j +1 < 3) {
    swap(i, j, i, j+1);
  }
}

void swap(int a, int b, int c, int d) {
  String t = board[a][b];
  board[a][b]= board[c][d];
  board[c][d] = t;
}
=======
float w, h;
String[][] board = {
  {"1", "2", "3"}, 
  {"4", "5", "6"}, 
  {"7", "8", ""}
};

void setup() {
  size(600, 600);
}

void draw() {
  // Drawing Grid
  background(255);
  stroke(0);
  strokeWeight(10);
  w = width/3;
  h = height/3;
  for (float i = w; i < width; i+=w) {
    line(i, 0, i, height);
    line(0, i, width, i);
  }
  // Draw Digits
  for (int j = 0; j < 3; j++) {
    for (int i = 0; i < 3; i++) {
      float x = w * j + w / 2;
      float y = h * i + h / 2;
      String spot = board[i][j];
      if (spot == "") {
        rectMode(CENTER);
        rect(x, y, w, h);
      }
      textSize(100);
      fill(255, 150, 190);
      textAlign(CENTER);
      text(spot, x, y);
    }
  }
}

void keyPressed() {
  int i = 1; 
  int j = 0; 
  for ( int I = 0; I < 3; I++) {
    for ( int J = 0; J < 3; J++) { 
      if (board[I][J] == "") {
        i = I;
        j = J;
      }
    }
  }
  println(key, i, j);
  if (key =='w' && i-1 >=0) {
    swap(i, j, i-1, j);
  }
  if (key =='s' && i+1<3) {
    swap(i, j, i+1, j);
  }
  if (key =='a' && j-1 >=0) {
    swap(i, j, i, j-1);
  }
  if (key =='d' && j +1 < 3) {
    swap(i, j, i, j+1);
  }
}

void swap(int a, int b, int c, int d) {
  String t = board[a][b];
  board[a][b]= board[c][d];
  board[c][d] = t;
}
>>>>>>> 9cbcf2327b76191d08db4d6d149bfaef56bd1e47
