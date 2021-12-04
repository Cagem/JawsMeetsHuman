import java.awt.Robot;
Robot robot;

import toxi.geom.*;
Polygon2D upperArea = new Polygon2D();
Polygon2D lowerArea = new Polygon2D();
Polygon2D leftArea = new Polygon2D();
Polygon2D rightArea = new Polygon2D();

PImage cursorImage;

float diameterBigCircle;
int diameterSmallCircle;
float splitBigCircle;
float splitSmallCircle;

int[] centerOfControlUI = new int[2];
float[] splitUpRight = new float[4];
float[] splitDownRight = new float[4];
float[] splitUpLeft = new float[4];
float[] splitDownLeft = new float[4];

// This function initializes all variables needed in this page and is necessary, because it uses width and height which only have a value after fullscreen() was executet.
void initSharkOrientationControl() {

centerOfControlUI[0] = round(0.94 * width); // X
centerOfControlUI[1] = round(0.1 * height); // Y

diameterBigCircle = 0.1 * width; // CUSTOMIZE HERE: Changing the factor will adapt all dependencies accordingly.
diameterSmallCircle = 28; // IMPORTANT, don't change: 28 is used because of the static image size of red_dot, so it can overlay the default position.
splitBigCircle = diameterBigCircle / (0.9 * PI); // 0.0354 * width 
splitSmallCircle = diameterSmallCircle / (0.9 * PI); // 9.899 

splitUpRight[0] = centerOfControlUI[0] + splitSmallCircle; // X1
splitUpRight[1] = centerOfControlUI[1] - splitSmallCircle; // Y1
splitUpRight[2] = centerOfControlUI[0] + splitBigCircle; // X2
splitUpRight[3] = centerOfControlUI[1] - splitBigCircle; // Y2

splitDownRight[0] = centerOfControlUI[0] + splitSmallCircle; // X1
splitDownRight[1] = centerOfControlUI[1] + splitSmallCircle; // Y1
splitDownRight[2] = centerOfControlUI[0] + splitBigCircle; // X2
splitDownRight[3] = centerOfControlUI[1] + splitBigCircle; // Y2

splitUpLeft[0] = centerOfControlUI[0] - splitSmallCircle; // X1
splitUpLeft[1] = centerOfControlUI[1] + splitSmallCircle; // Y1
splitUpLeft[2] = centerOfControlUI[0] - splitBigCircle; // X2
splitUpLeft[3] = centerOfControlUI[1] + splitBigCircle; // Y2

splitDownLeft[0] = centerOfControlUI[0] - splitSmallCircle; // X1
splitDownLeft[1] = centerOfControlUI[1] - splitSmallCircle; // Y1
splitDownLeft[2] = centerOfControlUI[0] - splitBigCircle; // X2
splitDownLeft[3] = centerOfControlUI[1] - splitBigCircle; // Y2
}

void sharkOrientation() {
    
    manipulateCursor();
    drawControlUI();
    
    if (checkMousePosition() == "UP") {
        // transform shark's orientation
        println("The shark heads " + checkMousePosition());
    } else if (checkMousePosition() == "DOWN") {
        // transform shark's orientation
        println("The shark heads " + checkMousePosition());
    } else if (checkMousePosition() == "LEFT") {
        // transform shark's orientation
        println("The shark heads " + checkMousePosition());
    } else if (checkMousePosition() == "RIGHT") {
        // transform shark's orientation
        println("The shark heads " + checkMousePosition());
    }
}

void manipulateCursor() {
    
    try {
        robot = new Robot();
        robot.mouseMove(centerOfControlUI[0], centerOfControlUI[1]);
    } 
    catch(Throwable e) {
        println("jawa.awt.Robot: Exception cought");
    }
    
    cursorImage = loadImage("red_dot.png");
    cursor(cursorImage, 16, 16); 
}

void drawControlUI() {
    
    fill(255);
    stroke(0);
    strokeWeight(1);
    circle(centerOfControlUI[0], centerOfControlUI[1], diameterBigCircle);
    line(splitUpRight[0], splitUpRight[1], splitUpRight[2], splitUpRight[3]); // splitting UP/RIGHT
    line(splitDownRight[0], splitDownRight[1], splitDownRight[2], splitDownRight[3]); // splitting DOWN/RIGHT
    line(splitUpLeft[0], splitUpLeft[1], splitUpLeft[2], splitUpLeft[3]); // splitting UP/LEFT
    line(splitDownLeft[0], splitDownLeft[1], splitDownLeft[2], splitDownLeft[3]); // splitting DOWN/LEFT
    // TODO: display text (UP, DOWN, LEFT, RIGHT)
    circle(centerOfControlUI[0], centerOfControlUI[1], diameterSmallCircle); 
}

void initActiveAreas() {
    
    upperArea.add(new Vec2D(10,0));
    upperArea.add(new Vec2D(100,50));
    upperArea.add(new Vec2D(110,80));
    upperArea.add(new Vec2D(40,100));
    
    lowerArea.add(new Vec2D(10,0));
    lowerArea.add(new Vec2D(100,50));
    lowerArea.add(new Vec2D(110,80));
    lowerArea.add(new Vec2D(40,100));
    
    leftArea.add(new Vec2D(10,0));
    leftArea.add(new Vec2D(100,50));
    leftArea.add(new Vec2D(110,80));
    leftArea.add(new Vec2D(40,100));
    
    rightArea.add(new Vec2D(10,0));
    rightArea.add(new Vec2D(100,50));
    rightArea.add(new Vec2D(110,80));
    rightArea.add(new Vec2D(40,100));
}

String checkMousePosition() {
    
    String setOrientation = "";
    
    if (upperArea.containsPoint(new Vec2D(mouseX,mouseY))) {
        setOrientation = "UP";
    } else if (lowerArea.containsPoint(new Vec2D(mouseX,mouseY))) { 
        setOrientation = "DOWN";
    } else if (rightArea.containsPoint(new Vec2D(mouseX,mouseY))) {
        setOrientation = "RIGHT";
    } else if (leftArea.containsPoint(new Vec2D(mouseX,mouseY))) {
        setOrientation = "LEFT";
    } 
    
    return setOrientation;
}