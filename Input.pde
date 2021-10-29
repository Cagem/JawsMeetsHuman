// Event that is called when a key is pressed
void keyPressed() {
	if (key == CODED) {
		handleArrowKeysPressed();
	} else {
		handleLetterKeysPressed();
	}
	if (shouldDisplayMenu) {
		handleDifficultyKeysPressed();
	}
}

void handleArrowKeysPressed() {
    boolean eingabe = false;
	float x = 0;
	float y = 0;

    switch(keyCode) {
    case LEFT:
        x--;
		eingabe = true;
        break;
    case RIGHT:
        x++;
		eingabe = true;
        break;
    case UP:
        y--;
		eingabe = true;
        break;
    case DOWN:
        y++;
		eingabe = true;
        break;
    default:
        break;
    }

    if (eingabe) {
        sharkVelocity.x = x;
	    sharkVelocity.y = y;

        if (currentSharkSpeed < maxConstantMovingSpeed) {
            currentSharkSpeed += acceleration;
        }
        
        sharkPosition.add(sharkVelocity.mult(currentSharkSpeed));
    }
}

void handleLetterKeysPressed() {
    boolean eingabe = false;
	float x = 0;
	float y = 0;

    switch(key) {
    case 'a':
        x--;
		eingabe = true;
        break;
    case 'd':
        x++;
		eingabe = true;
        break;
    case 'w':
        y--;
		eingabe = true;
        break;
    case 's':
        y++;
		eingabe = true;
        break;
    case 'p': // Press p to play or pause
        setPlayOrPause();
        break;
    default:
        break;
    }

    if (eingabe) {
        humanVelocity.x = x;
	    humanVelocity.y = y;

        if (currentHumanSpeed < maxOnPressMovingSpeed) {
            currentHumanSpeed += acceleration;
        }
        
        humanPosition.add(humanVelocity.mult(currentHumanSpeed));
        shouldHumanMove = true;
    }
}

void handleDifficultyKeysPressed() {
    switch(key) {
    case '1': // TODO: DRY!
        setDifficulty(1);
        break;
    case '2':
        setDifficulty(2);
        break;
    case '3':
        setDifficulty(3);
        break;
    default:
        break;
    }
}

// Event that is called when a key is released
void keyReleased() {
	if (key == CODED && keyCode == LEFT || keyCode == RIGHT || keyCode == UP || keyCode == DOWN) {
		// When the shark should only move on press, the direction value is here set to -1 so that at the next move-call 
		// the shark will not be moved
		if (!shouldSharkMove) {
            currentSharkSpeed = 0;
		}
	} else if (key == 'a' || key == 'd' || key == 'w' || key == 's') {
		// When the human should only move on press, the direction value is set to -1 so that at the next move-call 
		// the human will not be moved
        shouldHumanMove = false;
	}
}