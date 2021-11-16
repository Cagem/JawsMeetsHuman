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

PVector getPathHumanStandsOn() {
    int index = 0;
    float closestDistance = humanPosition.dist(paths.get(0));

    for (int i = index; i < paths.size(); i++) {
        PVector path = paths.get(i);
        float distance = humanPosition.dist(path);
        if (distance < closestDistance) {
            closestDistance = distance;
            index = i;
        }
    }

    return paths.get(index);
}

void checkIfHumanLeftPath() {
    PVector path = getPathHumanStandsOn();
    float leftHumanBorder = humanPosition.x - objectSize;
    float rightHumanBorder = humanPosition.x + objectSize;

    float leftPathBorder = path.x - objectSize*2.5;
    float rightPathBorder = path.x + objectSize*2.5;

    if (leftHumanBorder < leftPathBorder) {
        println("OVERSTEPPED_LEFT");
        hasHumanOverstepped = true;
    } else if (rightHumanBorder > rightPathBorder) {
        println("OVERSTEPPED_RIGHT");
        hasHumanOverstepped = true;
    } else {
        hasHumanOverstepped = false;
    }
}