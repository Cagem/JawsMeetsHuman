// @author Kyra Muhl
// @author Jona König
// @author Luca Virnich

void setup() {
  fullScreen(); // Initializes the screen as fullscreen

  loadImages(); // Loads images just once, IMPORTANT - Has to stay up top beneath fullScreen() to get width and height and exit the game if assets are missing.
  loadHighscore(); // Loads the Highscores from Highscores.txt
  initPaths(); // Initializes the path vectors, IMPORTANT - needs to be executed first, before any other element of the game view.
  initShark(); // Initializes the shark vectors
  initHuman(); // Initializes the human vectors
  initSharkOrientationUI(); // IMPORTANT: Needs to stay above initActiveAreas(); 
  initActiveAreas(); // These are used to control where the cursor is. This information is used for drawSharkOrientationUI();
  initLifes(); // Used to set all lifes to true
  initThemeSound(); // Initializes the background music
  
  frameRate(60); // IMPORTANT - needs to stay at 60! Is utilized for measurements of time.
}

// Function to draw on screen in loop
void draw() {
  if (displayMenu) {
    displayMenu();
    noCursor();
  } else if (gameOver) {
    drawMenuScreen("The shark won!", "Hit 'r' to restart, 'h' to save your score or esc to exit");
  } else if (victory) {
    drawMenuScreen("The human won!", "Hit 'r' to restart, 'h' to save your score or esc to exit");
  } else {
    updateTimer();
    drawGameObjects();
    drawSharkOrientationUI(); // controls the sharks orientation by mouse position
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
  checkPathCollisionHuman();
  checkPathCollisionSkark();
  checkFigureCollision();
}

void drawGameObjects() {
  background(pathImg);
  drawHuman();
  drawShark();
  drawLifes();
  drawTimer();
}

void updateTimer() {
  if (shark.isJumping) {
    setJumpingTimer();
  } else if (!shark.isAllowedToJump) {
    setBlockedJumpTimer();
  }
}

float relativeSize(String size) {
  // XL -> Global relative fontsize for TITLES
  // M -> Global relative fontsize for REGULAR TEXT
  // S -> Global relative fontsize for DESCRIPTIVE TEXT

  float relativeSize = 0.1;

  if (size == "XL")relativeSize = width / 20;
  else if (size =="M") relativeSize = width / 80;
  else if (size =="S") relativeSize = width / 90;
  else if (size =="XS") relativeSize = width / 110;
  else println("ERROR: function relativeSize() got an undefined paramenter.");

  return(relativeSize);
}
