// Event that is called when any key is pressed
void keyPressed() {
    if (key == CODED) { // Handles specifically arrow keys
        handleArrowKeysPressed();
    } else { // Handles any other key
        handleKeysPressed();
    }
    if (displayMenu) {
        handleDifficultyKeysPressed();
    }
    if (deathScreen){
        handleRestartKey();
    }
}

void handleArrowKeysPressed() {
    boolean hasPressedArrowKey = false;
    
    switch(keyCode) {
        case LEFT:
            sharkVelocity.x = -1;
            sharkVelocity.y = 0;
            hasPressedArrowKey = true;
            break;
        case RIGHT:
            sharkVelocity.x = 1;
            sharkVelocity.y = 0;
            hasPressedArrowKey = true;
            break;
        case UP:
            sharkVelocity.x = 0;
            sharkVelocity.y = -1;
            hasPressedArrowKey = true;
            break;
        case DOWN:
            sharkVelocity.x = 0;
            sharkVelocity.y = 1;
            hasPressedArrowKey = true;
            break;
        default:
        break;
    }
    
    if (hasPressedArrowKey) {        
        increaseSharkSpeed();
        moveVectorObject(sharkPosition, sharkVelocity.mult(currentSharkSpeed));
    }
}

void handleKeysPressed() {
    boolean hasPressedWASDKey = false;
    
    switch(key) {
        case 'a':
            humanVelocity.x = -0.5;
            humanVelocity.y = 0;
            hasPressedWASDKey = true;
            break;
        case 'd':
            humanVelocity.x = 0.5;
            humanVelocity.y = 0;
            hasPressedWASDKey = true;
            break;
        case 'w':
            humanVelocity.x = 0;
            humanVelocity.y = -0.5;
            hasPressedWASDKey = true;
            break;
        case 's':
            humanVelocity.x = 0;
            humanVelocity.y = 0.5;
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
        moveVectorObject(humanPosition, humanVelocity.mult(currentHumanSpeed));
        shouldHumanMove = true;
    }
}

void handleDifficultyKeysPressed() {
    switch(key) {
        case'1' : // TODO: DRY!
        setDifficulty(1);
        break;
        case'2':
        setDifficulty(2);
        break;
        case'3':
        setDifficulty(3);
        break;
        default:
        break;
    }
}

// Event that is called when a key is released
void keyReleased() {
    if (keyPressed == false || key == 'a' || key == 'd' || key == 'w' || key ==  's') {
        shouldHumanMove = false;
    }
    
    switch(key) {
        case 'a':
            humanVelocity.x = 0;
            break;
        case 'd':
            humanVelocity.x = 0;
            break;
        case 'w':
            humanVelocity.y = 0;
            break;
        case 's':
            humanVelocity.y = 0;
            break;
        default:
        break;
    }
}

void handleRestartKey (){

    switch(key) {
        case'r' :

        deathScreen = false;
        currentLifes = lifes.length;
        sharkRespawn();

        for(int i = 0; i < lifes.length; i++){
            lifes[i]=true;
        } 
        


        break;
        
    }
}