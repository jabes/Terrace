public class Resources {

  final PImage bulletSpriteSheet;
  final PImage volumeIcon;
  final PImage interativeObjectSpriteSheet;
  final PImage gilliamKnightSpriteSheet;
  final PImage kintotSpriteSheet;
  final PImage menuBackdrop;
  final PImage menuTitle;
  final PImage playerSpriteSheet;
  final PImage gameBackdrop;
  final PImage gameTileSheet;
  
  long startTime;
  long endTime;
  
  // note: sound class also loads external resources
  Resources () {
    println("LOAD EXTERNAL RESOURCES");
    startTime = System.currentTimeMillis();
    bulletSpriteSheet = loadImage("resources/bullet-sprite.gif");
    volumeIcon = loadImage("resources/volume.png");
    interativeObjectSpriteSheet = loadImage("resources/objects-tileset.gif");
    gilliamKnightSpriteSheet = loadImage("resources/enemy-sprite-gilliam-knight.gif");
    kintotSpriteSheet = loadImage("resources/enemy-sprite-kintot.gif");
    menuBackdrop = loadImage("resources/menu-backdrop.png");
    menuTitle = loadImage("resources/menu-title.png");
    playerSpriteSheet = loadImage("resources/player-sprite.gif");
    gameBackdrop = loadImage("resources/game-backdrop.png");
    gameTileSheet = loadImage("resources/world-tileset.png");
    endTime = System.currentTimeMillis();
    println("EXTERNAL RESOURCES LOADED IN " + (endTime - startTime) + " MS");
  }
  
}
