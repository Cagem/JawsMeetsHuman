// @author Kyra Muhl

PVector rubberRing;
PVector lifePreserverIcon;
float lifePreserverWidth;
float rubberRingWidth;
boolean showLifePreserver = false;
int iconTimer = 240;

// Chooses a random path tile out ouf the paths-Array
Path getRandomPathTile() {
  int randomNumber = (int) random(2, paths.size()-3);
  return paths.get(randomNumber);
}

// Sets the position of the rubberring
void initRubberRing() {
  Path path = getRandomPathTile();
  rubberRing = new PVector(path.x + path.width/2, path.y + path.height/2);
}

// Sets the position of the life-preserver icon
void initLifePreserverIcon() {
  lifePreserverWidth = humanImg.width*4;
  lifePreserverIcon = new PVector(width-lifePreserverWidth-7, height-lifePreserverWidth-15);
}

// Draws the rubberring image
void drawRubberRing() {
  rubberRingWidth = humanImg.width*2;

  imageMode(CENTER);
  image(rubberRingImg, rubberRing.x, rubberRing.y, rubberRingWidth, rubberRingWidth);
}

// Draws the life-preserver image
void drawLifePreserver() {
  imageMode(CENTER);
  image(lifePreserverImg, lifePreserverIcon.x, lifePreserverIcon.y, lifePreserverWidth, lifePreserverWidth);
  text(getIconTimeString(), width-lifePreserverWidth/2-7, height-lifePreserverWidth/2);
  setIconTimer();
}

// Sets the timer for the life-preserver icon
// (necessary because it should only be visible for a few seconds)
void setIconTimer() {
  if (iconTimer > 0) {
    iconTimer--;
  } else {
    showLifePreserver = false;
    iconTimer = 240;
  }
}

// Formats the iconTimer seconds in a better understandable string format
String getIconTimeString() {
  return formatDigits(iconTimer/60) + " : " + formatDigits(iconTimer%60);
}
