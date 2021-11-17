// Event that is called when a key is pressed
void keyPressed() {
  if (key == CODED) {
    handleArrowKeysPressed();
  } else {
    handleKeysPressed();
  }
  if (displayMenu) {
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

void handleKeysPressed() {
  boolean eingabe = false;
  float x = 0;
  float y = 0;

  switch(key) {
  case ENTER:
    isSharkJumping = true;
    break;
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
  case 'm':
    playOrPauseThemeSong();
    break;
  case 'p': // Press p to play or pause
    setPlayOrPause();
    break;
 case '4':
    decreaseThemeVolume();
    break;
  case '5':
    increaseThemeVolume();
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
	if (key == 'a' || key == 'd' || key == 'w' || key == 's') {
        shouldHumanMove = false;
	}
}