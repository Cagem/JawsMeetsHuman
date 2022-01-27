// @author Kyra Muhl
// @author Niginabonu Isamukhamedova

import processing.sound.*;

SoundFile backgroundMusic; // Used to declare sound file object
int themeSongPopupTimer = 0; // Used to calc for how long the popup as been visible
float amplitude = 0.5; // Used to declare sound amplitude

// Initializes the background music
void initThemeSound() {
  backgroundMusic = new SoundFile(this, "Jaws-theme-song.mp3");
  setThemeVolume(amplitude);
  loopThemeSong();
}

// Function to toggle between playing or pausing the music
void playOrPauseThemeSong() {
  if (isThemePlaying()) {
    pauseThemeSong();
    setPopup("Theme Song muted");
  } else {
    loopThemeSong();
    setPopup("Playing Theme Song");
  }
} 

// Function to check if music is currently playing
boolean isThemePlaying() {
  return backgroundMusic.isPlaying();
}

// Function to change the musics volume
void setThemeVolume(float volume) {
  backgroundMusic.amp(volume);
}

// Function to get the current music volume as a string
String getAmplitudeString() {
  return str(Math.round(amplitude * 100));
}

// Function to increase the musics volume
void increaseThemeVolume() {
  if (amplitude < 0.98) {
    amplitude = amplitude + 0.02;
    setThemeVolume(amplitude);
    setPopup("Increased Volume: " + getAmplitudeString(), 60);
  }
}

// Function to decrease the musics volume
void decreaseThemeVolume() {
  if (amplitude > 0.02) {
    amplitude = amplitude - 0.02;
    setThemeVolume(amplitude);
    setPopup("Decreased Volume: " + getAmplitudeString(), 60);
  }
}

// Function to play background music
void playThemeSong() {
  backgroundMusic.play();
}

// Function to play background music as a loop
void loopThemeSong() {
  backgroundMusic.loop();
}

// Function to pause background music
void pauseThemeSong() {
  backgroundMusic.pause();
}

// Function to stop background music
void stopThemeSong() {
  backgroundMusic.stop();
}
