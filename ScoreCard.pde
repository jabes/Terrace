public class ScoreCard {
  
  boolean isOpen = false;
  
  Button playAgainButton;
  Button backButton;
  
  ScoreCard () {
    
    playAgainButton = new Button(globals.viewportHalfWidth - 80, 250, 160, 40, new int[][]{
      {216, 40, 0},
      {190, 35, 0}
    });
    playAgainButton.addText("PLAY SOME MORE");
    
    backButton = new Button(globals.viewportHalfWidth - 80, 300, 160, 40, new int[][]{
      {216, 40, 0},
      {190, 35, 0}
    });
    backButton.addText("BACK TO MENU");
    
  }
  
  void show () {
    isOpen = true;
  }
  
  void hide () {
    isOpen = false;
    playAgainButton.reset();
    backButton.reset();
  }
  
  void iterate () {
    
    applet.background(216, 40, 0);
    image(menu.backdropGraphic, 0, globals.viewportHeight - 122, 600, 122);
    
    pushStyle();
    fill(255);
    textFont(fonts.AndaleMono);
    textAlign(CENTER);
    text("YOU HAVE PERISHED", globals.viewportHalfWidth, 120);
    textFont(fonts.TheSans);
    text("You have " + score.p + " points", globals.viewportHalfWidth, 150);
    popStyle();
    
    if (playAgainButton.isActive) {
      hide();
      game.start();
    } if (backButton.isActive) {
      hide();
      menu.show();
    } else {
      playAgainButton.iterate();
      backButton.iterate();
    }
      
  }
  
}
