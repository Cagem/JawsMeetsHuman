float maxConstantMovingSpeed = 3 * difficulty; // The global speed if an object moves constantly
float maxOnPressMovingSpeed = 4 * difficulty; // The global speed if an object moves only on press
float acceleration = 1;
float currentSharkSpeed = 0;
float currentHumanSpeed = 0;
boolean shouldHumanMove = false, shouldSharkMove = true;
boolean hasHumanOverstepped = false;

// Moves the position-vector in  the directon of the velocity-vector
void moveVectorObject(PVector position, PVector velocity) {
    position.add(velocity);
}

// Checks if the position-vector is colliding with the boundary
// If it collides, the velocity will be inverted
void checkBoundaryCollision(PVector position, PVector velocity, float radius) {
    if (position.x > width-radius) {
        position.x = width-radius;
        velocity.x *= -1;
    } else if (position.x < radius) {
        position.x = radius;
        velocity.x *= -1;
    } else if (position.y > height-radius) {
        position.y = height-radius;
        velocity.y *= -1;
    } else if (position.y < radius) {
        position.y = radius;
        velocity.y *= -1;
    }
}

void checkIfHumanLeftPath() {
    PVector path = getClosestPath(humanPosition, humanVelocity);

    float leftHumanBorder = humanPosition.x - objectSize;
    float rightHumanBorder = humanPosition.x + objectSize;
    float upperHumanBorder = humanPosition.y - objectSize;
    float bottomHumanBorder = humanPosition.y + objectSize;

    float leftPathBorder = path.x - objectSize*2.5;
    float rightPathBorder = path.x + objectSize*2.5;
    float upperPathBorder = path.y - objectSize*2.5;
    float bottomPathBorder = path.y + objectSize*2.5;

    if (leftHumanBorder < leftPathBorder) {
        hasHumanOverstepped = true;
    } else if (rightHumanBorder > rightPathBorder) {
        hasHumanOverstepped = true;
    }if (upperHumanBorder < upperPathBorder) {
        hasHumanOverstepped = true;
    } else if (bottomHumanBorder > bottomPathBorder) {
        hasHumanOverstepped = true;
    } else {
        hasHumanOverstepped = false;
    }
}

void checkSharkPathCollision() {
    if (!isSharkJumping) {
        PVector path = getClosestPath(sharkPosition, sharkVelocity);

        float leftSharkBorder = sharkPosition.x - objectSize;
        float rightSharkBorder = sharkPosition.x + objectSize;
        float topSharkBorder = sharkPosition.y - objectSize;
        float bottomSharkBorder = sharkPosition.y + objectSize;

        float leftPathBorder = path.x - objectSize*2.5;
        float rightPathBorder = path.x + objectSize*2.5;
        float topPathBorder = path.y - objectSize*2.5;
        float bottomPathBorder = path.y + objectSize*2.5;

        if (isSharkLeftFromPath) {
            if (sharkVelocity.x > 0 && rightSharkBorder > leftPathBorder) {
                sharkVelocity.x *= -1;
            }
            if (sharkVelocity.y < 0 && topSharkBorder < bottomPathBorder) {
                sharkVelocity.y *= -1;
            }
            if (sharkVelocity.y > 0 && bottomSharkBorder > topPathBorder) {
                sharkVelocity.y *= -1;
            }
        } else if (isSharkRightFromPath) {
            if (leftSharkBorder < rightPathBorder) {
                sharkVelocity.x *= -1;
            } 
            if (topSharkBorder < bottomPathBorder) {
                sharkVelocity.y *= -1;
            }
            if (bottomSharkBorder > topPathBorder) {
                sharkVelocity.y *= -1;
            }
        }
    } 
}

void checkSharkHumanCollision() {
    float distance = sharkPosition.dist(humanPosition);

    float[] xSharkBorders = {sharkPosition.x - objectSize, sharkPosition.x + objectSize};
    float[] ySharkBorders = {sharkPosition.y - objectSize, sharkPosition.y + objectSize};

    float[] xHumanBorders = {humanPosition.x - objectSize, humanPosition.x + objectSize};
    float[] yHumanBorders = {humanPosition.y - objectSize, humanPosition.y + objectSize};

    if (distance < objectSize*2) {
        lifes--;
        sharkVelocity.x *= -1;
        sharkVelocity.y *= -1;
    }
}
