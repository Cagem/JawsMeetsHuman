JSONObject shark, human;
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

		moveObject(shark); // Updates the shark coordinates
		moveObject(human); // Updates the human coordinates

		drawHuman(); // Draws the human
		drawShark(); // Draws the shark
    }  
}
