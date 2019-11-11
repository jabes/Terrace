import ddf.minim.*;

public class Sounds {

  Minim minim;

  AudioPlayer music;
  AudioPlayer jump;
  AudioPlayer lazer;
  AudioPlayer kill;
  AudioPlayer spring;
  AudioPlayer die;
  AudioPlayer coin;

  public boolean isMuted;
  private String soundsPath;

  public Sounds (PApplet a) {

    try {
      soundsPath = sketchPath("resources/sounds");
    } catch (NoSuchMethodError e) {
      soundsPath = "Terrace/resources/sounds";
    }

    minim = new Minim(a);
    isMuted = false;

    music  = minim.loadFile(soundsPath + "/gunman.wav");
    jump   = minim.loadFile(soundsPath + "/jump.wav");
    lazer  = minim.loadFile(soundsPath + "/lazer.wav");
    kill   = minim.loadFile(soundsPath + "/kill.wav");
    spring = minim.loadFile(soundsPath + "/spring.wav");
    die    = minim.loadFile(soundsPath + "/die.wav");
    coin   = minim.loadFile(soundsPath + "/coin.wav");
  }

  public void playAudio (AudioPlayer a) {
    if (!isMuted) a.play(0);
  }

  public void loopAudio (AudioPlayer a) {
    a.loop();
  }

  public void pauseAudio (AudioPlayer a) {
    a.pause();
  }

  public void mute () {
    music.mute();
    jump.mute();
    lazer.mute();
    kill.mute();
    spring.mute();
    die.mute();
    coin.mute();
    isMuted = true;
  }

  public void unmute () {
    music.unmute();
    jump.unmute();
    lazer.unmute();
    kill.unmute();
    spring.unmute();
    die.unmute();
    coin.unmute();
    isMuted = false;
  }

  public void unload () {
    music.close();
    jump.close();
    lazer.close();
    kill.close();
    spring.close();
    die.close();
    coin.close();
    minim.stop();
  }

}


