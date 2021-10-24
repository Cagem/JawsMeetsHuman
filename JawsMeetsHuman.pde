JSONObject shark, human;
int constantMovingSpeed = 3;
int onPressMovingSpeed = 6;
int objectSize = 50;
String[] directions = { "isMovingLeft", "isMovingRight", "isMovingUp", "isMovingDown" };
String[] movingModes = { "constant", "onKeyPress" };
boolean inMenu = true;
boolean inGame = false;
boolean inPause = false; // Only false after initial startup to show rules etc.

void setup() {
  fullScreen();
  initShark();
  initHuman();
}

void draw() {
  if (inMenu) {
    background(100);
    textAlign(CENTER);
    fill(255);
    textSize(80);
    text("JAWS meets human", width/2, height/2.5);
    textSize(20);
    if (!inPause) { // Startup-specific content that is onyl displayed once
      text("Press 'p' to play (or to pause later on)", width/2, height/2);
      text("The rules go like this: …", width/2, height/1.5);
    }
    else {
      text("Press 'p' to play (or to pause later on)", width/2, height/2); // TODO: Hier könnte noch etwas ausgeklügelteres hin
    }
  }

  if (inGame) {
  background(200);

  moveObject(shark);
  moveObject(human);

  drawHuman();
  drawShark();
  }
}

void keyReleased() {
  if (key == CODED && keyCode == LEFT || keyCode == RIGHT || keyCode == UP || keyCode == DOWN) {
    if (shouldMoveOnPress(shark)) {
      setDirection(shark, -1);
    }
  } else if (key == 'a' || key == 'd' || key == 'w' || key == 's') {
    if (shouldMoveOnPress(human)) {
      setDirection(human, -1);
    }
  }
}

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
      inGame = !inGame;
      inMenu = !inMenu;
      inPause = true; // As soon as the player got into the game, there is no need for startup specific options like rules anymore.
      break;
    default:
      break;
    }
  }
}

boolean shouldConstantlyMove(JSONObject o) {
  return o.getInt("movingMode") == 0;
}

boolean shouldMoveOnPress(JSONObject o) {
  return o.getInt("movingMode") == 1;
}

void setDirection(JSONObject o, int direction) {
  o.setInt("direction", direction);
}

JSONObject moveObject(JSONObject o) {
  int speed;
  
  if (shouldConstantlyMove(o)) {
    speed = constantMovingSpeed;
  } else {
    speed = onPressMovingSpeed;
  }
  
  if (o.getInt("direction") != -1) {
    switch(o.getInt("direction")) {
    case 0:
      return moveObjectLeft(o, speed);
    case 1: 
      return moveObjectRight(o, speed);
    case 2: 
      return moveObjectUp(o, speed);
    case 3: 
      return moveObjectDown(o, speed);
    default:
      return o;
    }
  } else return o;
}

JSONObject moveObjectUp(JSONObject o, int speed) {
  int yPosition = o.getInt("yPosition");

  if (yPosition > objectSize) {
    o.setInt("yPosition", yPosition - speed);
  } else {
    o.setInt("direction", 3);
  }

  return o;
}

JSONObject moveObjectDown(JSONObject o, int speed) {
  int yPosition = o.getInt("yPosition");

  if (yPosition < height - objectSize) {
    o.setInt("yPosition", yPosition + speed);
  } else {
    o.setInt("direction", 2);
  }

  return o;
}

JSONObject moveObjectLeft(JSONObject o, int speed) {
  int xPosition = o.getInt("xPosition");

  if (xPosition > objectSize) {
    o.setInt("xPosition", xPosition - speed);
  } else {
    o.setInt("direction", 1);
  }

  return o;
}

JSONObject moveObjectRight(JSONObject o, int speed) {
  int xPosition = o.getInt("xPosition");

  if (xPosition < width - objectSize) {
    o.setInt("xPosition", xPosition + speed);
  } else {
    o.setInt("direction", 0);
  }

  return o;
}

void drawShark() {
  rectMode(CENTER);
  fill(100);
  rect(shark.getInt("xPosition"), shark.getInt("yPosition"), objectSize, objectSize);
}

void drawHuman() {
  rectMode(CENTER);
  fill(229, 198, 163);
  rect(human.getInt("xPosition"), human.getInt("yPosition"), objectSize, objectSize);
  fill(208, 184, 172);
  rect(human.getInt("xPosition"), human.getInt("yPosition"), objectSize-25, objectSize-25);
}

void initShark() {
  shark = initMovableObject(0);
}

void initHuman() {
  human = initMovableObject(1);
}

JSONObject initMovableObject(int movingMode) {
  JSONObject o = new JSONObject();
  int xPosition = int(random(width));
  int yPosition = int(random(height));
  int direction = int(random(directions.length));

  o.setInt("xPosition", xPosition);
  o.setInt("yPosition", yPosition);
  o.setInt("movingMode", movingMode);

  if (movingMode == 0) o.setInt("direction", direction);
  if (movingMode == 1) o.setInt("direction", -1);

  return o;
}
