ArrayList<PVector> paths = new ArrayList<PVector>(); // Vector positions of the path tiles

float getNextPathY(float y) {
    float yLow = y;
    float yHigh = y + objectSize * 3;
    
    return random(yLow, yHigh);
}

float getNextPathX(float x, float xLowest, float xHighest) {
    float xLow = (x - (objectSize * 2.5) > xLowest) ? x - (objectSize * 2.5) : xLowest;
    float xHigh = (x + (objectSize * 2.5) < xHighest) ? x + (objectSize * 2.5) : xHighest;
    
    return random(xLow, xHigh);
}

void initPaths() {
    float yRange = height - (objectSize * 3);
    float xLowest = width / 4;
    float xHighest = width - xLowest;
    float x = random(xLowest, xHighest);
    
    for (float y = 0; y <= yRange + (objectSize * 3); y = getNextPathY(y)) {
        x = getNextPathX(x, xLowest, xHighest);
        PVector path = new PVector(x, y);
        paths.add(path);
    }
    }
        
        // Function to draw the path at given coordinates
       void drawPath(PVector path) {
            PImage img = loadImage("pathTile.png");
            imageMode(CENTER);
            image(img, path.x, path.y, objectSize * 5, objectSize * 5);
        }
            
            // Function to draw all path tiles
           void drawPaths() {
               for (int i =0; i < paths.size(); i++) {
                    drawPath(paths.get(i));
                    <<<<<<< HEAD
                }
            }
                
                PVector getClosestPath(PVector figure, PVector velocity) {
                    int index = -1;
                    float closestDistance = figure.dist(paths.get(0));
                    
                    boolean isLookingUp = velocity.y < 0;
                    boolean isLookingDown = velocity.y > 0;
                    boolean isLookingLeft = velocity.x < 0;
                    boolean isLookingRight = velocity.x > 0;
                    
                    float[] xFigureBorders = {figure.x - objectSize, figure.x + objectSize};
                    float[] yFigureBorders = {figure.y - objectSize, figure.y + objectSize};
                    
                  for (int i = 0; i < paths.size(); i++) {
                       PVector path = paths.get(i);
                        
                        float[] xPathBorders = {path.x - objectSize * 2.5, path.x + objectSize * 2.5};
                        float[] yPathBorders = {path.y - objectSize * 2.5, path.y + objectSize * 2.5};
                        
                        if (isLookingUp){
                            if (xFigureBorders[0] < xPathBorders[1] || xFigureBorders[1] > xPathBorders[0]) {
                                if (yPathBorders[1] < yFigureBorders[0]) {
                                    float distance =figure.dist(path);
                                   if (distance < closestDistance) {
                                        closestDistance = distance;
                                        index = i;
                                    }
                                } 
                            }
                        }
                        if (isLookingDown) {
                            if (xFigureBorders[0] < xPathBorders[1] || xFigureBorders[1] > xPathBorders[0]) {
                                if (yPathBorders[0] > yFigureBorders[1]) {
                                    float distance =figure.dist(path);
                                   if (distance < closestDistance) {
                                        closestDistance = distance;
                                        index = i;
                                    }
                                } 
                            }
                        }
                        if (isLookingLeft) {
                            if (yFigureBorders[0] > yPathBorders[1] || yFigureBorders[1] < yPathBorders[0]) {
                                if (xPathBorders[1] < xFigureBorders[0]) {
                                    float distance =figure.dist(path);
                                   if (distance < closestDistance) {
                                        closestDistance = distance;
                                        index = i;
                                    }
                                } 
                            }
                        }
                        if (isLookingRight) {
                            if (yFigureBorders[0] > yPathBorders[1] || yFigureBorders[1] < yPathBorders[0]) {
                                if (xPathBorders[0] > xFigureBorders[1]) {
                                    float distance =figure.dist(path);
                                   if (distance < closestDistance) {
                                        closestDistance = distance;
                                        index = i;
                                    }
                                } 
                            }
                        }
                    }
                        
                        println(index);
                        
                        return index;
                    }
                        ======= 
                    }
                    }
                        >>>>>>> main
                        