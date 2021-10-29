int objectSize = 50; // The default size of any drawn object

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
