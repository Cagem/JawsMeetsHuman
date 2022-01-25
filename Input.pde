// @author Kyra Muhl

// Event that is called when any key is pressed
void keyPressed() {
  if (key == ENTER || key == RETURN) {
    if (shark.isAllowedToJump) {
      shark.setIsJumping(true);
      shark.setIsAllowedToJump(false);
    }
  } else if (key == CODED) { // Handles specifically arrow keys
    handleArrowKeysPressed();
  } else { // Handles any other key
    handleKeysPressed();
  }
  if (displayMenu) {
    handleDifficultyKeysPressed();
  }
  if (gameOver || victory) {
    handleRestartKey();
  }
}

void handleArrowKeysPressed() {
  boolean hasPressedArrowKey = false;

  switch(keyCode) {
  case LEFT:
    shark.velocity.x = -1;
    shark.velocity.y = 0;
    hasPressedArrowKey = true;
    break;
  case RIGHT:
    shark.velocity.x = 1;
    shark.velocity.y = 0;
    hasPressedArrowKey = true;
    break;
  case UP:
    shark.velocity.x = 0;
    shark.velocity.y = -1;
    hasPressedArrowKey = true;
    break;
  case DOWN:
    shark.velocity.x = 0;
    shark.velocity.y = 1;
    hasPressedArrowKey = true;
    break;
  default:
    break;
  }

  if (hasPressedArrowKey) {
    increaseSharkSpeed();
    moveVectorObject(shark.position, shark.velocity.mult(shark.currentSpeed));
    shark.increaseTimeDelta();
  }
}

void handleKeysPressed() {
  boolean hasPressedWASDKey = false;

  switch(key) {
  case 'a':
    human.velocity.x = -0.5;
    human.velocity.y = 0;
    hasPressedWASDKey = true;
    break;
  case 'd':
    human.velocity.x = 0.5;
    human.velocity.y = 0;
    hasPressedWASDKey = true;
    break;
  case 'w':
    human.velocity.x = 0;
    human.velocity.y = -0.5;
    hasPressedWASDKey = true;
    break;
  case 's':
    human.velocity.x = 0;
    human.velocity.y = 0.5;
    hasPressedWASDKey = true;
    break;
  case 'm':
    playOrPauseThemeSong();
    break;
  case 'p' : // Press p to play or pause
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

  if (hasPressedWASDKey) {
    increaseHumanSpeed();
    human.velocity.mult(human.currentSpeed);
    human.increaseTimeDelta();
  }
}

void handleDifficultyKeysPressed() {
  switch(key) {
  case'1' :
    setDifficulty(10, 1);
    break;
  case'2':
    setDifficulty(100, 2);
    break;
  case'3':
    setDifficulty(1000, 3);
    break;
  default:
    break;
  }
}

// Event that is called when a key is released
void keyReleased() {
  if (keyCode == LEFT || keyCode == RIGHT) {
    shark.resetTimeDelta();
    if (shark.velocity.x != 0) {
      shark.velocity.x = shark.velocity.x / abs(shark.velocity.x);
      shark.setCurrentSpeed(shark.standardSpeed);
    }
  }
  if (keyCode == UP || keyCode == DOWN) {
    shark.resetTimeDelta();
    if (shark.velocity.y != 0) {
      shark.velocity.y = shark.velocity.y / abs(shark.velocity.y);
      shark.setCurrentSpeed(shark.standardSpeed);
    }
  }

  if (key == 'a' || key == 'd' || key == 'w' || key == 's') {
    human.setCurrentSpeed(human.standardSpeed);
    human.resetTimeDelta();

    if (key == 'a' || key == 'd') {
      human.velocity.x = 0;
    }
    if (key == 'w' || key == 's') {
      human.velocity.y = 0;
    }
  }
}

boolean pressableH = true; // will be false if 'h' was pressed so the highscore.txt can't be spammed.

void handleRestartKey() {
  switch(key) {
  case 'r' :
    gameOver = false;
    victory = false;
    currentLifes = lifes.length;
    for (int i = 0; i < lifes.length; i++) {
      lifes[i] = true;
    } 
    shark.respawn();
    human.respawn();
    timerSeconds = 0;
    timerSecondsINT = 0; 
    timerMinutes = 0;
    timerHours = 0;
    pressableH = true;
    break;
  case 'h':
    if (pressableH) {
      setNewHighscore();
      saveHighscore();
      setPopup("Score saved");
      pressableH = false;
    } else setPopup("You already saved your score");
    break;
  }
}
