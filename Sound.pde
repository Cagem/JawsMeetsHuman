// @author Kyra Muhl

import processing.sound.*;

SoundFile file; // Used to declare sound file object
int themeSongPopupTimer = 0; // Used to calc for how long the popup as been visible
float amplitude = 0.5; // Used to declare sound amplitude

// Initializes the background music
void initThemeSound() {
  file = new SoundFile(this, "Jaws-theme-song.mp3");
  setThemeVolume(amplitude);
  loopThemeSong();
}

// Function to toggle between playing or pausing the music
void playOrPauseThemeSong() {
  if (isThemePlaying()) {
    pauseThemeSong();
    setPopup("Paused Theme Song");
  } else {
    loopThemeSong();
    setPopup("Resume Theme Song");
  }
} 

// Function to check if music is currently playing
boolean isThemePlaying() {
  return file.isPlaying();
}

// Function to change the musics volume
void setThemeVolume(float volume) {
  file.amp(volume);
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
  file.play();
}

// Function to play background music as a loop
void loopThemeSong() {
  file.loop();
}

// Function to pause background music
void pauseThemeSong() {
  file.pause();
}

// Function to stop background music
void stopThemeSong() {
  file.stop();
}
