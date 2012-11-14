public class Menu {
  
  boolean isOpen = false;
  PImage backdropGraphic;
  PImage backdropTitle;
  Button playButton;
  Button loadMapButton;
  
  Menu () {
    
    backdropGraphic = loadImage("resources/menu-backdrop.png");
    backdropTitle = loadImage("resources/menu-title.png");
    
    playButton = new Button(globals.viewportHalfWidth - 80, 250, 160, 40, new int[][]{
      {216, 40, 0},
      {190, 35, 0}
    });
    playButton.addText("PLAY GAME");
    
    loadMapButton = new Button(globals.viewportHalfWidth - 80, 300, 160, 40, new int[][]{
      {216, 40, 0},
      {190, 35, 0}
    });
    loadMapButton.addText("LOAD MAP");
    
  }
  
  void show () {
    isOpen = true;
  }
  
  void hide () {
    isOpen = false;
    playButton.reset();
    loadMapButton.reset();
  }
  
  void iterate () {
    
    applet.background(216, 40, 0);
    image(backdropGraphic, 0, globals.viewportHeight - 122, 600, 122);
    image(backdropTitle, globals.viewportHalfWidth - 96, 100, 192, 80);
    
    if (playButton.isActive) {
      
      hide();
      
      player.init(player.defaultSpawnTileX, player.defaultSpawnTileY);
      world.init(world.mapDataDefault);
      game.init(game.defaultInteractiveObjectData, game.defaultEnemyData);

      game.start();
      
    } else if (loadMapButton.isActive) {
      
      hide();
      
      String[] data = loadStrings(selectInput("Load Map File..."));
      if (data != null) {
        
        String dataType = "";
        int lineCount = 0;
        ArrayList newInteractiveObjectData = new ArrayList();
        int[][] newMapData = new int[10][1];
        int newSpawnTileX = 0;
        int newSpawnTileY = 0;
        
        for (int i = 0; i < data.length; i++) {
          
          if (data[i].substring(0, 1).equals(globals.groupDelimiter)) {
            // determine if delimiter is succeeded by characters
            if (!data[i].substring(1).equals("")) dataType = data[i].substring(1);
            lineCount = 0;
          } else {
            
            int[] rowData = int(split(data[i], globals.inlineDelimiter));
            
            if (dataType.equals("PLAYER")) {
              newSpawnTileX = rowData[0];
              newSpawnTileY = rowData[1];
            } else if (dataType.equals("BLOCKS")) {
              newMapData[lineCount] = expand(newMapData[lineCount], rowData.length);
              arrayCopy(rowData, newMapData[lineCount]);
            } else if (dataType.equals("OBJECTS")) {
              newInteractiveObjectData.add(rowData);
            }
            
            lineCount++;
          }
          
        }
        
        // there is probably a better way to do this
        int[][] converted = new int[newInteractiveObjectData.size()][4];
        for (int i = 0; i < newInteractiveObjectData.size(); i++) converted[i] = (int[]) newInteractiveObjectData.get(i);
        
        player.init(newSpawnTileX, newSpawnTileY);
        world.init(newMapData);
        game.init(converted, new int[][]{});
        
        game.start();
        
      } else show();
      
    } else {
      playButton.iterate();
      loadMapButton.iterate();
    }
    
  }
  
}
