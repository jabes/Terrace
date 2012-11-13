public class Sky {
  
  private PImage backgroundGraphic;
  private final int backgroundWidth = 800;
  private final int backgroundHeight = 600;
  private final int xDistance;
  private float xMultiplier;
  private float bgX;
    
  public Sky () {
    backgroundGraphic = loadImage("resources/background-graphic.jpg");
    xDistance = backgroundWidth - globals.viewportWidth;
  }
  
  public void redraw () {
    xMultiplier = abs(world.posX) / (world.mapWidth - globals.viewportWidth);
    bgX = (xDistance * xMultiplier) * -1;      
    image(backgroundGraphic, bgX, 0, backgroundWidth, backgroundHeight);
  }

}
