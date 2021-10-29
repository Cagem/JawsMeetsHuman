// Event that is called when a key is pressed
void keyPressed() {
	if (key == CODED) {
		switch(keyCode) {
		case LEFT:
			setDirection(shark, 0);
			break;
		case RIGHT:
			setDirection(shark, 1);
			break;
		case UP:
			setDirection(shark, 2);
			break;
		case DOWN:
			setDirection(shark, 3);
			break;
		default:
			break;
		}
	} else {
		switch(key) {
		case 'a':
			setDirection(human, 0);
			break;
		case 'd':
			setDirection(human, 1);
			break;
		case 'w':
			setDirection(human, 2);
			break;
		case 's':
			setDirection(human, 3);
			break;
		case 'p': // Press p to play or pause
			setPlayOrPause();
			break;
		default:
			break;
		}
	}
	if (shouldDisplayMenu) {
		switch(key) {
		case '1': // TODO: DRY!
			difficulty = 1;
			shouldDisplayDifficulty = true;
			break;
		case '2':
			difficulty = 2;
			shouldDisplayDifficulty = true;
			break;
		case '3':
			difficulty = 3;
			shouldDisplayDifficulty = true;
			break;
		default:
			break;
		}
	}
}

// Event that is called when a key is released
void keyReleased() {
	if (key == CODED && keyCode == LEFT || keyCode == RIGHT || keyCode == UP || keyCode == DOWN) {
		// When the shark should only move on press, the direction value is here set to -1 so that at the next move-call 
		// the shark will not be moved
		if (shouldMoveOnPress(shark)) {
			setDirection(shark, -1);
		}
	} else if (key == 'a' || key == 'd' || key == 'w' || key == 's') {
		// When the human should only move on press, the direction value is set to -1 so that at the next move-call 
		// the human will not be moved
		if (shouldMoveOnPress(human)) {
			setDirection(human, -1);
		}
	}
}