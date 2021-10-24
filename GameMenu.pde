void displayMenu() {
  background(100);
    textAlign(CENTER);
    fill(255);
    textSize(80);
    text("JAWS meets human", width/2, height/2.5);
    textSize(20);
    if (!inPause) { // Startup-specific content that is onyl displayed once
      text("Press 'p' to play (or to pause later on)", width/2, height/2);
      text("The rules go like this: …", width/2, height/1.5);
    }
    else {
      text("Press 'p' to play (or to pause later on)", width/2, height/2); // TODO: Hier könnte noch etwas ausgeklügelteres hin
    }
}