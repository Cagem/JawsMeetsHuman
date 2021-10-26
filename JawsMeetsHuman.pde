JSONObject shark, human;
int constantMovingSpeed = 3; // The global speed if an object moves constantly
int onPressMovingSpeed = 6; // The global speed if an object moves only on press
int objectSize = 50; // The default size of any drawn object
String[] directions = { "isMovingLeft", "isMovingRight", "isMovingUp", "isMovingDown" }; // Possible moving directions
String[] movingModes = { "constant", "onKeyPress" }; // Modes in which objects can move
boolean inMenu = true;
boolean inGame = false;
boolean inPause = false; // Only false after initial startup to show rules etc.


// Function to initialize screen
void setup() {
	fullScreen(); // Initializes the screen as fullscreen
	initShark(); // Initializes the shark json object
	initHuman(); // Initializes the human json object
	bgImage = loadImage("shark.jpg");
	bgImage.resize(width, height); // the background image has to be the same size as the program
}

// Function to draw on screen in loop
void draw() {
	if (inMenu) {
		displayMenu();
	}
	if (inGame) {
		background(200);

		moveObject(shark); // Updates the shark coordinates
		moveObject(human); // Updates the human coordinates

		drawHuman(); // Draws the human
		drawShark(); // Draws the shark
	}
}

// Event that is called when a key is released
void keyReleased() {
	if (key == CODED && keyCode == LEFT || keyCode == RIGHT || keyCode == UP || keyCode == DOWN) {
		// When the shark should only move on press, the direction value is here set to -1 so that at the next move-call 
		// the shark will not be moved
		if (shouldMoveOnPress(shark)) {
			setDirection(shark, -1);
		}
	} else if (key == 'a' || key == 'd' || key == 'w' || key == 's') {
		// When the human should only move on press, the direction value is set to -1 so that at the next move-call 
		// the human will not be moved
		if (shouldMoveOnPress(human)) {
			setDirection(human, -1);
		}
	}
}

// Event that is called when a key is pressed
void keyPressed() {
	if (key == CODED) {
		switch(keyCode) {
		case LEFT:
			setDirection(shark, 0);
			break;
		case RIGHT:
			setDirection(shark, 1);
			break;
		case UP:
			setDirection(shark, 2);
			break;
		case DOWN:
			setDirection(shark, 3);
			break;
		default:
			break;
		}
	} else {
		switch(key) {
		case 'a':
			setDirection(human, 0);
			break;
		case 'd':
			setDirection(human, 1);
			break;
		case 'w':
			setDirection(human, 2);
			break;
		case 's':
			setDirection(human, 3);
			break;
		case 'p': // Press p to play or pause
			inGame = !inGame;
			inMenu = !inMenu;
			inPause = true; // As soon as the player got into the game, there is no need for startup specific options like rules anymore.
			break;
		default:
			break;
		}
	}
}

// Function to check if the Object has the property to constantly move
boolean shouldConstantlyMove(JSONObject o) {
  	return o.getInt("movingMode") == 0;
}

// Function to check if the Object has the property to only move if a key is pressed
boolean shouldMoveOnPress(JSONObject o) {
  	return o.getInt("movingMode") == 1;
}

// Function to set the direction property of the Object
void setDirection(JSONObject o, int direction) {
  	o.setInt("direction", direction);
}

// Function to set the coordinates of an object according to its direction
// ("Moves the object at the next draw call")
JSONObject moveObject(JSONObject o) {
	int speed;
	
	// Sets the objects speed depending on the moving mode
	if (shouldConstantlyMove(o)) {
		speed = constantMovingSpeed;
	} else {
		speed = onPressMovingSpeed;
	}
	
	// Moves the object if the direction is not unset
	// (The -1 prevents that an object will not be moved if another key is pressed at the same time)
	if (o.getInt("direction") != -1) {
		switch(o.getInt("direction")) {
		case 0:
			return moveObjectLeft(o, speed);
		case 1: 
			return moveObjectRight(o, speed);
		case 2: 
			return moveObjectUp(o, speed);
		case 3: 
			return moveObjectDown(o, speed);
		default:
			return o;
		}
	} else return o;
}

// Changes the Objects coordinates so that it will be higher positioned at the next draw call
JSONObject moveObjectUp(JSONObject o, int speed) {
	int yPosition = o.getInt("yPosition");

	// If the object is not at the end of the screen the y coordinate will be decreased so that the object will be moved up
	// If the object is at the end of the screen the direction will be inversed
	if (yPosition > objectSize) {
		o.setInt("yPosition", yPosition - speed);
	} else {
		o.setInt("direction", 3);
	}

	return o;
}

// Changes the Objects coordinates so that it will be lower positioned at the next draw call
JSONObject moveObjectDown(JSONObject o, int speed) {
	int yPosition = o.getInt("yPosition");

	// If the object is not at the end of the screen the y coordinate will be increased so that the object will be moved down
	// If the object is at the end of the screen the direction will be inversed
	if (yPosition < height - objectSize) {
		o.setInt("yPosition", yPosition + speed);
	} else {
		o.setInt("direction", 2);
	}

	return o;
}

// Changes the Objects coordinates so that it will be further left positioned at the next draw call
JSONObject moveObjectLeft(JSONObject o, int speed) {
	int xPosition = o.getInt("xPosition");

	// If the object is not at the end of the screen the x coordinate will be decreased so that the object will be moved left
	// If the object is at the end of the screen the direction will be inversed
	if (xPosition > objectSize) {
		o.setInt("xPosition", xPosition - speed);
	} else {
		o.setInt("direction", 1);
	}

	return o;
}

// Changes the Objects coordinates so that it will be further right positioned at the next draw call
JSONObject moveObjectRight(JSONObject o, int speed) {
	int xPosition = o.getInt("xPosition");

	// If the object is not at the end of the screen the x coordinate will be increased so that the object will be moved right
	// If the object is at the end of the screen the direction will be inversed
	if (xPosition < width - objectSize) {
		o.setInt("xPosition", xPosition + speed);
	} else {
		o.setInt("direction", 0);
	}

	return o;
}

// Function to draw the shark object at given coordinates
void drawShark() {
	rectMode(CENTER);
	fill(100);
	rect(shark.getInt("xPosition"), shark.getInt("yPosition"), objectSize, objectSize);
}

// Function to draw the human object at given coordinates
void drawHuman() {
	rectMode(CENTER);
	fill(229, 198, 163);
	rect(human.getInt("xPosition"), human.getInt("yPosition"), objectSize, objectSize);
	fill(208, 184, 172);
	rect(human.getInt("xPosition"), human.getInt("yPosition"), objectSize-25, objectSize-25);
}

// Initializes the shark json object
void initShark() {
  	shark = initMovableObject(0);
}

// Initializes the human json object
void initHuman() {
  	human = initMovableObject(1);
}

// Function to initialize a json object with properties 
// that will safe the coordinates, moving direction & moving mode
JSONObject initMovableObject(int movingMode) {
	JSONObject o = new JSONObject();
	int xPosition = int(random(width));
	int yPosition = int(random(height));
	int direction = int(random(directions.length));

	o.setInt("xPosition", xPosition);
	o.setInt("yPosition", yPosition);
	o.setInt("movingMode", movingMode);

	if (movingMode == 0) o.setInt("direction", direction);
	if (movingMode == 1) o.setInt("direction", -1);

	return o;
}

//