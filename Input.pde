// @author Kyra Muhl

boolean isKeyHDisabled = false; // will be false if 'h' was pressed so the highscore.txt can't be spammed.

// Event that is called when any key is pressed
void keyPressed() {
  if (key == ENTER || key == RETURN) {
    if (shark.isAllowedToJump) {
      shark.jump();
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
    handleGameOverKeys();
  }
}

void handleArrowKeysPressed() {
  switch(keyCode) {
  case LEFT:
    shark.changeVelocity(-1, 0, difficulty);
    break;
  case RIGHT:
    shark.changeVelocity(1, 0, difficulty);
    break;
  case UP:
    shark.changeVelocity(0, -1, difficulty);
    break;
  case DOWN:
    shark.changeVelocity(0, 1, difficulty);
    break;
  default:
    break;
  }
}

void handleKeysPressed() {
  switch(key) {
  case 'a':
    human.changeVelocity(-0.5, 0, difficulty);
    break;
  case 'd':
    human.changeVelocity(0.5, 0, difficulty);
    break;
  case 'w':
    human.changeVelocity(0, -0.5, difficulty);
    break;
  case 's':
    human.changeVelocity(0, 0.5, difficulty);
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
}

void handleDifficultyKeysPressed() {
  switch(key) {
  case'1' :
    setDifficulty(10, 1);
    break;
  case'2':
    setDifficulty(12.5, 2);
    break;
  case'3':
    setDifficulty(15, 3);
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

void handleGameOverKeys() {
  switch(key) {
  case 'r' :
    handleRestartKey();
    break;
  case 'h':
    handleHighScoreKey();
    break;
  }
}

void handleRestartKey() {
  gameOver = false;
  victory = false;
  currentLifes = lifes.length;
  for (int i = 0; i < lifes.length; i++) {
    lifes[i] = true;
  } 
  shark.respawn(width, height);
  human.respawn();
  timerSeconds = 0;
  timerSecondsINT = 0; 
  timerMinutes = 0;
  timerHours = 0;
  isKeyHDisabled = false;
}

void handleHighScoreKey() {
  if (!isKeyHDisabled) {
    setNewHighscore();
    saveHighscore();
    setPopup("Score saved");
    isKeyHDisabled = true;
  } else setPopup("You already saved your score");
}
