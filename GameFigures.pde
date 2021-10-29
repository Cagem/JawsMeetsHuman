PVector sharkPosition, sharkVelocity; // Hai-Position & Hai-Richtung
PVector humanPosition, humanVelocity; // Mensch-Position & Mensch-Richtung
float objectSize = 25; // The default size of any drawn object

// Function to draw the shark object at given coordinates
void drawShark() {
	rectMode(CENTER);
	fill(100);
	rect(sharkPosition.x, sharkPosition.y, objectSize*2, objectSize*2);
}

// Function to draw the human object at given coordinates
void drawHuman() {
	rectMode(CENTER);
	fill(229, 198, 163);
	rect(humanPosition.x, humanPosition.y, objectSize*2, objectSize*2);
}

// Initializes the shark json object
void initShark() {
    sharkPosition = initRandomPositionVector();
    sharkVelocity = PVector.random2D();
    sharkVelocity.mult(3);
}

// Initializes the human json object
void initHuman() {
    humanPosition = initRandomPositionVector();
    humanVelocity = PVector.random2D();
    humanVelocity.mult(3);
}

// Function to initialize a json object with properties 
// that will safe the coordinates, moving direction & moving mode
PVector initRandomPositionVector() {
    return new PVector(random(width), random(height));
}
