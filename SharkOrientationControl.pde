import java.awt.Robot;
import toxi.geom.*;

Polygon2D upperArea = new Polygon2D();
Polygon2D lowerArea = new Polygon2D();
Polygon2D leftArea = new Polygon2D();
Polygon2D rightArea = new Polygon2D();
Robot robot;
int[] centerOfControlUI = new int[2]; // X, Y Coordinates
PImage cursorImage;

void sharkOrientation() {
    
    centerOfControlUI[0] = round(0.94 * width); // X
    centerOfControlUI[1] = round(0.1 * height); // Y
    
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
        robot.mouseMove(centerOfControlUI[0], centerOfControlUI[1]); // noch falsche Position
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
    circle(centerOfControlUI[0], centerOfControlUI[1], 0.1 * width);
    // draw lines
    // write: UP, DOWN, LEFT, RIGHT
    circle(centerOfControlUI[0], centerOfControlUI[1], 28); // 28 is used because of the static image size of red_dot, so it can overlay the default position.
}

void initActiveAreas() { // TODO: set correct X and Y and link them to the UI with Variables.
    
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