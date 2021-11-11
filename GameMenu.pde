String ruleset = "The rules go like this: \nNon exercitation pariatur aute qui ea. Pariatur labore commodo ipsum anim excepteur fugiat nulla ea excepteur aute aliquip. Voluptate minim ut mollit Lorem excepteur in irure voluptate elit aliqua. Ea veniam nisi fugiat ea. Nisi est sunt ipsum commodo. Sint consectetur anim enim nulla sunt tempor voluptate nulla aliquip ullamco reprehenderit enim sint tempor. Id sunt non dolor quis labore tempor fugiat minim id excepteur consequat culpa elit voluptate. Deserunt id deserunt officia in incididunt et ullamco adipisicing. Non irure eu eu aliqua in aliqua cillum magna aute adipisicing.";
PImage bgImage;
int difficulty = 1;

int titleSize; // Global relative text size for titles
int paragraphSize; // Global relative text size for normal text
int descriptionSize; // Global relative text size for less important text

boolean shouldDisplayMenu = true;
boolean isShowingPause = false; // Only false after initial startup to show rules etc.
boolean shouldDisplayDifficulty = false;

void initMenuScreen() {
	bgImage = loadImage("shark.jpg");
	bgImage.resize(width, height); // The background image has to be the same size as the program
	titleSize = width/20;
	paragraphSize = width/80;
	descriptionSize = width/90;
}

void displayMenu() {
	if (!isShowingPause) { // Startup-specific content that is only displayed once
		drawInitialMenuScreen();
	} else {
		drawPauseScreen();
	}
	drawDifficultySetting();

	if (shouldDisplayDifficulty) {
		displayCurrentDifficulty();
		countFrames++;
	}
	if (countFrames == 120) {
		shouldDisplayDifficulty = false;
		countFrames = 0;
	} // TODO: does not disappear when isShowingPause
}

void setPlayOrPause() {
    shouldDisplayMenu = !shouldDisplayMenu;
    if (!isShowingPause) isShowingPause = true; // As soon as the player got into the game, there is no need for startup-specific options like rules anymore.
} 

void setDifficulty(int d) {
    difficulty = d;
	shouldDisplayDifficulty = true;
} 

void displayCurrentDifficulty() {
  float xPosition = width*0.9;
  float yPosition = height*0.05;
  rectMode(CENTER);
  fill(80);
  rect(xPosition, yPosition, width*0.15, height*0.05, 10);
  fill(255);
  textSize(paragraphSize);
  text("Difficulty level: " + difficulty, xPosition, height*0.057);
  rectMode(CORNER);
}

void drawInitialMenuScreen() {
    background(bgImage);
    fill(0, 0, 0, 200);
    strokeWeight(0);
    rect(width*0.2, height*0.25, width*0.6, height*0.73, 10);
    textAlign(CENTER);
    fill(255);
    textSize(titleSize);
    text("JAWS meets human", width/2, height/2.5);
    textSize(paragraphSize);
    text("Press 'p' to play (or to pause later on)", width/2, height/2);
    textAlign(LEFT);
    text(ruleset, width*0.25, height/1.5, width*0.5, height*0.4); // This textbox is limited by x2 and y2
}

void drawPauseScreen() {
	// TODO: draw dark transparent background
    fill(255);
	textAlign(CENTER);
	textSize(titleSize);
	text("PAUSE", width/2, height/2.5);
	textSize(paragraphSize);
	text("Press 'p' to keep on playing", width/2, height/2);
}

void drawDifficultySetting() {
	fill(255);
	textAlign(CENTER);
	textSize(descriptionSize);
	text("Choose your difficulty level between 1 and 3 by pressing the respective keys.", width/2, height/1.8);
}