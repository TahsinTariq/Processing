<<<<<<< HEAD
float w, h;
String[][] board = {
  {"", "", ""}, 
  {"", "", ""}, 
  {"", "", ""}
};

String[] players = {"X", "O"}; 
String ai = "X";
String human = "O";
String current = human; 
ArrayList<PVector> available = new ArrayList<PVector>();

void setup() {
  size(600, 600);
  for (int j = 0; j < 3; j++) {
    for (int i = 0; i < 3; i++) {
      available.add(new PVector(i, j));
    }
  }
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

  // Draw If X or O
  for (int j = 0; j < 3; j++) {
    for (int i = 0; i < 3; i++) {
      float x = w * j + w / 2;
      float y = h * i + h / 2;
      String spot = board[i][j];
      textSize(32);
      if (spot == human) {
        noFill();
        ellipse(x, y, w / 2, w / 2);
      } else if (spot == ai) {
        float xr = w / 4;
        line(x - xr, y - xr, x + xr, y + xr);
        line(x + xr, y - xr, x - xr, y + xr);
      }
    }
  }
  //Check if There's a Winner
  String result = checkWinner();
  if (result != null) {
    println(" res:  ", result);
    noLoop();
    if (result == "tie") {
      println("Tie!");
    } else {
      println(result + " wins!");
    }
  }
  HvC3();
  //HvH();
  //nextTurn();
  //nextTurn_HvsH();
}

//void mousePressed() {
//  nextTurn();
//}
void keyPressed(){
  if (key == 'r'){
 for (int j = 0; j < 3; j++)
    for (int i = 0; i < 3; i++) 
    board[i][j] = "";
    }
}

String checkWinner() {
  String winner = null;
  // HORIZONTAL
  stroke(255, 0, 0, 100);
  for (int i = 0; i < 3; i++) {
    if (IsEqual(board[i][0], board[i][1], board[i][2])) {
      winner = board[i][0];
      line(0, w*(i+.5), width, w*(i+.5));
    }
  }
  // VERTICAL
  for (int i = 0; i < 3; i++) {
    if (IsEqual(board[0][i], board[1][i], board[2][i])) {
      winner = board[0][i];
      line(h*(i+.5), 0, h*(i+.5), height);
    }
  }
  // DIAGONAL
  if (IsEqual(board[0][0], board[1][1], board[2][2])) {
    winner = board[0][0];
    line(0, 0, width, height);
  }
  if (IsEqual(board[2][0], board[1][1], board[0][2])) {
    winner = board[1][1];
    line(0, height, width, 0);
  }


  int openSpots = 0;
  for (int i = 0; i < 3; i++) {
    for (int j = 0; j < 3; j++) {
      if (board[i][j] == "") {
        openSpots++;
      }
    }
  }
  //if (winner == null && available.size() == 0) {
  if (winner == null && openSpots == 0) {
    return "tie";
  } else {
    return winner;
  }
}

boolean IsEqual(String a, String b, String c) {
  return(a == b && b ==c && a != "");
}


void nextTurn() {
  int index = floor(random(available.size()));

  PVector spot = available.get(index);
  available.remove(index);
  int i = (int) spot.x;
  int j = (int) spot.y;
  board[i][j] = current;
  println(i, j, current);
  if (current == human) 
    current = ai;
  else current = human;
}

void nextTurn_HvsH() {
  int index =3*(int)(mouseX/w)+  (int)(mouseY/h);

  PVector spot = available.get(index);
  int i = (int) spot.x;
  int j = (int) spot.y;
  board[i][j] = current;
  println(i, j, current);
  if (current == human) 
    current = ai;
  else current = human;
}
=======
float w, h;
String[][] board = {
  {"", "", ""}, 
  {"", "", ""}, 
  {"", "", ""}
};

String[] players = {"X", "O"}; 
String ai = "X";
String human = "O";
String current = human; 
ArrayList<PVector> available = new ArrayList<PVector>();

void setup() {
  size(600, 600);
  for (int j = 0; j < 3; j++) {
    for (int i = 0; i < 3; i++) {
      available.add(new PVector(i, j));
    }
  }
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

  // Draw If X or O
  for (int j = 0; j < 3; j++) {
    for (int i = 0; i < 3; i++) {
      float x = w * j + w / 2;
      float y = h * i + h / 2;
      String spot = board[i][j];
      textSize(32);
      if (spot == human) {
        noFill();
        ellipse(x, y, w / 2, w / 2);
      } else if (spot == ai) {
        float xr = w / 4;
        line(x - xr, y - xr, x + xr, y + xr);
        line(x + xr, y - xr, x - xr, y + xr);
      }
    }
  }
  //Check if There's a Winner
  String result = checkWinner();
  if (result != null) {
    println(" res:  ", result);
    noLoop();
    if (result == "tie") {
      println("Tie!");
    } else {
      println(result + " wins!");
    }
  }
  HvC3();
  //HvH();
  //nextTurn();
  //nextTurn_HvsH();
}

//void mousePressed() {
//  nextTurn();
//}
void keyPressed(){
  if (key == 'r'){
 for (int j = 0; j < 3; j++)
    for (int i = 0; i < 3; i++) 
    board[i][j] = "";
    }
}

String checkWinner() {
  String winner = null;
  // HORIZONTAL
  stroke(255, 0, 0, 100);
  for (int i = 0; i < 3; i++) {
    if (IsEqual(board[i][0], board[i][1], board[i][2])) {
      winner = board[i][0];
      line(0, w*(i+.5), width, w*(i+.5));
    }
  }
  // VERTICAL
  for (int i = 0; i < 3; i++) {
    if (IsEqual(board[0][i], board[1][i], board[2][i])) {
      winner = board[0][i];
      line(h*(i+.5), 0, h*(i+.5), height);
    }
  }
  // DIAGONAL
  if (IsEqual(board[0][0], board[1][1], board[2][2])) {
    winner = board[0][0];
    line(0, 0, width, height);
  }
  if (IsEqual(board[2][0], board[1][1], board[0][2])) {
    winner = board[1][1];
    line(0, height, width, 0);
  }


  int openSpots = 0;
  for (int i = 0; i < 3; i++) {
    for (int j = 0; j < 3; j++) {
      if (board[i][j] == "") {
        openSpots++;
      }
    }
  }
  //if (winner == null && available.size() == 0) {
  if (winner == null && openSpots == 0) {
    return "tie";
  } else {
    return winner;
  }
}

boolean IsEqual(String a, String b, String c) {
  return(a == b && b ==c && a != "");
}


void nextTurn() {
  int index = floor(random(available.size()));

  PVector spot = available.get(index);
  available.remove(index);
  int i = (int) spot.x;
  int j = (int) spot.y;
  board[i][j] = current;
  println(i, j, current);
  if (current == human) 
    current = ai;
  else current = human;
}

void nextTurn_HvsH() {
  int index =3*(int)(mouseX/w)+  (int)(mouseY/h);

  PVector spot = available.get(index);
  int i = (int) spot.x;
  int j = (int) spot.y;
  board[i][j] = current;
  println(i, j, current);
  if (current == human) 
    current = ai;
  else current = human;
}
>>>>>>> 9cbcf2327b76191d08db4d6d149bfaef56bd1e47
