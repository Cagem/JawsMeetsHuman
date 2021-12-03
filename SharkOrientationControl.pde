import java.awt.Robot;

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
    circle(centerOfControlUI[0], centerOfControlUI[1], 0.025 * width);
}

String checkMousePosition() {
    
    String setOrientation = "";
    
    if (mouseY < centerOfControlUI[1] && 
        mouseX < centerOfControlUI[0] + 16 && // right site of presented triangle 
        mouseX > centerOfControlUI[0] - 16) { // left site of presented triangle
        setOrientation = "UP";
    } else if (mouseY > centerOfControlUI[1] && 
               mouseX < centerOfControlUI[0] + 16 && // right site of presented triangle 
               mouseX > centerOfControlUI[0] - 16) { // left site of presented triangle
        setOrientation = "DOWN";
    } else if (mouseX > centerOfControlUI[0] && 
               mouseY < centerOfControlUI[1] + 16 &&  
               mouseY > centerOfControlUI[1] - 16) {
        setOrientation = "RIGHT";
    } else if (mouseX < centerOfControlUI[0] && 
               mouseY < centerOfControlUI[1] + 16 &&  
               mouseY > centerOfControlUI[1] - 16) {
        setOrientation = "LEFT";
    } 
    
    return setOrientation;
}