int countFrames = 0;

// Function to initialize screen
void setup() {
	fullScreen(); // Initializes the screen as fullscreen

    initPaths();
	initShark(); // Initializes the shark json object
	initHuman(); // Initializes the human json object
    initMenuScreen();

    startThemeSong();
    
	frameRate(60);
}

// Function to draw on screen in loop
void draw() {
	if (shouldDisplayMenu) {
		displayMenu();
	} else {
        if (shouldDisplayDifficulty) shouldDisplayDifficulty = false;
        background(176,196,222);

        if (shouldSharkMove) moveVectorObject(sharkPosition, sharkVelocity);
        if (shouldHumanMove) moveVectorObject(humanPosition, humanVelocity);

        drawPaths();
		drawHuman(); // Draws the human
		drawShark(); // Draws the shark
        
        checkBoundaryCollision(sharkPosition, sharkVelocity, objectSize);
        checkBoundaryCollision(humanPosition, humanVelocity, objectSize);
    }  
}

//