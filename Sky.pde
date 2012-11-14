public class Sky {
  
  private final int backgroundWidth = 800;
  private final int backgroundHeight = 600;
  private final int xDistance;
  private float xMultiplier;
  private float bgX;
    
  public Sky () {
    xDistance = backgroundWidth - globals.viewportWidth;
  }
  
  public void iterate () {
    xMultiplier = abs(world.posX) / (world.mapWidth - globals.viewportWidth);
    bgX = (xDistance * xMultiplier) * -1;      
    image(resources.gameBackdrop, bgX, 0, backgroundWidth, backgroundHeight);
  }

}
