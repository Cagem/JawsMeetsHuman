String ruleset = "The rules go like this: \nNon exercitation pariatur aute qui ea. Pariatur labore commodo ipsum anim excepteur fugiat nulla ea excepteur aute aliquip. Voluptate minim ut mollit Lorem excepteur in irure voluptate elit aliqua. Ea veniam nisi fugiat ea. Nisi est sunt ipsum commodo. Sint consectetur anim enim nulla sunt tempor voluptate nulla aliquip ullamco reprehenderit enim sint tempor. Id sunt non dolor quis labore tempor fugiat minim id excepteur consequat culpa elit voluptate. Deserunt id deserunt officia in incididunt et ullamco adipisicing. Non irure eu eu aliqua in aliqua cillum magna aute adipisicing. Eu occaecat excepteur aliquip irure aliquip qui. Adipisicing enim quis veniam et quis laboris. Nostrud culpa non ut laboris nulla magna adipisicing sunt cupidatat dolor id ullamco. Proident commodo anim non do nostrud incididunt laborum non. Esse ipsum aliquip occaecat cillum est dolor velit qui ullamco est amet nulla. Et ut anim esse anim non consectetur amet nulla amet commodo qui ut commodo esse.";
PImage bgImage;

void displayMenu() {
  if (!inPause) { // Startup-specific content that is only displayed once
    background(bgImage);
    fill(0, 0, 0, 200);
    strokeWeight(0);
    rect(width*0.2, height*0.25, width*0.6, height*0.73, 10);
    textAlign(CENTER);
    fill(255);
    textSize(80);
    text("JAWS meets human", width/2, height/2.5);
    textSize(20);
    text("Press 'p' to play (or to pause later on)", width/2, height/2);
    textAlign(LEFT);
    text(ruleset, width*0.25, height/1.5, width*0.5, height*0.4); // this textbox is limited by x2 and y2
  } else {
    fill(255);
    textAlign(CENTER);
    textSize(80);
    text("PAUSE", width/2, height/2.5);
    textSize(20);
    text("Press 'p' to keep on playing", width/2, height/2);
  }
}