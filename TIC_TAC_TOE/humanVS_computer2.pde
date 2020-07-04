int HvC2() {
  if (current == human) {
    if (mousePressed) {
      int j = floor(mouseX / w);
      int i = floor(mouseY / h);
      if (board[i][j] == "") {
        board[i][j] = human;
        String result = checkWinner();
        if (result != null) {
          println(" res:  ", result);
          if (result == "tie") {
            println("Tie!");
          } else {
            println(result + " wins!");
          }
          return 0;
        }
        current = ai;
      }
    }
  }
  if (current == ai) {
    computerMove2();
  }
  return 0;
}

void computerMove2() {
  int best = (int) Double.NEGATIVE_INFINITY;
  int I = 0;
  int J = 0;
  for (int i = 0; i < 3; i++) {
    for (int j = 0; j < 3; j++) {
      if (board[i][j] == "") {
        board[i][j] = ai;
        int score = minimax2(board, false);
        board[i][j] = "";
        if (score > best) {
          best = score;
          I = i;
          J = j;
        }
      }
    }
  }
  board[I][J] = ai;
  println(I, J);
  current = human;
}

int minimax2(String[][]board, boolean isMaximizing) {
  String result = checkWinner();
  println();
  print(result);
  if (result =="X")
    return 10;
  if (result =="O")
    return -10;
  if (result =="tie")
    return 0;
  if (isMaximizing) {
    int best = (int) Double.NEGATIVE_INFINITY;
    for (int i = 0; i < 3; i++) {
      for (int j = 0; j < 3; j++) {
        // Is the spot available?
        if (board[i][j] == "") {
          board[i][j] = ai;
          //print(" ", i, j);
          int score = minimax2(board, false);
          board[i][j] = "";
          best = max(score, best);
        }
      }
    }
    print("max:      ", best );
    return best;
  } else {
    int best = (int) Double.POSITIVE_INFINITY;
    for (int i = 0; i < 3; i++) {
      for (int j = 0; j < 3; j++) {
        // Is the spot available?
        if (board[i][j] == "") {
          board[i][j] = human;
          //print(" ", i, j);
          int score = minimax2(board, true);
          board[i][j] = "";
          best = min(score, best);
        }
      }
    }
    print("min:      ", best );
    return best;
  }
}
