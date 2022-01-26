// @author Kyra Muhl

PVector rubberRing;
PVector lifePreserverIcon;
float lifePreserverWidth;
float rubberRingWidth;
boolean showLifePreserver = false;
int iconTimer = 240;

Path getRandomPathTile() {
  int randomNumber = (int) random(2, paths.size()-3);
  return paths.get(randomNumber);
}

void initRubberRing() {
  Path path = getRandomPathTile();
  rubberRing = new PVector(path.x + path.width/2, path.y + path.height/2);
}

void initLifePreserverIcon() {
  lifePreserverWidth = humanImg.width*4;
  lifePreserverIcon = new PVector(width-lifePreserverWidth-7, height-lifePreserverWidth-15);
}

void drawRubberRing() {
  rubberRingWidth = humanImg.width*2;

  imageMode(CENTER);
  image(rubberRingImg, rubberRing.x, rubberRing.y, rubberRingWidth, rubberRingWidth);
}

void drawLifePreserver() {
  imageMode(CENTER);
  image(lifePreserverImg, lifePreserverIcon.x, lifePreserverIcon.y, lifePreserverWidth, lifePreserverWidth);
  text(getIconTimeString(), width-lifePreserverWidth/2-7, height-lifePreserverWidth/2);
  setIconTimer();
}

void setIconTimer() {
  if (iconTimer > 0) {
    iconTimer--;
  } else {
    showLifePreserver = false;
    iconTimer = 240;
  }
}

String getIconTimeString() {
  return formatDigits(iconTimer/60) + " : " + formatDigits(iconTimer%60);
}
