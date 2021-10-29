int countFrames = 0;

// Function to initialize screen
void setup() {
	fullScreen(); // Initializes the screen as fullscreen
	initShark(); // Initializes the shark json object
	initHuman(); // Initializes the human json object
    initMenuScreen();
	frameRate(60);
}

// Function to draw on screen in loop
void draw() {
	if (shouldDisplayMenu) {
		displayMenu();
	} else {
        if (shouldDisplayDifficulty) shouldDisplayDifficulty = false;
        background(200);

        if (shouldSharkMove) moveVectorObject(sharkPosition, sharkVelocity);
        if (shouldHumanMove) moveVectorObject(humanPosition, humanVelocity);

		drawHuman(); // Draws the human
		drawShark(); // Draws the shark

        checkBoundaryCollision(sharkPosition, sharkVelocity, objectSize);
        checkBoundaryCollision(humanPosition, humanVelocity, objectSize);
    }  
}
