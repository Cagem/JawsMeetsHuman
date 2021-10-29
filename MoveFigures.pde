String[] directions = { "isMovingLeft", "isMovingRight", "isMovingUp", "isMovingDown" }; // Possible moving directions
String[] movingModes = { "constant", "onKeyPress" }; // Modes in which objects can move
int constantMovingSpeed = 3 * difficulty; // The global speed if an object moves constantly
int onPressMovingSpeed = 6 * difficulty; // The global speed if an object moves only on press

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