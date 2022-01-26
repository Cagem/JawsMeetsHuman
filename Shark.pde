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

// Function to draw the sharks shadow
void drawSharkShadow() {
  rectMode(CORNER);
  tint(10); // make the shadow dark
  drawSharkImg(20);
  tint(255); // back to normal
}

// Function to set the sharks jumping time
void setJumpingTimer() {
  jumpingTimer++;

  if (jumpingTimer == 90) {
    shark.setIsJumping(false);
    jumpingTimer = 0;
  }
}

// Function to set the sharks blockage time until he can jump again
void setBlockedJumpTimer() {
  blockedJumpTimer++;

  if (blockedJumpTimer == 200) {
    resetBlockedJumpTimer();
  }
}

// Function to reset the sharks blockage so he can jump again
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

// Class for creating Shark Objects
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

  // Constructor that is being called while creating a new Shark Object
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

  // Setter for currentSpeed
  void setCurrentSpeed(float currentSpeed) {
    this.currentSpeed = currentSpeed;
  }

  // Setter for shark dimension
  void setDimensions(float sharkHeight, float sharkWidth) {
    this.height = sharkHeight;
    this.width = sharkWidth;
  }

  // Setter for height
  void setHeight(float sharkHeight) {
    this.height = sharkHeight;
  }

  // Setter for width
  void setWidth(float sharkWidth) {
    this.width = sharkWidth;
  }

  // Setter for isAllowedToJump
  void setIsAllowedToJump(boolean isAllowedToJump) {
    this.isAllowedToJump = isAllowedToJump;
  }

  // Setter for isJumping
  void setIsJumping(boolean isJumping) {
    this.isJumping = isJumping;
  }

  // Setter for velocity vector
  void setVelocity(float x, float y) {
    this.velocity.x = x;
    this.velocity.y = y;
  }

  // Function to increase the speed of the shark
  void increaseSpeed(float accelerationFactor) {
    if (this.currentSpeed < this.maxSpeed) this.currentSpeed = accelerationFactor * this.timeDelta + this.currentSpeed;
  }

  // Function to let the shark move
  void move() {
    this.position.add(this.velocity);
  }

  // Function to let the shark jump
  void jump() {
    this.setIsJumping(true);
    this.setIsAllowedToJump(false);
  }

  // Function to change the velocity (used if key gets pressed)
  void changeVelocity(float x, float y, float accelerationFactor) {
    this.setVelocity(x, y);
    this.increaseSpeed(accelerationFactor);
    this.velocity.mult(this.currentSpeed);
    this.increaseTimeDelta();
  }

  // Function to reverse the x coordinate of the velocity
  void reverseXVelocity() {
    this.velocity.x *= -1;
  }

  // Function to reverse the y coordinate of the velocity
  void reverseYVelocity() {
    this.velocity.y *= -1;
  }

  // Function to increase the time delta
  void increaseTimeDelta() {
    this.timeDelta = this.timeDelta + 1;
  }

  // Function to reset the time delta
  void resetTimeDelta() {
    this.timeDelta = 0;
  }

  // Function to let the shark respawn at a random point
  void respawn(int screenWidth, int screenHeight) {
    float fWidth = screenWidth;
    float fHeight = screenHeight;

    if (this.position.x > width / 2) {
      this.position.x = random(fWidth - fWidth / 3, fWidth-this.width);
      this.position.y = random(this.height, fHeight-this.height);
    } else {
      this.position.x = random(this.width, fWidth / 3);
      this.position.y = random(this.height, fHeight-this.height);
    }
  }
}
