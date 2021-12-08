boolean[] lifes = new boolean[5];
boolean hasReducedLife = false;
int reducedHeartIndex;
int size = 3;                //Größe von den Herzen (bei Größenänderung auch pos. ändern)

void initLifes() {
  for (int i = 0; i < lifes.length; i ++) {
    lifes[i] = true;
  }
  reducedHeartIndex = lifes.length - 1;
}

void setNextHeartIndex() {
  if (reducedHeartIndex > 0) reducedHeartIndex -= 1;
}

void reduceLife() {
  if (hasReducedLife == false) {
    lifes[reducedHeartIndex] = false;
    hasReducedLife = true;
  }
}

void drawLifes() {
  int xHeartposition = 40; 

  for (int i = 0; i <  lifes.length; i ++) {	
    if (lifes[i] == true) {
      life(xHeartposition, 40);
    } else {
      nolife(xHeartposition, 40);
    }

    xHeartposition = xHeartposition + 80;
  }
}

void life(int X, int Y) {
  int p = size;   //individuelle Größe vom Herz
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
}

void nolife(int X, int Y) {
  int p = size;       //individuelle Größe vom Herz
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
}
