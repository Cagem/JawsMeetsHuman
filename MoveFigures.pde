float maxConstantMovingSpeed = 3 * difficulty; // The global speed if an object moves constantly
float maxOnPressMovingSpeed = 4 * difficulty; // The global speed if an object moves only on press
float acceleration = 1;
float currentSharkSpeed = 0;
float currentHumanSpeed = 0;
boolean shouldHumanMove = false, shouldSharkMove = true;

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