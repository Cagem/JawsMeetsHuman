// @author Jona König

int difficulty = 1;
int difficultyPopupTimer = 0; // Counting frames, utilized for timing capability.
boolean displayMenu = true;
boolean firstStartup = true; // Only true after initial startup to show rules etc.
boolean displayDifficulty = false;
final String RULESET = "The rules go like this: \nNon exercitation pariatur aute qui ea. Pariatur labore commodo ipsum anim excepteur fugiat nulla ea excepteur aute aliquip. Voluptate minim ut mollit Lorem excepteur in irure voluptate elit aliqua. Ea veniam nisi fugiat ea. Nisi est sunt ipsum commodo. Sint consectetur anim enim nulla sunt tempor voluptate nulla aliquip ullamco reprehenderit enim sint tempor. Id sunt non dolor quis labore tempor fugiat minim id excepteur consequat culpa elit voluptate. Deserunt id deserunt officia in incididunt et ullamco adipisicing. Non irure eu eu aliqua in aliqua cillum magna aute adipisicing.";

void displayMenu() {
  
  if (firstStartup) drawInitialMenuScreen(); // Startup-specific content that is only displayed once
  else drawPauseScreen();
  
  if (displayDifficulty) {
    
    popup("Difficulty level: " + nf(difficulty));
    difficultyPopupTimer++;
  }

  if (difficultyPopupTimer == 120) {
    
    displayDifficulty = false;
    difficultyPopupTimer = 0;
  }
}

void setPlayOrPause() {
  
  displayMenu = !displayMenu;
  if (firstStartup) firstStartup = false; // As soon as the player got into the game, there is no need for startup-specific options like rules anymore.
  if (displayMenu) canvasImg = get(); // Takes a screenshot of the canvas which is then utilized in drawPauseScreen().
} 

void setDifficulty(int d) {
  
  difficulty = d;
  displayDifficulty = true;
} 

void popup(String content) { // Reusable and content-responsive function to show popups
  
  textSize(relativeSize("M"));
  float contentLenght = textWidth(content);
  float contentHeight = textWidth('O'); // The letter O in the utilized font-familiy is nearly as wide as high and can therefore be used for the sentence's hight.
  float xPosition = width - width * 0.03 - contentLenght/2;
  float yPosition = height * 0.05;

  rectMode(CENTER);
  fill(80);
  rect(xPosition, yPosition, contentLenght + width/55, contentHeight + height/40, 10); // background of the popup
  fill(255);
  textAlign(CENTER);
  text(content , xPosition, yPosition + height * 0.007); // content of the popup
  rectMode(CORNER); // back to the program's standard
}

void drawInitialMenuScreen() {
  
  background(backgroundImg);
  fill(0, 0, 0, 200);
  strokeWeight(0);
  rect(width * 0.2, height * 0.25, width * 0.6, height * 0.73, 10);
  textAlign(CENTER);
  fill(255);
  textSize(relativeSize("XL"));
  text("JAWS meets human", width / 2, height / 2.5);
  textSize(relativeSize("M"));
  text("Press 'p' to play (or to pause later on)", width / 2, height / 2);
  textSize(relativeSize("S"));
  text("Choose your difficulty level between 1 and 3 by pressing the respective keys.", width / 2, height / 1.8);
  textAlign(LEFT);
  text(RULESET, width * 0.25, height / 1.5, width * 0.5, height * 0.4); // This textbox is limited by x2 and y2

  drawHighscores(); // Draws the Highscoreboard
}

void drawPauseScreen() {
  
  // TODO: draw dark transparent background -> tint(100);
  background(canvasImg); // We need a captured state of the game to show what was going on. A trasparent background does not work here, since animations like displayDifficulty() won't be overlayed and stay in view forever.
  fill(255);
  textAlign(CENTER);
  textSize(relativeSize("XL"));
  text("PAUSE", width / 2, height / 2.5);
  textSize(relativeSize("M"));
  text("Press 'p' to resume", width / 2, height / 2);
}

void drawDeathScreen() {

  // TODO: No feedback after pressing l to save the score! Needs another popup.
  background(canvasImg); // To enable animations like the popup notifications.
  fill(255);
  textAlign(CENTER);
  textSize(relativeSize("XL"));
  text("The Game has ended", width / 2, height / 2.5);
  textSize(relativeSize("M"));
  text("Press 'r' to restart the game, press 'l' to save your score or esc to exit", width / 2, height / 2);
}
