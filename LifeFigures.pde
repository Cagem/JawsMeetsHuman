// @author Luca Virnich

boolean[] lifes = new boolean[3];
boolean deathScreen = false;

int size = 3; // sets the heart-size, is used to reposition them accordingly if changed
int currentLifes = lifes.length;

void initLifes() {
  for (int i = 0; i < lifes.length; i ++) {
    lifes[i] = true;
  }
}

void reduceLife() {
  if (currentLifes <=  0) {
    deathScreen = true;
    println("Das Spiel ging "+ timerHours+ " : " +timerMinutes+ " : " +timerSecondsINT+ " Minuten.");
  } else {
    currentLifes --;
    lifes[currentLifes] = false;
  }
}

void drawLifes() {
  int xHeartposition = 40; 

  for (int i = 0; i <  lifes.length; i ++) {	
    if (lifes[i] ==  true) {
      life(xHeartposition, 40);
    } else {
      nolife(xHeartposition, 40);
    }

    xHeartposition = xHeartposition + 80;
  }
}

void life(int X, int Y) {
  int p = size; // you can change the size of red hearts without changing black hearts
  rectMode(CENTER);
  noStroke();

  fill(255, 0, 0);
  rect(X, Y, p * 6, p * 4);
  rect(X + p * 3, Y - p * 2, p * 4, p * 4);
  rect(X - p * 3, Y - p * 2, p * 4, p * 4);
  rect(X, Y + p * 3, p * 2, p * 2);

  fill(0);
  rect(X, Y - p * 3, p * 2, p * 2);
  rect(X + p * 3, Y - p * 5, p * 4, p * 2);
  rect(X - p * 3, Y - p * 5, p * 4, p * 2);
  rect(X + p * 6, Y - p * 2, p * 2, p * 4);
  rect(X - p * 6, Y - p * 2, p * 2, p * 4);
  rect(X + p * 4, Y + p, p * 2, p * 2);
  rect(X - p * 4, Y + p, p * 2, p * 2);
  rect(X + p * 2, Y + p * 3, p * 2, p * 2);
  rect(X - p * 2, Y + p * 3, p * 2, p * 2);
  rect(X, Y + p * 5, p * 2, p * 2);
  rectMode(CORNER);
}

void nolife(int X, int Y) {
  int p = size; // you can change the size of black hearts without changing red hearts
  rectMode(CENTER);
  noStroke();

  fill(0);
  rect(X, Y, p * 6, p * 4);
  rect(X + p * 3, Y - p * 2, p * 4, p * 4);
  rect(X - p * 3, Y - p * 2, p * 4, p * 4);
  rect(X, Y + p * 3, p * 2, p * 2);

  fill(0);
  rect(X, Y - p * 3, p * 2, p * 2);
  rect(X + p * 3, Y - p * 5, p * 4, p * 2);
  rect(X - p * 3, Y - p * 5, p * 4, p * 2);
  rect(X + p * 6, Y - p * 2, p * 2, p * 4);
  rect(X - p * 6, Y - p * 2, p * 2, p * 4);
  rect(X + p * 4, Y + p, p * 2, p * 2);
  rect(X - p * 4, Y + p, p * 2, p * 2);
  rect(X + p * 2, Y + p * 3, p * 2, p * 2);
  rect(X - p * 2, Y + p * 3, p * 2, p * 2);
  rect(X, Y + p * 5, p * 2, p * 2);
  rectMode(CORNER);
}
