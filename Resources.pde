// @author Jona König

// Loading all assets just once instead of per every frame increases the performance dramatically.

PImage pathTileImg;
PImage sharkImg;
PImage humanImg;
PImage bgImage;
PImage cursorImage;

void loadImages() {
    try {
        pathTileImg = loadImage("pathTile.png");
        sharkImg = loadImage("shark.png");
        humanImg = loadImage("human.png");
        bgImage = loadImage("backgroundImg.jpg");
        cursorImage = loadImage("red_dot.png");
    } catch (Exception e) {
        println("One or more images could not be loaded. The game can't be run without them and will quit.");
        println(e.getClass());
        exit();
    }

    bgImage.resize(width, height); // The background image has to be the same size as the program.
    // TODO: resize other images
}