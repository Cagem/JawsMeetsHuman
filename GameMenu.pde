// @author Jona König

int difficulty = 1; 
int popupTime = 120; // Default option
int popupTimer = 0; // Counting frames, utilized for timing capability, see setPopup().
boolean displayMenu = true;
boolean firstStartup = true; // Only true after initial startup to show rules etc.
String popupMessage = ""; // globally relevant! Write to this string an a popup will appear.
final String RULESET = "The rules go like this: \nTwo players are required. Player 1's goal is to move the human safely along the path. If the human reaches the end of the path, he has won. Player 2 tries to stop him, he plays the shark. The human can be controlled with the W, A, S and D keys and should not leave the path. The shark is moved by the arrow keys, its line of sight is controlled by the mouse. If the shark approaches the path, it can jump over the path by pressing return. If its mouth is directed towards the human, it can swallow him. \n \nThe difficulty of the game can be increased via keys 2 and 3, default is 1. \nThe background music can be muted with M.";

void displayMenu() {
  
  if (firstStartup) drawInitialMenuScreen(); // Startup-specific content that is only displayed once
  else drawMenuScreen("PAUSE", "Press 'p' to resume");
}

void setPlayOrPause() {
  
  displayMenu = !displayMenu;
  if (firstStartup) firstStartup = false; // As soon as the player got into the game, there is no need for startup-specific options like rules anymore.
  if (displayMenu) canvasImg = get(); // Takes a screenshot of the canvas which is then utilized in drawMenuScreen().
} 

void setDifficulty(int d) {
  
  difficulty = d;
  setPopup("Difficulty level: " + nf(difficulty), 120);
} 

void setPopup(String content, int time){
    popupMessage = content;
    popupTime = time;
}

void setPopup(String content){ // function overloading, time is optional
    popupMessage = content;
}

void popup(String content, int time){

  if (popupTimer < time) {
    
    displayPopup(content);
    popupTimer++;
  }

  if (popupTimer == time) {
    
    popupMessage = "";
    popupTimer = 0;
    popupTime = 120;
  }
}

void displayPopup(String content) { // Reusable and content-responsive function to show popups
  
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
  text(RULESET, width * 0.25, height / 1.5, width * 0.5, height * 0.4); // This textbox is limited by x2 and y2.
  drawHighscores(); // draws the highscore board
}

void drawMenuScreen(String title, String message) {

  background(canvasImg); // We need a captured state of the game to show what was going on. A trasparent background does not work here, since animations like displayDifficulty() won't be overlayed and stay in view forever.
  fill(0, 100);
  rect(0, 0, width, height); // Do a darkened overlay
  fill(255);
  textAlign(CENTER);
  textSize(relativeSize("XL"));
  text(title, width / 2, height / 2.5);
  textSize(relativeSize("M"));
  text(message, width / 2, height / 2);
}