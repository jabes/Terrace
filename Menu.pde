public class Menu {
  
  boolean isOpen = false;
  PImage backdropGraphic;
  PImage backdropTitle;
  Button playButton;
  
  Menu () {
    backdropGraphic = loadImage("resources/menu-backdrop.png");
    backdropTitle = loadImage("resources/menu-title.png");
    playButton = new Button(globals.viewportHalfWidth - 80, 250, 160, 40, new int[][]{
      {216, 40, 0},
      {190, 35, 0}
    });
    playButton.addText("PLAY GAME");
  }
  
  void show () {
    isOpen = true;
  }
  
  void hide () {
    isOpen = false;
    playButton.reset();
  }
  
  void iterate () {
    
    applet.background(216, 40, 0);
    image(backdropGraphic, 0, globals.viewportHeight - 122, 600, 122);
    image(backdropTitle, globals.viewportHalfWidth - 96, 100, 192, 80);
    
    if (playButton.isActive) {
      hide();
      game.start();
    } else playButton.iterate();
  
  }
  
}
