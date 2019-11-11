public class ScoreCard {

  boolean isOpen = false;
  Button playAgainButton;
  Button backButton;

  ScoreCard () {
    playAgainButton = new Button((width / 2) - 80, 250, 160, 40, new int[][] {
      {216, 40, 0},
      {164, 0, 0}
    });
    playAgainButton.changeText("TRY AGAIN");
    backButton = new Button((width / 2) - 80, 300, 160, 40, new int[][] {
      {216, 40, 0},
      {164, 0, 0}
    });
    backButton.changeText("BACK TO MENU");
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
    image(graphics.menuBackdropRed, 0, height - 122, 600, 122);
    pushStyle();
    fill(255);
    textFont(fonts.AndaleMono);
    textAlign(CENTER);
    text("YOU HAVE PERISHED", (width / 2), 120);
    textFont(fonts.OpenSansRegular);
    text("You have " + score.p + " points", (width / 2), 150);
    popStyle();

    if (playAgainButton.isActive || keyboard.keySpace) {
      hide();
      player.init(player.spawnTileX, player.spawnTileY);
      world.init(world.mapData);
      game.init(game.interactiveObjectData, game.enemyData);
      game.start();
    }

    if (backButton.isActive) {
      hide();
      menu.show();
    } else {
      playAgainButton.iterate();
      backButton.iterate();
    }
  }
}
