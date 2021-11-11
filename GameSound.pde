import processing.sound.*;
SoundFile file;

void startThemeSong() {
    // Load a soundfile from the /data folder of the sketch and play it back
    file = new SoundFile(this, "Jaws-theme-song.mp3");
    file.play();
}