// @author Kyra Muhl

float pathWidth = 15; // TODO: must be change to a relative value after those values are reachable (eg. humanImg.width or width), but watch out! Can lead to great performance loss!

ArrayList<Path> paths = new ArrayList<Path>(); // Vector positions of the path tiles

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
  float pathRadius = pathWidth * 5;
  float xLowest = width / 4;
  float xHighest = width - xLowest;
  float xLast = random(xLowest, xHighest);
  float yLast = 0;

  for (float i = 0; i <= height; i = yLast) {
    paths.add(new Path(xLast, yLast, pathRadius, pathRadius));

    float randomFloat = random(0, 1);

    if (randomFloat > 0.35) xLast = getNextXPathPosition(xLast, pathRadius, pathWidth * 2);
    else yLast = getNextYPathPosition(yLast, pathRadius, pathWidth * 2);
  }
}

// Function to draw the path at given coordinates
void drawPathImg(Path path) {
  image(pathTileImg, path.x, path.y, path.width, path.height);
}

// Function to draw all path tiles
void drawPaths() {
  for (int i = 0; i < paths.size(); i++) {
    drawPathImg(paths.get(i));
  }
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