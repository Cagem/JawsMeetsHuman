// @author Kyra Muhl

float xRubberRing;
float yRubberRing;
float rubberRingWidth;
boolean isRubberRingCollected = false;
boolean showLifePreserver = true;
int iconTimer = 240;

void initRubberRing() {
  int randomNumber = (int) random(2, paths.size()-3);
  Path path = paths.get(randomNumber);
  xRubberRing = path.x + path.width/2;
  yRubberRing = path.y + path.height/2;
}

void drawRubberRing() {
  rubberRingWidth = humanImg.width*2;

  imageMode(CENTER);
  image(rubberRingImg, xRubberRing, yRubberRing, rubberRingWidth, rubberRingWidth);
}

void drawLifePreserver() {
  float lifePreserverWidth = humanImg.width*4;

  imageMode(CENTER);
  image(lifePreserverImg, width-lifePreserverWidth-7, height-lifePreserverWidth-15, lifePreserverWidth, lifePreserverWidth);
  text(getIconTimeString(), width-lifePreserverWidth/2-7, height-lifePreserverWidth/2); // positioning the timer
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
