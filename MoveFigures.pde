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
    PVector path = getClosestPath(humanPosition);

    float leftHumanBorder = humanPosition.x - objectSize;
    float rightHumanBorder = humanPosition.x + objectSize;
    float upperHumanBorder = humanPosition.y - objectSize;
    float bottomHumanBorder = humanPosition.y + objectSize;

    float leftPathBorder = path.x - objectSize*2.5;
    float rightPathBorder = path.x + objectSize*2.5;
    float upperPathBorder = path.y - objectSize*2.5;
    float bottomPathBorder = path.y + objectSize*2.5;

    if (leftHumanBorder < leftPathBorder) {
        println("OVERSTEPPED_LEFT");
        hasHumanOverstepped = true;
    } else if (rightHumanBorder > rightPathBorder) {
        println("OVERSTEPPED_RIGHT");
        hasHumanOverstepped = true;
    }if (upperHumanBorder < upperPathBorder) {
        println("OVERSTEPPED_TOP");
        hasHumanOverstepped = true;
    } else if (bottomHumanBorder > bottomPathBorder) {
        println("OVERSTEPPED_BOTTOM");
        hasHumanOverstepped = true;
    } else {
        hasHumanOverstepped = false;
    }
}

void checkSharkPathCollision() {
    if (!isSharkJumping) {
        PVector path = getClosestPath(sharkPosition);

        float leftSharkBorder = sharkPosition.x - objectSize;
        float rightSharkBorder = sharkPosition.x + objectSize;

        float leftPathBorder = path.x - objectSize*2.5;
        float rightPathBorder = path.x + objectSize*2.5;

        if (isSharkLeftFromPath) {
            if (rightSharkBorder > leftPathBorder) {
                sharkVelocity.x *= -1;
            }
        } else if (isSharkRightFromPath) {
            if (leftSharkBorder < rightPathBorder) {
                sharkVelocity.x *= -1;
            }
        }
    } 
}