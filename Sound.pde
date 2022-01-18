// @author Kyra Muhl
// @author Niginabonu Isamukhamedova

import processing.sound.*;
SoundFile file; // Used to declare sound file object
boolean shouldShowSongPopup = false; // Used to define if popup should be visible
int themeSongPopupTimer = 0; // Used to calc for how long the popup as been visible
String themeSongPopupText = ""; // Used to define text of popup
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
    themeSongPopupText = "Paused Theme Song";
  } else {
    loopThemeSong();
    themeSongPopupText = "Playing: Jaws Theme";
  }
  // When the musics state has changed, the user shall be informed via popup
  shouldShowSongPopup = true;
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
    themeSongPopupText = "Increased Volume: " + getAmplitudeString();
    shouldShowSongPopup = true;
  }
}

// Function to decrease the musics volume
void decreaseThemeVolume() {
  if (amplitude > 0.02) {
    amplitude = amplitude - 0.02;
    setThemeVolume(amplitude);
    themeSongPopupText = "Decreased Volume: " + getAmplitudeString();
    shouldShowSongPopup = true;
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

// Calls the function to draw the popup & 
// Increases the timer, so the popup will not be visible after a few seconds
void showThemeSongPopup() {
  if (shouldShowSongPopup) {
    popup(themeSongPopupText);
    themeSongPopupTimer++;
  }
  if (themeSongPopupTimer == 120) {
    shouldShowSongPopup = false;
    themeSongPopupTimer = 0;
  }
}
