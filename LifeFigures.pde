boolean life1 = true;     //Leben 1
boolean life2 = true;     //Leben 2
boolean life3 = false;    //Leben 3
int s = 3;                //Größe von den Herzen (bei Größenänderung auch pos. ändern)

void drawLifes() {
  if (life1) {
    life (40, 40);            //pos. Herz1
  } else { 
    nolife (40, 40);           //pos. Herz1
  }

  if (life2) {
    life (120, 40);            //pos. Herz1
  } else { 
    nolife (120, 40);           //pos. Herz1
  }

  if (life3) {
    life (200, 40);            //pos. Herz1
  } else { 
    nolife (200, 40);           //pos. Herz1
  }
}

void life (int X, int Y) {
  int p = s;                          //individuelle Größe vom Herz
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
  int p = s;                          //individuelle Größe vom Herz
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
