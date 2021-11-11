ArrayList<PVector> paths = new ArrayList<PVector>();

void initPaths() {
    float yRange = height-(objectSize*2);
    float xLowest = width / 4;
    float xHighest = width-xLowest;
    float xLast = random(xLowest, xHighest);

    for (float i = 0; i <= yRange+(objectSize*4); i+=objectSize*4) {
        float xLow = (xLast-(objectSize*2.5) > xLowest) ? xLast-(objectSize*2.5) : xLowest;
        float xHigh = (xLast+(objectSize*2.5) < xHighest) ? xLast+(objectSize*2.5) : xHighest;

        xLast = random(xLow, xHigh);
        PVector path = new PVector(xLast, i);
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