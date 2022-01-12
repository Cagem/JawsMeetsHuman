// @author Kyra Muhl

float maxConstantMovingSpeed = 4 * difficulty; // The global speed if an object moves constantly
float maxOnPressMovingSpeed = 3 * difficulty; // The global speed if an object moves only on press
float acceleration = 0.9; // TODO: should be a formular 
/**
* Beschleunigung
* Für die Beschleunigung könnt ihr die Formel für eine gleichmäßig beschleunigte Bewegung nehmen - das Geschwindigkeit-Zeit-Gesetz:
* vneu = a · t + valt

* vneu ist die Geschwindigkeit
* a ist die Beschleunigung
* t ist die Zeit (Differenz aus dem Frame, in dem ich angefangen habe zu beschleunigen und jetzt)
* valt ist die Anfangsgeschwindigkeit (vom letzten Frame)
*/
float currentSharkSpeed = 0; // Current speed of the shark
float currentHumanSpeed = 0; // Current speed of the human
boolean shouldHumanMove = false; // Used to identify if the figures position should be updated at the next draw-call
boolean hasHumanOverstepped = false;

// Moves the position-vector in  the directon of the velocity-vector
void moveVectorObject(PVector position, PVector velocity) {
  position.add(velocity);
}

// Increases the speed of the shark
void increaseSharkSpeed() {
  if (currentSharkSpeed < maxConstantMovingSpeed) {
    currentSharkSpeed += acceleration;
  }
}

// Increases the speed of the human
void increaseHumanSpeed() {
  if (currentHumanSpeed < maxOnPressMovingSpeed) {
    currentHumanSpeed += acceleration;
  }
}

// Checks if theposition - vector is colliding with the boundary
// If it collides, the velocity will be inverted
void checkBoundaryCollision(PVector position, PVector velocity, float objWidth, float objHeight) {
  if (position.x >= width - objWidth) {
    velocity.x *= -1;
  } else if (position.x <= 0) {
    velocity.x *= -1;
  } else if (position.y >= height - objHeight) {
    velocity.y *= -1;
  } else if (position.y <= 0) {
    velocity.y *= -1;
  }
}

void checkPathCollision() {
  if (!shark.isJumping) {
    // iterate over the obstacles
    for (int i = 0; i < paths.size(); i++) {
      boolean hasSharkStoppedJumping = !shark.isAllowedToJump && blockedJumpTimer < 50;

      // check collision for this obstacle
      Path path = paths.get(i);

      // check X movment
      if (shark.position.x + shark.width + shark.velocity.x > path.x && 
        shark.position.x + shark.velocity.x < path.x + path.width && 
        shark.position.y + shark.height > path.y && 
        shark.position.y < path.y + path.height) {

        shark.reverseXVelocity();

        if (hasSharkStoppedJumping) {
          resetBlockedJumpTimer();
          sharkRespawn();
        }
      }

      // check Y movement
      if (shark.position.x + shark.width > path.x && 
        shark.position.x < path.x + path.width && 
        shark.position.y + shark.height + shark.velocity.y > path.y && 
        shark.position.y + shark.velocity.y < path.y + path.height) {

        shark.reverseYVelocity();

        if (hasSharkStoppedJumping) {
          resetBlockedJumpTimer();
          sharkRespawn();
        }
      }
    }
  }
}


void checkFigureCollision() {
  if (shark.position.x + shark.width / 2 > humanPosition.x - humanWidth / 2 && 
    shark.position.x - shark.width / 2 < humanPosition.x + humanWidth / 2 && 
    shark.position.y + shark.height / 2 > humanPosition.y - humanHeight / 2 && 
    shark.position.y - shark.height / 2 < humanPosition.y + humanHeight / 2) {

    reduceLife();
    sharkRespawn();
  }
}

void sharkRespawn() {
  if (shark.position.x > width / 2) {
    shark.position.x = random(width - width / 3, width);
    shark.position.y = random(0, height);
  } else {
    shark.position.x = random(0, width / 3);
    shark.position.y = random(0, height);
  }
}
