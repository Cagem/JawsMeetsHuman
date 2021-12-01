PVector sharkPosition, sharkVelocity; // Hai-Position & Hai-Richtung
PVector humanPosition, humanVelocity; // Mensch-Position & Mensch-Richtung
float objectSize = 15; // The default size of any drawn object
PImage img;

// Function to draw the shark object at given coordinates
void drawShark() {
	img = loadImage("1.png");
  imageMode(CENTER);
	image(img, sharkPosition.x, sharkPosition.y, objectSize*7.53, objectSize*3.4);
}

// Function to draw the human object at given coordinates
void drawHuman() {
	img = loadImage("2.png");
  imageMode(CENTER);
	image(img, humanPosition.x, humanPosition.y, objectSize*2, objectSize*3);
}

// Initializes the shark vectors
void initShark() {
    sharkPosition = initRandomPositionVector();
    sharkVelocity = PVector.random2D();
    sharkVelocity.mult(3);
}

// Initializes the human vectors
void initHuman() {
    humanPosition = new PVector(paths.get(0).x, paths.get(0).y);
    humanVelocity = PVector.random2D();
    humanVelocity.mult(3);
}

// Initializes a Vector with random x & y coordinates
PVector initRandomPositionVector() {
    return new PVector(random(width), random(height));
}
