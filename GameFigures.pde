PVector humanPosition, humanVelocity; // Mensch-Position & Mensch-Richtung
float objectSize = 15; // The default size of any drawn object

float humanHeight = objectSize * 3;
float humanWidth = objectSize * 2;

// Function to draw the human object at given coordinates
void drawHuman() {
  PImage img = loadImage("human.png");
  imageMode(CENTER);
  image(img, humanPosition.x, humanPosition.y, humanWidth, humanHeight);
  imageMode(CORNER);
}

// Initializes the human vectors
void initHuman() {
  humanPosition = new PVector(paths.get(0).x + paths.get(0).width/2, paths.get(0).y + paths.get(0).height/2);
  humanVelocity = new PVector(0, 0);
  humanVelocity.mult(3);
}
