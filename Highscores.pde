// @author Luca Virnich

int newHighscore;
int[] highscores = new int [5];  // Array to save highscores as integers

void setNewHighscore() {
  newHighscore = timerHours*60*60 + timerMinutes*60 + timerSecondsINT;
}

void saveHighscore() {
  String[] highscoresString = new String[5];

  for (int i = 0; i < highscores.length; i++) {
    if (newHighscore > highscores[highscores.length-1]) {
      highscores[highscores.length-1] = newHighscore;
      break;
    } else if (highscores[i] < newHighscore && highscores[i+1] > newHighscore) {
      highscores[i] = newHighscore;
      break;
    }
  }

  for (int i = 0; i < highscoresString.length; i++) {
    highscoresString[i]=nf(highscores[i]);
  }
  saveStrings("data/highscores.txt", highscoresString);
}

void loadHighscore() {
  String[] highscoresString = loadStrings("data/highscores.txt");

  for (int i = 0; i < highscoresString.length; i++) {
    highscores[i] = int(highscoresString[i]);
  }
}


void drawHighscores() {
  fill(0, 0, 0, 200);
  rect(width*0.85, height*0.25, width*0.1, height*0.3, 10);
  fill(255);
  textSize(relativeSize("M"));
  textAlign(LEFT);
  text("How fast can you escape?", width * 0.87, height * 0.27, width * 0.06, height * 0.4); 
  text( "1:  " + nf(highscores[0]), width * 0.87, height * 0.4);   
  text( "2:  " + nf(highscores[1]), width * 0.87, height * 0.43);
  text( "3:  " + nf(highscores[2]), width * 0.87, height * 0.46);
  text( "4:  " + nf(highscores[3]), width * 0.87, height * 0.49);
  text( "5:  " + nf(highscores[4]), width * 0.87, height * 0.52);
}
