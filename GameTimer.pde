float timerSeconds = 0;
int timerSecondsINT = 0; 
int timerMinutes = 0;
int timerHours = 0;






void drawTimer(){

    fill(0);
    textSize(paragraphSize*3);
    textAlign(LEFT);
    timerSecondsINT = Math.round (timerSeconds);      //Runden der sekunden 
    
    if (!shouldDisplayMenu == true) {                  // game start

    text(timerHours+" : "+timerMinutes+" : "+timerSecondsINT, width*0.02, height-height*0.02);        //Position vom Timer
    timerSeconds = timerSeconds + 1/frameRate;                                  //seconds

    if (timerSeconds >= 60) {
      timerSeconds = 0;                                        // bei 60 sec sind sec wieder 0
      timerMinutes = timerMinutes + 1;                         // minute + 1 jede 60 sec
    }

    if (timerMinutes >= 60) {            
      timerMinutes = 0;                                    // bei 60 minutes sind min wieder 0
      timerHours = timerHours + 1;                         // jede 60 min hours plus 1
    }
  }
}