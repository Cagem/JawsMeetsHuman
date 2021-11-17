ArrayList<PVector> paths = new ArrayList<PVector>();

float getNextPathY(float y) {
    float yLow = y;
    float yHigh = y+objectSize*3;

    return random(yLow, yHigh);
}

float getNextPathX(float x, float xLowest, float xHighest) {
    float xLow = (x-(objectSize*2.5) > xLowest) ? x-(objectSize*2.5) : xLowest;
    float xHigh = (x+(objectSize*2.5) < xHighest) ? x+(objectSize*2.5) : xHighest;

    return random(xLow, xHigh);
}

void initPaths() {
    float yRange = height-(objectSize*3);
    float xLowest = width / 4;
    float xHighest = width-xLowest;
    float x = random(xLowest, xHighest);

    for (float y = 0; y <= yRange+(objectSize*3); y=getNextPathY(y)) {
        x = getNextPathX(x, xLowest, xHighest);
        PVector path = new PVector(x, y);
        paths.add(path);
    }
}

void drawPath(PVector path) {
    rectMode(CENTER);
    noStroke();
	fill(205,133,63);
	rect(path.x, path.y, objectSize*5, objectSize*5);
}

void drawPaths() {
    for (int i = 0; i < paths.size(); i++) {
        drawPath(paths.get(i));
    }
}

PVector getClosestPath(PVector figure) {
    int index = 0;
    float closestDistance = figure.dist(paths.get(0));

    for (int i = index; i < paths.size(); i++) {
        PVector path = paths.get(i);
        float distance = figure.dist(path);
        if (distance < closestDistance) {
            closestDistance = distance;
            index = i;
        }
    }

    return paths.get(index);
}