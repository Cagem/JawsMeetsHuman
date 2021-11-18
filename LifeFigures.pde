int lifes = 3; // Anzahl der Leben
int heartSize = 3;  //Größe von den Herzen (bei Größenänderung auch pos. ändern)

void drawLifes() {
  if (lifes == 1) {
    life (40, 40);
    nolife (120, 40);
    nolife (200, 40);
  } else if (lifes == 2) {
    life (40, 40);
    life (120, 40);  
    nolife (200, 40);
  } else if (lifes == 3) {
    life (40, 40);
    life (120, 40); 
    life (200, 40);
  }
}

void life (int X, int Y) {
  int p = heartSize;                          //individuelle Größe vom Herz
  rectMode (CENTER);
  noStroke();

  fill (255, 0, 0);
  rect (X, Y, p*6, p*4);
  rect (X + p*3, Y - p*2, p*4, p*4);
  rect (X - p*3, Y - p*2, p*4, p*4);
  rect (X, Y + p*3, p*2, p*2);

  fill (0);
  rect (X, Y - p*3, p*2, p*2);
  rect (X + p*3, Y - p*5, p*4, p*2);
  rect (X - p*3, Y - p*5, p*4, p*2);
  rect (X + p*6, Y - p*2, p*2, p*4);
  rect (X - p*6, Y - p*2, p*2, p*4);
  rect (X + p*4, Y + p, p*2, p*2);
  rect (X - p*4, Y + p, p*2, p*2);
  rect (X + p*2, Y + p*3, p*2, p*2);
  rect (X - p*2, Y + p*3, p*2, p*2);
  rect (X, Y + p*5, p*2, p*2);
}

void nolife (int X, int Y) {
  int p = heartSize;                          //individuelle Größe vom Herz
  rectMode (CENTER);
  noStroke();

  fill (0);
  rect (X, Y, p*6, p*4);
  rect (X + p*3, Y - p*2, p*4, p*4);
  rect (X - p*3, Y - p*2, p*4, p*4);
  rect (X, Y + p*3, p*2, p*2);

  fill (0);
  rect (X, Y - p*3, p*2, p*2);
  rect (X + p*3, Y - p*5, p*4, p*2);
  rect (X - p*3, Y - p*5, p*4, p*2);
  rect (X + p*6, Y - p*2, p*2, p*4);
  rect (X - p*6, Y - p*2, p*2, p*4);
  rect (X + p*4, Y + p, p*2, p*2);
  rect (X - p*4, Y + p, p*2, p*2);
  rect (X + p*2, Y + p*3, p*2, p*2);
  rect (X - p*2, Y + p*3, p*2, p*2);
  rect (X, Y + p*5, p*2, p*2);
}
