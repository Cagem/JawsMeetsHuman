// @author Jona König

import java.awt.Robot;
import toxi.geom.*;

Robot robot;
Polygon2D upperArea = new Polygon2D();
Polygon2D lowerArea = new Polygon2D();
Polygon2D leftArea = new Polygon2D();
Polygon2D rightArea = new Polygon2D();

float diameterBigCircle;
float diameterSmallCircle;
float splitBigCircle;
float splitSmallCircle;
int cursorRadius;

int[] centerOfControlUI = new int[2];
float[] splitUpRight = new float[4];
float[] splitDownRight = new float[4];
float[] splitUpLeft = new float[4];
float[] splitDownLeft = new float[4];

// This function initializes all variables needed in this page and is necessary, because it uses width and height which only have a value after fullscreen() was executet.
void initSharkOrientationUI() {

  centerOfControlUI[0] = round(0.94 * width); // X
  centerOfControlUI[1] = round(0.1 * height); // Y

  diameterBigCircle = 0.1 * width; // CUSTOMIZE HERE: Changing the factor will adapt all dependencies accordingly.
  if (width/91.4285714 > 28) diameterSmallCircle = 28; // is used because of the static image size of red_dot (32), so it can overlay the default position.
  else diameterSmallCircle = round(width/91.4285714); // is used for responsability so that the game works on small (16:9) screens too.

  if (width/160 > 16) cursorRadius = 16;
  else cursorRadius = width/160; // is used for responsability so that the game works on small (16:9) screens too.

  splitBigCircle = diameterBigCircle / (0.9 * PI); 
  splitSmallCircle = diameterSmallCircle / (0.9 * PI);

  splitUpRight[0] = centerOfControlUI[0] + splitSmallCircle; // X1
  splitUpRight[1] = centerOfControlUI[1] - splitSmallCircle; // Y1
  splitUpRight[2] = centerOfControlUI[0] + splitBigCircle; // X2
  splitUpRight[3] = centerOfControlUI[1] - splitBigCircle; // Y2

  splitDownRight[0] = centerOfControlUI[0] + splitSmallCircle; // X1
  splitDownRight[1] = centerOfControlUI[1] + splitSmallCircle; // Y1
  splitDownRight[2] = centerOfControlUI[0] + splitBigCircle; // X2
  splitDownRight[3] = centerOfControlUI[1] + splitBigCircle; // Y2

  splitUpLeft[0] = centerOfControlUI[0] - splitSmallCircle; // X1
  splitUpLeft[1] = centerOfControlUI[1] - splitSmallCircle; // Y1
  splitUpLeft[2] = centerOfControlUI[0] - splitBigCircle; // X2
  splitUpLeft[3] = centerOfControlUI[1] - splitBigCircle; // Y2

  splitDownLeft[0] = centerOfControlUI[0] - splitSmallCircle; // X1
  splitDownLeft[1] = centerOfControlUI[1] + splitSmallCircle; // Y1
  splitDownLeft[2] = centerOfControlUI[0] - splitBigCircle; // X2
  splitDownLeft[3] = centerOfControlUI[1] + splitBigCircle; // Y2
}

void drawSharkOrientationUI() {

  manipulateCursor();
  drawControlUI();
}

void manipulateCursor() {

  try {
    robot = new Robot();
    robot.mouseMove(centerOfControlUI[0], centerOfControlUI[1]); // Does only work in fullScreen(). Artificial manipulation like size() is not supported.
  } 
  catch(Throwable e) {
    println(e.getMessage());
    exit();
  }

  cursor(cursorImage, cursorRadius, cursorRadius);
}

void drawControlUI() {

  fill(255);
  stroke(0);
  strokeWeight(1);
  circle(centerOfControlUI[0], centerOfControlUI[1], diameterBigCircle); // outer circle
  circle(centerOfControlUI[0], centerOfControlUI[1], diameterSmallCircle); // inner circle
  line(splitUpRight[0], splitUpRight[1], splitUpRight[2], splitUpRight[3]); // splitting UP/RIGHT
  line(splitDownRight[0], splitDownRight[1], splitDownRight[2], splitDownRight[3]); // splitting DOWN/RIGHT
  line(splitUpLeft[0], splitUpLeft[1], splitUpLeft[2], splitUpLeft[3]); // splitting UP/LEFT
  line(splitDownLeft[0], splitDownLeft[1], splitDownLeft[2], splitDownLeft[3]); // splitting DOWN/LEFT
  fill(0);
  textSize(relativeSize("XS"));
  textAlign(CENTER, BASELINE);
  text("UP", (splitUpRight[2]+splitUpLeft[2])/2, (splitUpRight[1]+splitUpRight[3])/2);
  textAlign(CENTER, TOP);
  text("DOWN", (splitDownRight[2]+splitDownLeft[2])/2, (splitDownRight[1]+splitDownRight[3])/2);
  textAlign(LEFT, CENTER);
  text("RIGHT", (splitUpRight[0]+splitUpRight[2])/2, (splitUpRight[3]+splitDownRight[3])/2);
  textAlign(RIGHT, CENTER);
  text("LEFT", (splitUpLeft[0]+splitUpLeft[2])/2, (splitUpLeft[3]+splitDownLeft[3])/2);
}

void initActiveAreas() {

  upperArea.add(new Vec2D(splitUpLeft[2], splitUpLeft[3]));
  upperArea.add(new Vec2D(splitUpRight[2], splitUpRight[3]));
  upperArea.add(new Vec2D(splitUpRight[0], splitUpRight[1]));
  upperArea.add(new Vec2D(splitUpLeft[0], splitUpLeft[1]));

  lowerArea.add(new Vec2D(splitDownLeft[2], splitDownLeft[3]));
  lowerArea.add(new Vec2D(splitDownRight[2], splitDownRight[3]));
  lowerArea.add(new Vec2D(splitDownRight[0], splitDownRight[1]));
  lowerArea.add(new Vec2D(splitDownLeft[0], splitDownLeft[1]));

  leftArea.add(new Vec2D(splitUpLeft[2], splitUpLeft[3]));
  leftArea.add(new Vec2D(splitDownLeft[2], splitDownLeft[3]));
  leftArea.add(new Vec2D(splitDownLeft[0], splitDownLeft[1]));
  leftArea.add(new Vec2D(splitUpLeft[0], splitUpLeft[1]));

  rightArea.add(new Vec2D(splitUpRight[2], splitUpRight[3]));
  rightArea.add(new Vec2D(splitDownRight[2], splitDownRight[3]));
  rightArea.add(new Vec2D(splitDownRight[0], splitDownRight[1]));
  rightArea.add(new Vec2D(splitUpRight[0], splitUpRight[1]));
}

String checkMousePosition() {

  String setOrientation = "NO_CHANGE";

  if (upperArea.containsPoint(new Vec2D(mouseX, mouseY))) {
    setOrientation = "UP";
  } else if (lowerArea.containsPoint(new Vec2D(mouseX, mouseY))) { 
    setOrientation = "DOWN";
  } else if (rightArea.containsPoint(new Vec2D(mouseX, mouseY))) {
    setOrientation = "RIGHT";
  } else if (leftArea.containsPoint(new Vec2D(mouseX, mouseY))) {
    setOrientation = "LEFT";
  }

  return setOrientation;
}
