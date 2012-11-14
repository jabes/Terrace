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
  public boolean hasVolume;
  public boolean hasGain;
  
  public Sounds (PApplet a) {
    
    minim = new Minim(a);
    isMuted = false;

    music = minim.loadFile("resources/gunman.wav");
    jump = minim.loadFile("resources/jump.wav");
    lazer = minim.loadFile("resources/lazer.wav");
    kill = minim.loadFile("resources/kill.wav");
    spring = minim.loadFile("resources/spring.wav");
    die = minim.loadFile("resources/die.wav");
    coin = minim.loadFile("resources/coin.wav");
    
    hasVolume = music.hasControl(Controller.VOLUME);
    hasGain = music.hasControl(Controller.GAIN);
    
    final float musicVolume = 0.9;
    float musicGain = -80.00 + (80.00 * musicVolume);
    if (hasVolume) music.setVolume(musicVolume);
    else if (hasGain) music.setGain(musicGain);
    
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


