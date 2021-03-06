// @author Jona König

// Loading all assets just once instead of every frame increases the performance dramatically.
PImage pathTileImg;
PImage pathImg; // Will be used later on in Path.pde > renderPath function.
PImage goalImg;
PImage lifePreserverImg;
PImage rubberRingImg;
PImage sharkImg;
PImage humanImg;
PImage backgroundImg;
PImage cursorImg;
PImage canvasImg; // Will be used later on in GameMenu.pde > drawMenuScreen functions.

void loadImages() {
  try {
    pathTileImg = loadImage("pathTile.png");
    goalImg = loadImage("goalFlag.png");
    lifePreserverImg = loadImage("lifePreserver.png");
    rubberRingImg = loadImage("rubberRing.png");
    sharkImg = loadImage("shark.png");
    humanImg = loadImage("human.png");
    backgroundImg = loadImage("backgroundImg.jpg");
    cursorImg = loadImage("red_dot.png"); // Size will be determinated in SharkOrientationControl.pde since the image is so small.
  } 
  catch (Exception e) {
    println("One or more images could not be loaded. The game can't be run without them and will quit.");
    println(e.getClass());
    exit();
  }

  sharkImg.resize(int(width/22.65), int(height/28.24));
  humanImg.resize(int(width/106.66), int(height/24));
  cursorImg.resize(int(width*0.015), int(width*0.015)); // X and Y need to be the same, since the image is a circle.
  backgroundImg.resize(width, height); // The background image has to be the same size as the program.
}
