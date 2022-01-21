// @author Kyra Muhl
// @author Jona König

float pathWidth;
float pathHeight;

ArrayList<Path> paths = new ArrayList<Path>(); // Vector positions of the path tiles
Path lastTile;

float getNextXPathPosition(float last, float pathRadius, float figureRadius) {
  float lowest = last - pathRadius;
  float highest = last + pathRadius;

  float low = (lowest > pathRadius) ? lowest + figureRadius : last;
  float high = (highest < width - pathRadius) ? highest - figureRadius : last;

  return random(low, high);
}

float getNextYPathPosition(float last, float pathRadius, float figureRadius) {
  float lowest = last;
  float highest = last + pathRadius;

  return random(lowest, highest);
}

void initPaths() {
  pathWidth = humanImg.width*0.7; // The path size is cuppled to the relative human figure size.
  pathHeight = humanImg.height*0.7;

  float pathRadius = pathWidth * 5;
  float xLowest = width / 4;
  float xHighest = width - xLowest;
  float xLast = random(xLowest, xHighest);
  float yLast = 0;

  for (float i = 0; i <= height; i = yLast) {
    paths.add(new Path(xLast, yLast, pathRadius, pathRadius));

    float randomFloat = random(0, 1);

    if (randomFloat > 0.35) xLast = getNextXPathPosition(xLast, pathRadius, pathWidth);
    else yLast = getNextYPathPosition(yLast, pathRadius, pathWidth);
  }

  lastTile = paths.get(paths.size()-1); // Create an object for the path's last tile. The human wins if he gets to this tile.
  renderPath(); // Rendering all tiles to a complete path and storing this information in a single image to improve performance.
}

// Function to render all path tiles into one path-image
void renderPath() {
  PGraphics pathCanvas = createGraphics(width, height); // Draw on a new drawing surface so the user cant see it.
  pathCanvas.beginDraw();
  pathCanvas.background(176, 196, 222);
  for (int i = 0; i < paths.size(); i++) {
    pathCanvas.image(pathTileImg, paths.get(i).x, paths.get(i).y, paths.get(i).width, paths.get(i).height);
  }
  pathImg = pathCanvas.get(); // Makes a screenshot of the generated path before any other objects are loaded. Takes place within the first frame of the game view.
  pathCanvas.endDraw();
}

class Path {
  float x;
  float y;
  float width;
  float height;

  public Path(float x, float y, float pathWidth, float pathHeight) {
    this.x = x;
    this.y = y;
    this.width = pathWidth;
    this.height = pathHeight;
  }
}
