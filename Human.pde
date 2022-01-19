// @author Kyra Muhl
// @author Jona König

PVector humanPosition, humanVelocity;
int humanHeight;
int humanWidth;

// Function to draw the human object at given coordinates
void drawHuman() {
  imageMode(CENTER);
  image(humanImg, humanPosition.x, humanPosition.y, humanWidth, humanHeight);
}

// Initializes the human vectors
void initHuman() {
  humanHeight = humanImg.height;
  humanWidth = humanImg.width;
  humanPosition = new PVector(paths.get(0).x + paths.get(0).width/2, paths.get(0).y + paths.get(0).height/2);
  humanVelocity = new PVector(0, 0);
  humanVelocity.mult(3);
}
