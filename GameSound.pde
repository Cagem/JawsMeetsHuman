import processing.sound.*;
SoundFile file;
boolean shouldShowPopup = false;
int themeSongPopupTimer = 0;
String themeSongPopupText = "";
float amplitude = 0.5;

void initThemeSound() {
    file = new SoundFile(this, "Jaws-theme-song.mp3");
    setThemeVolume(amplitude);
    loopThemeSong();
}

void playOrPauseThemeSong() {
    if (isThemePlaying()) {
        pauseThemeSong();
        themeSongPopupText = "Paused Theme Song";
    }
    else {
        loopThemeSong();
        themeSongPopupText = "Playing: Jaws Theme";
    }
    shouldShowPopup = true;
} 

boolean isThemePlaying() {
    return file.isPlaying();
}

void setThemeVolume(float volume) {
    file.amp(volume);
}

String getAmplitudeString() {
    return str(Math.round(amplitude * 100));
}

void increaseThemeVolume() {
    if (amplitude < 0.98) {
        amplitude = amplitude + 0.02;
        setThemeVolume(amplitude);
        themeSongPopupText = "Increased Volume: " + getAmplitudeString();
        shouldShowPopup = true;
    } 
}

void decreaseThemeVolume() {
    if (amplitude > 0.02) {
        amplitude = amplitude - 0.02;
        setThemeVolume(amplitude);
        themeSongPopupText = "Decreased Volume: " + getAmplitudeString();
        shouldShowPopup = true;
    }
}

void playThemeSong() {
    file.play();
}

void loopThemeSong() {
    file.loop();
}

void pauseThemeSong() {
    file.pause();
}

void stopThemeSong() {
    file.stop();
}

void showThemeSongPopup() {
    if (shouldShowPopup) {
        displayThemeSongState(themeSongPopupText);
		themeSongPopupTimer++;
	}
	if (themeSongPopupTimer == 120) {
		shouldShowPopup = false;
		themeSongPopupTimer = 0;
	}
}

void displayThemeSongState(String info) {
  float xPosition = width*0.9;
  float yPosition = height*0.05;
  rectMode(CENTER);
  fill(80);
  rect(xPosition, yPosition, width*0.15, height*0.05, 10);
  fill(255);
  textSize(RelativeSize("M"));
  text(info, xPosition, height*0.057);
  rectMode(CORNER);
}
