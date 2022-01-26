// @author Kyra Muhl
// @author Jona König

Shark shark;

int jumpingTimer = 0;
int blockedJumpTimer = 0;
String sharkOrientation = "RIGHT"; // This String is  to be used globally for defining the sharks hitarea AND to rotate its image. 

// Function to draw the shark object at given coordinates
void drawShark() {
  if (shark.isJumping) drawSharkShadow();

  rectMode(CENTER);
  fill(255);
  drawSharkImg(0);
}

void drawSharkImg(int shift) {

  String oldSharkOrientation = checkMousePosition();
  imageMode(CENTER);

  if (oldSharkOrientation != sharkOrientation &&
    oldSharkOrientation != "NO_CHANGE") sharkOrientation = checkMousePosition();

  if (sharkOrientation == "UP") {
    pushMatrix();
    translate(shark.position.x, shark.position.y);
    rotate(radians(270));
    image(sharkImg, 0 - shift, 0 + shift, sharkImg.width, sharkImg.height);
    popMatrix();
    shark.setDimensions(sharkImg.width, sharkImg.height);
  } else if (sharkOrientation == "DOWN") {
    pushMatrix();
    translate(shark.position.x, shark.position.y);
    rotate(radians(90));
    image(sharkImg, 0 - shift, 0 + shift, sharkImg.width, sharkImg.height);
    popMatrix();
    shark.setDimensions(sharkImg.width, sharkImg.height);
  } else if (sharkOrientation == "LEFT") {
    pushMatrix();
    scale(-1.0, 1.0);
    image(sharkImg, -shark.position.x - shift, shark.position.y + shift, shark.width, shark.height);
    popMatrix();
    shark.setDimensions(sharkImg.height, sharkImg.width);
  } else { // standard orientation is heading right
    image(sharkImg, shark.position.x - shift, shark.position.y + shift, shark.width, shark.height);
    shark.setDimensions(sharkImg.height, sharkImg.width);
  }
}

void drawSharkShadow() {
  rectMode(CORNER);
  tint(10); // make the shadow dark
  drawSharkImg(20);
  tint(255); // back to normal
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
  int sharkWidth = sharkImg.width;
  int sharkHeight = sharkImg.height;
  PVector position = new PVector(sharkWidth + 10, height - sharkHeight - 30);
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
  float maxSpeed;
  float currentSpeed;
  float standardSpeed;
  int timeDelta;

  public Shark(PVector position, PVector velocity, float sharkWidth, float sharkHeight) {
    this.position = position;
    this.velocity = velocity;
    this.width = sharkWidth;
    this.height = sharkHeight;
    this.isJumping = false;
    this.isAllowedToJump = true;

    this.maxSpeed = difficulty * 3; // defines for how many frames the object can accelerate
    this.standardSpeed = difficulty;
    this.currentSpeed = this.standardSpeed; // Current speed of the shark
    this.timeDelta = 0;
  }

  void setCurrentSpeed(float currentSpeed) {
    this.currentSpeed = currentSpeed;
  }

  void setDimensions(float sharkHeight, float sharkWidth) {
    this.height = sharkHeight;
    this.width = sharkWidth;
  }

  void setHeight(float sharkHeight) {
    this.height = sharkHeight;
  }

  void setWidth(float sharkWidth) {
    this.width = sharkWidth;
  }

  void setIsAllowedToJump(boolean isAllowedToJump) {
    this.isAllowedToJump = isAllowedToJump;
  }

  void setIsJumping(boolean isJumping) {
    this.isJumping = isJumping;
  }

  void setVelocity(float x, float y) {
    this.velocity.x = x;
    this.velocity.y = y;
  }

  void increaseSpeed(float accelerationFactor) {
    if (this.currentSpeed < this.maxSpeed) this.currentSpeed = accelerationFactor * this.timeDelta + this.currentSpeed;
  }

  void move() {
    this.position.add(this.velocity);
  }

  void jump() {
    this.setIsJumping(true);
    this.setIsAllowedToJump(false);
  }

  void changeVelocity(float x, float y, float accelerationFactor) {
    this.setVelocity(x, y);
    this.increaseSpeed(accelerationFactor);
    this.velocity.mult(this.currentSpeed);
    this.increaseTimeDelta();
  }

  void reverseXVelocity() {
    this.velocity.x *= -1;
  }

  void reverseYVelocity() {
    this.velocity.y *= -1;
  }

  void increaseTimeDelta() {
    this.timeDelta = this.timeDelta + 1;
  }

  void resetTimeDelta() {
    this.timeDelta = 0;
  }

  void respawn() {
    if (this.position.x > width / 2) {
      this.position.x = random(width - width / 3, width);
      this.position.y = random(0, height);
    } else {
      this.position.x = random(0, width / 3);
      this.position.y = random(0, height);
    }
  }
}
