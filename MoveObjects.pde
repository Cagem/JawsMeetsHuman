// @author Kyra Muhl

float accelerationFactor = difficulty;
float standardSharkSpeed = difficulty;
float standardHumanSpeed = difficulty * 2;
float currentSharkSpeed = standardSharkSpeed; // Current speed of the shark
float currentHumanSpeed = standardHumanSpeed; // Current speed of the human
int timeDeltaShark = 0;
int timeDeltaHuman = 0;
boolean shouldHumanMove = false; // Used to identify if the figures position should be updated at the next draw-call
boolean hasHumanOverstepped = false;
boolean victory = false;

// Moves the position-vector in  the directon of the velocity-vector
void moveVectorObject(PVector position, PVector velocity) {
  position.add(velocity);
}

// Increases the speed of the shark
void increaseSharkSpeed() {
  currentSharkSpeed = accelerationFactor * timeDeltaShark + currentSharkSpeed;
}

// Increases the speed of the human
void increaseHumanSpeed() {
  currentHumanSpeed = accelerationFactor * timeDeltaHuman + currentHumanSpeed;
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

void checkPathCollisionSkark() {
  if (!shark.isJumping) {
    // iterate over the obstacles
    for (int i = 0; i < paths.size(); i++) {
      boolean hasSharkStoppedJumping = !shark.isAllowedToJump && blockedJumpTimer < 50;

      // check collision for this obstacle
      Path path = paths.get(i);

      // check X movment
      if (shark.position.x + shark.width/2 + shark.velocity.x > path.x && 
        shark.position.x + shark.velocity.x - shark.width/2 < path.x + path.width && 
        shark.position.y + shark.height/2 > path.y && 
        shark.position.y < path.y + path.height) {

        shark.reverseXVelocity();

        if (hasSharkStoppedJumping) {
          resetBlockedJumpTimer();
          sharkRespawn();
        }
      }

      // check Y movement
      if (shark.position.x + shark.width/2 > path.x && 
        shark.position.x < path.x + path.width && 
        shark.position.y + shark.height/2 + shark.velocity.y > path.y && 
        shark.position.y + shark.velocity.y - shark.height/2 < path.y + path.height) {

        shark.reverseYVelocity();

        if (hasSharkStoppedJumping) {
          resetBlockedJumpTimer();
          sharkRespawn();
        }
      }
    }
  }
}

void checkPathCollisionHuman() {
  // Idea: Check if human is within a tile. If not, check wheter the human is on one of the other tiles in the array. If not, he should slow donw or similar.
  // CODE
  
  // Checks wheter the human got to the last tile of the path in which case he wins and the game should end (victory = true).
  // TODO: The last tile sometimes is generated out of reach for the human.
  if (humanPosition.x + humanWidth / 2 > lastTile.x &&
      humanPosition.x + humanWidth / 2 < lastTile.x + lastTile.width &&
      humanPosition.y + humanHeight / 2 > lastTile.y &&
      humanPosition.y + humanHeight / 2 < lastTile.y + lastTile.width) {
        canvasImg = get(); // Takes a screenshot of the canvas which is then utilized in drawMenuScreen().
        victory = true;
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

void humanRespawn() {
  humanPosition = new PVector(paths.get(0).x + paths.get(0).width/2, paths.get(0).y + paths.get(0).height/2);
}