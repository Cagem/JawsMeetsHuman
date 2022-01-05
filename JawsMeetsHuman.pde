// Function to initialize screen (and try to improve the framerate)
// void settings() {
//     try {
//         fullScreen(P2D);
//         MIND: There are known issues combining a cursor image with P2D/P3D and/or fullscreen();
//         smooth(4); // problem with text in pause screen after ~2 seconds.
//     } catch (Throwable e) {
//         fullScreen(JAVA2D);
//         smooth(8); // no smooth right now
//         println("Special graphics for computers which dont support OpenGL Graphics activated.");
//     }
// }

void setup() {
    fullScreen(); // Initializes the screen as fullscreen

    initPaths(); // Initializes the path vectors
    initShark(); // Initializes the shark vectors
    initHuman(); // Initializes the human vectors
    initBackgroundImage(); // Initializes the menu screen
    initSharkOrientationControl(); // IMPORTANT: Needs to stay above initActiveAreas(); 
    initActiveAreas(); // These are used to control where the cursor is. This information is used for sharkOrientation();
    initLifes(); //used to set all lifes to true
    initThemeSound(); // Initializes the background music
    
    frameRate(60); // IMPORTANT - needs to stay at 60! Is utilized for measurements of time.
}

// Function to draw on screen in loop
void draw() {
  if (displayMenu) {
    displayMenu();
    noCursor();
  } else if (deathScreen) {
    drawDeathScreen();
  } else {
    if (displayDifficulty) displayDifficulty = false;
    updateTimer();

    background(176, 196, 222);
    drawGameObjects();
    sharkOrientation(); // controls the sharks orientation by mouse position
    checkBoundaries();
    moveGameObjects();
  }
  showThemeSongPopup(); // Shows current state of the background music (play/pause/amplitude)
}

void moveGameObjects() {
  moveVectorObject(shark.position, shark.velocity);
  if (shouldHumanMove) moveVectorObject(humanPosition, humanVelocity);
}

void checkBoundaries() {
  checkBoundaryCollision(shark.position, shark.velocity, shark.width, shark.height); // Checks if the shark collides with screen border
  checkBoundaryCollision(humanPosition, humanVelocity, humanWidth, humanHeight); // Checks if the human collides with screen border
  checkPathCollision();
  checkFigureCollision();
}

void drawGameObjects() {
  drawPaths(); // Draws the path
  drawHuman(); // Draws the human
  drawShark(); // Draws the shark
  drawLifes(); // Draws the Hearts/Lifes
  drawTimer(); // Draws the timer
}

void updateTimer() {
  if (shark.isJumping) {
    setJumpingTimer();
  } else if (!shark.isAllowedToJump) {
    setBlockedJumpTimer();
  }
}

float relativeSize(String size) {
  //XL -> Global relative fontsize for TITLES
  //M -> Global relative fontsize for REGULAR TEXT
  //S -> Global relative fontsize for DESCRIPTIVE TEXT

  float relativeSize = 0.1;

  if (size == "XL")relativeSize = width / 20;
  else if (size =="M") relativeSize = width / 80;
  else if (size =="S") relativeSize = width / 90;
  else println("ERROR: function relativeSize() got an undefined paramenter.");

  return(relativeSize);
}
