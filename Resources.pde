public class Resources {

  final PImage bulletSpriteSheet;
  final PImage volumeIcon;
  final PImage interativeObjectSpriteSheet;
  final PImage gilliamKnightSpriteSheet;
  final PImage kintotSpriteSheet;
  final PImage menuBackdropRed;
  final PImage menuBackdropBlue;
  final PImage menuTitle;
  final PImage playerSpriteSheet;
  final PImage gameBackdrop;
  final PImage gameTileSheet;
  
  int startTime;
  int endTime;
  
  // note: sound class also loads external resources
  Resources () {
    println("LOADING EXTERNAL GRAPHICS");
    startTime = millis();
    bulletSpriteSheet               = loadImage(sketchPath + "/resources/bullet-sprite.gif");
    volumeIcon                      = loadImage(sketchPath + "/resources/volume.png");
    interativeObjectSpriteSheet     = loadImage(sketchPath + "/resources/objects-tileset.gif");
    gilliamKnightSpriteSheet        = loadImage(sketchPath + "/resources/enemy-sprite-gilliam-knight.gif");
    kintotSpriteSheet               = loadImage(sketchPath + "/resources/enemy-sprite-kintot.gif");
    menuBackdropRed                 = loadImage(sketchPath + "/resources/menu-backdrop-red.png");
    menuBackdropBlue                = loadImage(sketchPath + "/resources/menu-backdrop-blue.png");
    menuTitle                       = loadImage(sketchPath + "/resources/menu-title.png");
    playerSpriteSheet               = loadImage(sketchPath + "/resources/player-sprite.gif");
    gameBackdrop                    = loadImage(sketchPath + "/resources/game-backdrop.png");
    gameTileSheet                   = loadImage(sketchPath + "/resources/world-tileset.png");
    endTime = millis();
    println("EXTERNAL GRAPHICS LOADED IN " + (endTime - startTime) + " MS");
  }
  
}
