Shark shark;

int jumpingTimer = 0;
int blockedJumpTimer = 0;

// Function to draw the shark object at given coordinates
void drawShark() {
  if (shark.isJumping) drawSharkShadow();

  rectMode(CORNER);
  fill(255);
  rect(shark.position.x, shark.position.y, shark.width, shark.height);
}

void drawSharkImg() {
  PImage img = loadImage("shark.png");
  image(img, shark.position.x, shark.position.y, shark.width, shark.height);
}

void drawSharkShadow() {
  rectMode(CORNER);
  fill(0, 50);
  rect(shark.position.x - 7, shark.position.y + 7, shark.width, shark.height);
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
  PVector position = new PVector(10, height - objectSize * 4 - 30);
  PVector velocity = new PVector(-1, 0);
  velocity.mult(1);

  shark = new Shark(position, velocity, objectSize * 8, objectSize * 4);
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
