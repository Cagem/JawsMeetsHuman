// @author Kyra Muhl
// renderPath() by @author Jona König

float pathWidth;
float pathHeight;

ArrayList<Path> paths = new ArrayList<Path>(); // Vector positions of the path tiles.

// Returns a random path position depending only on the last position and path radius.
float getRandomPathPosition(float last, float pathRadius) {
  float lowest = last;
  float highest = last + pathRadius;

  return random(lowest, highest);
}

// Overloading: returns a random path position depending on the last position, path radius & figure radius.
float getRandomPathPosition(float last, float pathRadius, float figureRadius) {
  float lowest = last - pathRadius;
  float highest = last + pathRadius;

  float low = (lowest > pathRadius) ? lowest + figureRadius : last;
  float high = (highest < width - pathRadius) ? highest - figureRadius : last;

  return random(low, high);
}

// Initialize the paths array.
void initPaths() {
  pathWidth = humanImg.width*0.7; // The path size is cuppled to the relative human figure size.
  pathHeight = humanImg.height*0.7;

  float pathDiameter = pathWidth * 5;

  float xLowest = width / 3;
  float xHighest = width - xLowest;
  float xLast = random(xLowest, xHighest);
  float yLast = 0;

  for (float i = 0; i <= height-pathDiameter; i = yLast) {
    paths.add(new Path(xLast, yLast, pathDiameter, pathDiameter));

    float probability = random(0, 1);

    if (probability > 0.25) xLast = getRandomPathPosition(xLast, pathDiameter, pathWidth);
    else yLast = getRandomPathPosition(yLast, pathDiameter);
  }

  paths.add(new Path(xLast, height-pathDiameter, pathDiameter, pathDiameter));

  renderPath(); // Rendering all tiles to a complete path and storing this information in a single image to improve performance.
}

// Function to render all path tiles into one path-image.
void renderPath() {
  PGraphics pathCanvas = createGraphics(width, height); // Draw on a new drawing surface so the user cant see it.
  pathCanvas.beginDraw();
  pathCanvas.background(176, 196, 222);
  for (int i = 0; i < paths.size(); i++) {
    pathCanvas.image(pathTileImg, paths.get(i).x, paths.get(i).y, paths.get(i).width, paths.get(i).height);
  }
  Path lastTile = paths.get(paths.size()-1);
  pathCanvas.image(goalImg, lastTile.x, lastTile.y, lastTile.width*0.7, lastTile.height*0.7);
  pathImg = pathCanvas.get(); // Makes a screenshot of the generated path before any other objects are loaded. Takes place within the first frame of the game view.
  pathCanvas.endDraw();
}

// Class for creating Path Objects.
class Path {
  float x;
  float y;
  float width;
  float height;

  // Constructor that is being called while creating a new Path Object.
  public Path(float x, float y, float pathWidth, float pathHeight) {
    this.x = x;
    this.y = y;
    this.width = pathWidth;
    this.height = pathHeight;
  }
}
