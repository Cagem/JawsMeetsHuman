PVector sharkPosition, sharkVelocity; // Hai-Position & Hai-Richtung
PVector humanPosition, humanVelocity; // Mensch-Position & Mensch-Richtung
float objectSize = 15; // The default size of any drawn object

float sharkHeight = objectSize * 4;
float sharkWidth = objectSize * 8;
float humanHeight = objectSize * 3;
float humanWidth = objectSize * 2;

// Function to draw the shark object at given coordinates
void drawShark() {
    PImage img = loadImage("shark.png");
    imageMode(CENTER);
    image(img, sharkPosition.x, sharkPosition.y, sharkWidth, sharkHeight);
}

// Function to draw the human object at given coordinates
void drawHuman() {
    PImage img = loadImage("human.png");
    imageMode(CENTER);
    image(img, humanPosition.x, humanPosition.y, humanWidth, humanHeight);
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
    humanVelocity = new PVector(0, 0);
    humanVelocity.mult(3);
}

// Initializes a Vector with random x & y coordinates
PVector initRandomPositionVector() {
    return new PVector(random(width), random(height));
}
