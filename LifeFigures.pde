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
  rectMode(CENTER);
  noStroke();

  fill(255, 0, 0);
  rect(X, Y, relativeSize("XXS") * 6, relativeSize("XXS")  * 4);
  rect(X + relativeSize("XXS")  * 3, Y - relativeSize("XXS")  * 2, relativeSize("XXS")  * 4, relativeSize("XXS")  * 4);
  rect(X - relativeSize("XXS")  * 3, Y - relativeSize("XXS")  * 2, relativeSize("XXS")  * 4, relativeSize("XXS")  * 4);
  rect(X, Y + relativeSize("XXS")  * 3, relativeSize("XXS")  * 2, relativeSize("XXS")  * 2);

  fill(0);
  rect(X, Y - relativeSize("XXS")  * 3, relativeSize("XXS")  * 2, relativeSize("XXS")  * 2);
  rect(X + relativeSize("XXS")  * 3, Y - relativeSize("XXS")  * 5, relativeSize("XXS")  * 4, relativeSize("XXS")  * 2);
  rect(X - relativeSize("XXS")  * 3, Y - relativeSize("XXS")  * 5, relativeSize("XXS")  * 4, relativeSize("XXS")  * 2);
  rect(X + relativeSize("XXS")  * 6, Y - relativeSize("XXS")  * 2, relativeSize("XXS") * 2, relativeSize("XXS")  * 4);
  rect(X - relativeSize("XXS")  * 6, Y - relativeSize("XXS")  * 2, relativeSize("XXS")  * 2, relativeSize("XXS")  * 4);
  rect(X + relativeSize("XXS")  * 4, Y + relativeSize("XXS") , relativeSize("XXS")  * 2, relativeSize("XXS")  * 2);
  rect(X - relativeSize("XXS")  * 4, Y + relativeSize("XXS") , relativeSize("XXS")  * 2, relativeSize("XXS")  * 2);
  rect(X + relativeSize("XXS")  * 2, Y + relativeSize("XXS")  * 3, relativeSize("XXS")  * 2, relativeSize("XXS")  * 2);
  rect(X - relativeSize("XXS")  * 2, Y + relativeSize("XXS")  * 3, relativeSize("XXS")  * 2, relativeSize("XXS")  * 2);
  rect(X, Y + relativeSize("XXS")  * 5, relativeSize("XXS")  * 2, relativeSize("XXS")  * 2);
  rectMode(CORNER);
}

void nolife(int X, int Y) {
  rectMode(CENTER);
  noStroke();

  fill(0);
  rect(X, Y, relativeSize("XXS") * 6, relativeSize("XXS") * 4);
  rect(X + relativeSize("XXS") * 3, Y - relativeSize("XXS") * 2, relativeSize("XXS") * 4, relativeSize("XXS") * 4);
  rect(X - relativeSize("XXS") * 3, Y - relativeSize("XXS") * 2, relativeSize("XXS") * 4, relativeSize("XXS") * 4);
  rect(X, Y + relativeSize("XXS") * 3, relativeSize("XXS") * 2, relativeSize("XXS") * 2);

  fill(0);
  rect(X, Y - relativeSize("XXS") * 3, relativeSize("XXS") * 2, relativeSize("XXS") * 2);
  rect(X + relativeSize("XXS") * 3, Y - relativeSize("XXS") * 5, relativeSize("XXS") * 4, relativeSize("XXS") * 2);
  rect(X - relativeSize("XXS") * 3, Y - relativeSize("XXS") * 5, relativeSize("XXS") * 4, relativeSize("XXS") * 2);
  rect(X + relativeSize("XXS") * 6, Y - relativeSize("XXS") * 2, relativeSize("XXS") * 2, relativeSize("XXS") * 4);
  rect(X - relativeSize("XXS") * 6, Y - relativeSize("XXS") * 2, relativeSize("XXS") * 2, relativeSize("XXS") * 4);
  rect(X + relativeSize("XXS") * 4, Y + relativeSize("XXS"), relativeSize("XXS") * 2, relativeSize("XXS") * 2);
  rect(X - relativeSize("XXS") * 4, Y + relativeSize("XXS"), relativeSize("XXS") * 2, relativeSize("XXS") * 2);
  rect(X + relativeSize("XXS") * 2, Y + relativeSize("XXS") * 3, relativeSize("XXS") * 2, relativeSize("XXS") * 2);
  rect(X - relativeSize("XXS") * 2, Y + relativeSize("XXS") * 3, relativeSize("XXS") * 2, relativeSize("XXS") * 2);
  rect(X, Y + relativeSize("XXS") * 5, relativeSize("XXS") * 2, relativeSize("XXS") * 2);
  rectMode(CORNER);
}
