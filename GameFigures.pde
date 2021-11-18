PVector sharkPosition, sharkVelocity; // Hai-Position & Hai-Richtung
PVector humanPosition, humanVelocity; // Mensch-Position & Mensch-Richtung
float objectSize = 15; // The default size of any drawn object

boolean isSharkLeftFromPath = false;
boolean isSharkRightFromPath = false;
boolean isSharkJumping = false;
int jumpingTimer = 0;

// Function to draw the shark object at given coordinates
void drawShark() {
	rectMode(CENTER);
	fill(100);
	rect(sharkPosition.x, sharkPosition.y, objectSize*2, objectSize*2);
}

void drawSharkShadow() {
	rectMode(CENTER);
	fill(0, 50);
	rect(sharkPosition.x+7, sharkPosition.y+7, objectSize*2, objectSize*2);
}

void setJumpingTimer() {
    if (isSharkJumping == true) {
		jumpingTimer++;

        if (jumpingTimer == 80) {
            isSharkLeftOrRightFromPath();
            isSharkJumping = false;
            jumpingTimer = 0;
        }
	}
}

// Function to draw the human object at given coordinates
void drawHuman() {
	rectMode(CENTER);
	fill(229, 198, 163);
    if (hasHumanOverstepped) {
        strokeWeight(10);
        stroke(204, 0, 0);
    }
	rect(humanPosition.x, humanPosition.y, objectSize*2, objectSize*2);
    if (hasHumanOverstepped) {
        strokeWeight(4);
        noStroke();
    }
}

void isSharkLeftOrRightFromPath() {
    PVector path = getClosestPath(sharkPosition, sharkVelocity);

    float leftSharkBorder = sharkPosition.x - objectSize;
    float rightSharkBorder = sharkPosition.x + objectSize;

    float leftPathBorder = path.x - objectSize*2.5;
    float rightPathBorder = path.x + objectSize*2.5;

    isSharkLeftFromPath = rightSharkBorder < leftPathBorder;
    isSharkRightFromPath = leftSharkBorder > rightPathBorder;
}

// Initializes the shark vectors
void initShark() {
    sharkPosition = initRandomPositionVector();
    sharkVelocity = PVector.random2D();
    sharkVelocity.mult(3);
}

// Initializes the human vectors
void initHuman() {
    humanPosition = new PVector(paths.get(0).x, paths.get(0).y);
    humanVelocity = PVector.random2D();
    humanVelocity.mult(3);
}

// Initializes a Vector with random x & y coordinates
PVector initRandomPositionVector() {
    return new PVector(random(width), random(height));
}
