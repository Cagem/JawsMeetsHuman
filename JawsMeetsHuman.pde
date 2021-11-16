// Function to initialize screen
void setup() {
	fullScreen(); // Initializes the screen as fullscreen

    initPaths();
	initShark(); // Initializes the shark json object
	initHuman(); // Initializes the human json object
    initMenuScreen();

    initThemeSound();
    
	frameRate(60); // IMPORTANT - needs to stay at 60! Is utilized for measurements of time.
}

// Function to draw on screen in loop
void draw() {
	if (displayMenu) {
		displayMenu();
	} else {
        if (displayDifficulty) displayDifficulty = false;
        background(176,196,222);

        if (shouldSharkMove) moveVectorObject(sharkPosition, sharkVelocity);
        if (shouldHumanMove) moveVectorObject(humanPosition, humanVelocity);

        drawPaths();
		drawHuman(); // Draws the human
		drawShark(); // Draws the shark
        drawLifes(); // Draws the Hearts/Lifes
        drawTimer(); // Draws the timer
        
        checkBoundaryCollision(sharkPosition, sharkVelocity, objectSize);
        checkBoundaryCollision(humanPosition, humanVelocity, objectSize);
    }
    showThemeSongPopup();
}

float RelativeSize(String size) {
  // XL -> Global relative fontsize for TITLES
  // M -> Global relative fontsize for REGULAR TEXT
  // S -> Global relative fontsize for DESCRIPTIVE TEXT

  float relativeSize = 0.1;

  if (size == "XL") relativeSize = width/20;
  else if (size == "M") relativeSize = width/80;
  else if (size == "S") relativeSize = width/90;
  else println("ERROR: function relativeSize() got an undefined paramenter.");

  return(relativeSize);
}