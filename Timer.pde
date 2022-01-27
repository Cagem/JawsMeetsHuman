// @author Luca Virnich

float timerSeconds = 0;
int timerSecondsINT = 0; 
int timerMinutes = 0;
int timerHours = 0;

String formatDigits(int num) {
  return nf(num, 2);
}

String getTimeString() {
  return formatDigits(timerHours) + " : " + formatDigits(timerMinutes) + " : " + formatDigits(timerSecondsINT);
}

void drawTimer() {
  fill(0);
  textSize(relativeSize("M"));
  textAlign(LEFT);
  timerSecondsINT = Math.round(timerSeconds); // round to seconds 

  if (!displayMenu == true) { // game start

    text(getTimeString(), width * 0.02, height - height * 0.02); // positioning the timer
    timerSeconds = timerSeconds + 1 / frameRate; // seconds

    if (timerSeconds >= 60) {
      timerSeconds = 0; // reset to 0 after 60 iterations (seconds)
      timerMinutes = timerMinutes + 1; // add one minuter after 60 iterations
    }

    if (timerMinutes >= 60) {            
      timerMinutes = 0; // reset the minutes count after 60 seconds
      timerHours = timerHours + 1; // add one hour after 60 minutes
    }
  }
}
