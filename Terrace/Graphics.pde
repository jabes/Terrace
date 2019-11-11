public class Graphics {

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

  private String graphicsPath;

  Graphics () {

    try {
      graphicsPath = sketchPath("resources/graphics");
    } catch (NoSuchMethodError e) {
      graphicsPath = "Terrace/resources/graphics";
    }

    bulletSpriteSheet           = loadImage(graphicsPath + "/bullet-sprite.gif");
    volumeIcon                  = loadImage(graphicsPath + "/volume.png");
    interativeObjectSpriteSheet = loadImage(graphicsPath + "/objects-tileset.gif");
    gilliamKnightSpriteSheet    = loadImage(graphicsPath + "/enemy-sprite-gilliam-knight.gif");
    kintotSpriteSheet           = loadImage(graphicsPath + "/enemy-sprite-kintot.gif");
    menuBackdropRed             = loadImage(graphicsPath + "/menu-backdrop-red.png");
    menuBackdropBlue            = loadImage(graphicsPath + "/menu-backdrop-blue.png");
    menuTitle                   = loadImage(graphicsPath + "/menu-title.png");
    playerSpriteSheet           = loadImage(graphicsPath + "/player-sprite.gif");
    gameBackdrop                = loadImage(graphicsPath + "/game-backdrop.png");
    gameTileSheet               = loadImage(graphicsPath + "/world-tileset.png");

  }
}
