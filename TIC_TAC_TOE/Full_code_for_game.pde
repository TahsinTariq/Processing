////________Choose Player variables__________//
//String ai = "X";
//String human = "O";
//String current = ai; //_________this player goes first
//String GameType = "Human vs AI";//Human vs AI //or// Human vs Human
////_____________________________________________________//
//float w, h;
//String[][] board = {
//  {"", "", ""}, 
//  {"", "", ""}, 
//  {"", "", ""}
//};

//String[] players = {"X", "O"}; 


//void setup() {
//  size(600, 600);
//  for (int j = 0; j < 3; j++) {
//    for (int i = 0; i < 3; i++) {
//    }
//  }
//}

//void draw() {
//  // Drawing Grid
//  background(255);
//  stroke(0);
//  strokeWeight(10);
//  w = width/3;
//  h = height/3;
//  for (float i = w; i < width; i+=w) {
//    line(i, 0, i, height);
//    line(0, i, width, i);
//  }

//  // Draw If X or O
//  for (int j = 0; j < 3; j++) {
//    for (int i = 0; i < 3; i++) {
//      float x = w * j + w / 2;
//      float y = h * i + h / 2;
//      String spot = board[i][j];
//      textSize(32);
//      if (spot == human) {
//        noFill();
//        ellipse(x, y, w / 2, w / 2);
//      } else if (spot == ai) {
//        float xr = w / 4;
//        line(x - xr, y - xr, x + xr, y + xr);
//        line(x + xr, y - xr, x - xr, y + xr);
//      }
//    }
//  }
//  //Check if There's a Winner
//  String result = checkWinner();
//  if (result != null) {
//    noLoop();
//    if (result == "tie") {
//      println("Tie!");
//    } else {
//      println(result + " wins!");
//    }
//  }
//  if (GameType =="Human vs AI")
//    HvC3();
//  else if (GameType =="Human vs Human")
//    HvH();
//}

//void keyPressed() {
//  if (key == 'r') {
//    for (int j = 0; j < 3; j++)
//      for (int i = 0; i < 3; i++) 
//        board[i][j] = "";
//  }
//}

//String checkWinner() {
//  String winner = null;
//  // HORIZONTAL
//  stroke(255, 0, 0, 100);
//  for (int i = 0; i < 3; i++) {
//    if (IsEqual(board[i][0], board[i][1], board[i][2])) {
//      winner = board[i][0];
//      line(0, w*(i+.5), width, w*(i+.5));
//    }
//  }
//  // VERTICAL
//  for (int i = 0; i < 3; i++) {
//    if (IsEqual(board[0][i], board[1][i], board[2][i])) {
//      winner = board[0][i];
//      line(h*(i+.5), 0, h*(i+.5), height);
//    }
//  }
//  // DIAGONAL
//  if (IsEqual(board[0][0], board[1][1], board[2][2])) {
//    winner = board[0][0];
//    line(0, 0, width, height);
//  }
//  if (IsEqual(board[2][0], board[1][1], board[0][2])) {
//    winner = board[1][1];
//    line(0, height, width, 0);
//  }


//  int openSpots = 0;
//  for (int i = 0; i < 3; i++) {
//    for (int j = 0; j < 3; j++) {
//      if (board[i][j] == "") {
//        openSpots++;
//      }
//    }
//  }
//  if (winner == null && openSpots == 0) {
//    return "tie";
//  } else {
//    return winner;
//  }
//}

//boolean IsEqual(String a, String b, String c) {
//  return(a == b && b ==c && a != "");
//}



//int HvC3() {
//  if (current == human) {
//    if (mousePressed) {
//      int j = floor(mouseX / w);
//      int i = floor(mouseY / h);
//      if (board[i][j] == "") {
//        board[i][j] = human;
//        String result = checkWinner();
//        if (result != null) {
//          println(" res:  ", result);
//          if (result == "tie") {
//            println("Tie!");
//          } else {
//            println(result + " wins!");
//          }
//          return 0;
//        }
//        current = ai;
//      }
//    }
//  }
//  if (current == ai) {
//    computerMove3();
//  }
//  return 0;
//}

//void computerMove3() {
//  int openSpots = 0;
//  for (int i = 0; i < 3; i++) {
//    for (int j = 0; j < 3; j++) {
//      if (board[i][j] == "") {
//        openSpots++;
//      }
//    }
//  }
//  int I = 0;
//  int J = 0;
//  if (openSpots ==8) {
//    if ( board[0][0] == human || board [0][2] == human || board [2][0] == human|| board [2][2] == human) {
//      I=1;
//      J= 1;
//    }
//    if (board[2][1] == human) {
//      I = 0;
//      J = 1;
//    }
//    if (board[1][2] == human) {
//      I = 0;
//      J = 2;
//    }
//  }
//  if (openSpots <=7) {
//    int best = (int) Double.NEGATIVE_INFINITY;
//    for (int i = 0; i < 3; i++) {
//      for (int j = 0; j < 3; j++) {
//        if (board[i][j] == "") {
//          board[i][j] = ai;
//          int score = minimax3(board, (int) Double.NEGATIVE_INFINITY, (int) Double.POSITIVE_INFINITY, false);
//          board[i][j] = "";
//          if (score > best) {
//            best = score;
//            I = i;
//            J = j;
//          }
//        }
//      }
//    }
//  } 
//  board[I][J] = ai;
//  current = human;
//}

//int minimax3(String[][]board, int alpha, int beta, boolean isMaximizing) {
//  String result = checkWinner();
//  if (result =="X")
//    return 10;
//  if (result =="O")
//    return -10;
//  if (result =="tie")
//    return 0;
//  if (isMaximizing) {
//    int best = (int) Double.NEGATIVE_INFINITY;
//    for (int i = 0; i < 3; i++) {
//      for (int j = 0; j < 3; j++) {
//        if (board[i][j] == "") {
//          board[i][j] = ai;
//          int score = minimax3(board, alpha, beta, false);
//          board[i][j] = "";
//          best = max(score, best);
//          alpha = max(alpha, score);
//          if (alpha>=beta)
//            break;
//        }
//      }
//    }
//    return best;
//  } else {
//    int best = (int) Double.POSITIVE_INFINITY;
//    for (int i = 0; i < 3; i++) {
//      for (int j = 0; j < 3; j++) {
//        if (board[i][j] == "") {
//          board[i][j] = human;
//          int score = minimax3(board, alpha, beta, true);
//          board[i][j] = "";
//          best = min(score, best);
//          beta = min(beta, score);
//          if (alpha>=beta)
//            break;
//        }
//      }
//    }
//    return best;
//  }
//}



//void HvH() {
//  if (current == human) {
//    if (mousePressed) {
//      int j = floor(mouseX / w);
//      int i = floor(mouseY / h);
//      if (board[i][j] == "") {
//        board[i][j] = players[1];
//        current = ai;
//      }
//    }
//  }
//  if (current == ai) {
//    if (mousePressed) {
//      int j = floor(mouseX / w);
//      int i = floor(mouseY / h);
//      if (board[i][j] == "") {
//        board[i][j] = players[0];
//        current = human;
//      }
//    }
//  }
//}
