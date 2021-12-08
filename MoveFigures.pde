float maxConstantMovingSpeed = 3 * difficulty; // The global speed if an object moves constantly
float maxOnPressMovingSpeed = 3 * difficulty; // The global speed if an object moves only on press
float acceleration = 0.5; // Beschleunigung
float currentSharkSpeed = 0; // Current speed of the shark
float currentHumanSpeed = 0; // Current speed of the human
boolean shouldHumanMove = false, shouldSharkMove = true; // Used to identify if the figures position should be updated at the next draw-call

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
void checkBoundaryCollision(PVector position, PVector velocity, float radius) {
  if (position.x > width - radius) {
    position.x = width - radius;
    velocity.x *= -1;
  } else if (position.x < radius) {
    position.x = radius;
    velocity.x *= -1;
  } else if (position.y > height - radius) {
    position.y = height - radius;
    velocity.y *= -1;
  } else if (position.y < radius) {
    position.y = radius;
    velocity.y *= -1;
  }
}

boolean checkTopSideColliding(float firstFigureTop, float secondFigureBottom, float secondFigureTop) {
  return firstFigureTop < secondFigureBottom && firstFigureTop > secondFigureTop;
}

boolean checkBottomSideColliding(float firstFigureBottom, float secondFigureBottom, float secondFigureTop) {
  return firstFigureBottom > secondFigureTop &&  firstFigureBottom < secondFigureBottom;
}

boolean checkRightSideColliding(float firstFigureRight, float secondFigureLeft, float secondFigureRight) {
  return firstFigureRight > secondFigureLeft && firstFigureRight < secondFigureRight;
}

boolean checkLeftSideColliding(float firstFigureLeft, float secondFigureLeft, float secondFigureRight) {
  return firstFigureLeft < secondFigureRight && firstFigureLeft > secondFigureLeft;
}


void checkFigureCollision() {
  float sharkLeftSide = sharkPosition.x - sharkWidth / 2;
  float sharkRightSide = sharkPosition.x + sharkWidth / 2;
  float sharkTopSide = sharkPosition.y - sharkHeight / 2;
  float sharkBottomSide = sharkPosition.y + sharkHeight / 2;

  float humanLeftSide = humanPosition.x - humanWidth / 2;
  float humanRightSide = humanPosition.x + humanWidth / 2;
  float humanTopSide = humanPosition.y - humanHeight / 2;
  float humanBottomSide = humanPosition.y + humanHeight / 2;

  boolean isCollidingLeft = checkLeftSideColliding(sharkLeftSide, humanLeftSide, humanRightSide);
  boolean isCollidingRight = checkRightSideColliding(sharkLeftSide, humanLeftSide, humanRightSide);
  boolean isCollidingBottom = checkBottomSideColliding(sharkBottomSide, humanBottomSide, humanTopSide);
  boolean isCollidingTop = checkTopSideColliding(sharkTopSide, humanBottomSide, humanTopSide);

  if (isCollidingLeft || isCollidingRight) {
    if (isCollidingBottom || isCollidingTop) {
      reduceLife();
      println("Collided left or right");
    }
  } else if (isCollidingBottom || isCollidingTop) {
    if (isCollidingLeft || isCollidingRight) {
      reduceLife();
      println("Collided top or bottom");
    }
  } else {
    if (hasReducedLife) {
      setNextHeartIndex();
      hasReducedLife = false;
    }
  }
}
