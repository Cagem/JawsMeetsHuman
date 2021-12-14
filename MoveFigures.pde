float maxConstantMovingSpeed = 3 * difficulty; // The global speed if an object moves constantly
float maxOnPressMovingSpeed = 3 * difficulty; // The global speed if an object moves only on press
float acceleration = 0.9; // Beschleunigung
float currentSharkSpeed = 0; // Current speed of the shark
float currentHumanSpeed = 0; // Current speed of the human
boolean shouldHumanMove = false, shouldSharkMove = true; // Used to identify if the figures position should be updated at the next draw-call
boolean hasHumanOverstepped = false;



// Moves the position-vector in  the directon of the velocity-vector
void moveVectorObject(PVector position, PVector velocity) {
    position.add(velocity);
}

// Increases the speed of the shark
void increaseSharkSpeed() {
    if(currentSharkSpeed < maxConstantMovingSpeed) {
        currentSharkSpeed += acceleration;
}
}

// Increases the speed of the human
void increaseHumanSpeed() {
    if(currentHumanSpeed < maxOnPressMovingSpeed) {
        currentHumanSpeed += acceleration;
}
}

// Checks if the position-vector is colliding with the boundary
// If it collides, the velocity will be inverted
void checkBoundaryCollision(PVector position, PVector velocity, float radius) {
    if(position.x > width - radius) {
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

void checkSharkPathCollision() {
    if (!isSharkJumping) {
        PVector path = getClosestPath(sharkPosition, sharkVelocity);
        
        float leftSharkBorder = sharkPosition.x - objectSize;
        float rightSharkBorder = sharkPosition.x + objectSize;
        float topSharkBorder = sharkPosition.y - objectSize;
        float bottomSharkBorder = sharkPosition.y + objectSize;
        
        float leftPathBorder = path.x - objectSize * 2.5;
        float rightPathBorder = path.x + objectSize * 2.5;
        float topPathBorder = path.y - objectSize * 2.5;
        float bottomPathBorder = path.y + objectSize * 2.5;
        
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

void checkFigureCollision() {
    
    if(sharkPosition.x + sharkWidth / 2 > humanPosition.x - humanWidth / 2 && 
        sharkPosition.x - sharkWidth / 2 < humanPosition.x + humanWidth / 2 && 
        sharkPosition.y + sharkHeight / 2 > humanPosition.y - humanHeight / 2 && 
        sharkPosition.y - sharkHeight / 2 < humanPosition.y + humanHeight / 2) {
        
        
        reduceLife();
        sharkRespawn();
}
}



void sharkRespawn() {
    
    
    if(sharkPosition.x > width / 2) {
        sharkPosition.x = random(width - width / 3, width);
        sharkPosition.y = random(0, height);
} else {
        sharkPosition.x = random(0, width / 3);
        sharkPosition.y = random(0, height);
}
}
