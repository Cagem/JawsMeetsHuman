// @author Jona König
// @author Kyra Muhl

Shark shark;

int jumpingTimer = 0;
int blockedJumpTimer = 0;
int sharkHeight;
int sharkWidth ;

String sharkOrientation = "RIGHT"; // This String is  to be used globally for defining the sharks hitarea AND to rotate its image. 

// Function to draw the shark object at given coordinates
void drawShark() {
  if (shark.isJumping) drawSharkShadow();

  rectMode(CENTER);
  fill(255);
  drawSharkImg();
}

void drawSharkImg() {

  String oldSharkOrientation = checkMousePosition();
  imageMode(CENTER);

  if (oldSharkOrientation != sharkOrientation &&
    oldSharkOrientation != "NO_CHANGE") sharkOrientation = checkMousePosition();

  if (sharkOrientation == "UP") {
    pushMatrix();
    translate(shark.position.x, shark.position.y);
    rotate(radians(270));
    image(sharkImg, 0, 0, shark.width, shark.height);
    popMatrix();
    sharkWidth = sharkImg.height;
    sharkHeight = sharkImg.width;
  } else if (sharkOrientation == "DOWN") {
    pushMatrix();
    translate(shark.position.x, shark.position.y);
    rotate(radians(90));
    image(sharkImg, 0, 0, shark.width, shark.height);
    popMatrix();
    sharkWidth = sharkImg.height;
    sharkHeight = sharkImg.width;
  } else if (sharkOrientation == "LEFT") {
    pushMatrix();
    scale(-1.0, 1.0);
    image(sharkImg, -shark.position.x, shark.position.y, shark.width, shark.height);
    popMatrix();
    sharkWidth = sharkImg.width;
    sharkHeight = sharkImg.height;
  } else { // standard orientation is heading right
    image(sharkImg, shark.position.x, shark.position.y, shark.width, shark.height);
    sharkWidth = sharkImg.width;
    sharkHeight = sharkImg.height;
  }
}

void drawSharkShadow() {
  rectMode(CORNER);
  fill(0, 50);
  rect(shark.position.x - 2, shark.position.y + 2, shark.width, shark.height);
}

void setJumpingTimer() {
  jumpingTimer++;

  if (jumpingTimer == 90) {
    shark.setIsJumping(false);
    jumpingTimer = 0;
  }
}

void setBlockedJumpTimer() {
  blockedJumpTimer++;

  if (blockedJumpTimer == 200) {
    resetBlockedJumpTimer();
  }
}

void resetBlockedJumpTimer() {
  shark.setIsAllowedToJump(true);
  blockedJumpTimer = 0;
}

// Initializes the shark
void initShark() {
  sharkWidth = sharkImg.width;
  sharkHeight = sharkImg.height;
  PVector position = new PVector(10, height - sharkHeight - 30);
  PVector velocity = new PVector(-1, 0);
  velocity.mult(1);

  shark = new Shark(position, velocity, sharkWidth, sharkHeight);
}

class Shark {
  PVector position;
  PVector velocity;
  float width;
  float height;
  boolean isJumping;
  boolean isAllowedToJump;

  public Shark(PVector position, PVector velocity, float sharkWidth, float sharkHeight) {
    this.position = position;
    this.velocity = velocity;
    this.width = sharkWidth;
    this.height = sharkHeight;
    this.isJumping = false;
    this.isAllowedToJump = true;
  }

  void setIsAllowedToJump(boolean isAllowedToJump) {
    this.isAllowedToJump = isAllowedToJump;
  }

  void setIsJumping(boolean isJumping) {
    this.isJumping = isJumping;
  }

  void reverseXVelocity() {
    this.velocity.x *= -1;
  }

  void reverseYVelocity() {
    this.velocity.y *= -1;
  }
}
