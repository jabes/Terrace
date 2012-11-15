public class Menu {
  
  boolean isOpen = false;
  Button playButton;
  Button loadMapButton;
  
  Menu () {
    
    playButton = new Button(globals.viewportHalfWidth - 80, 250, 160, 40, new int[][]{
      {80, 136, 248},
      {62, 75, 102}
    });
    playButton.addText("PLAY GAME");
    
    loadMapButton = new Button(globals.viewportHalfWidth - 80, 300, 160, 40, new int[][]{
      {80, 136, 248},
      {62, 75, 102}
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
    
    applet.background(80, 136, 248);
    image(resources.menuBackdropBlue, 0, globals.viewportHeight - 122, 600, 122);
    image(resources.menuTitle, globals.viewportHalfWidth - 96, 100, 192, 80);
    
    pushStyle();
    fill(255);
    textFont(fonts.TheSans);
    textAlign(CENTER);
    text("Shoot: \"Ctr\" or \"Z\"", globals.viewportHalfWidth, 400);
    text("Jump: \"Spacebar\" or \"X\" or \"Up Arrow\"", globals.viewportHalfWidth, 420);
    popStyle();
    
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
        ArrayList newEnemyData = new ArrayList();
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
            } else if (dataType.equals("ENEMIES")) {
              newEnemyData.add(rowData);
            }
            
            lineCount++;
          }
          
        }
        
        // there is probably a better way to do this
        int[][] convertedInteractiveObjectData = new int[newInteractiveObjectData.size()][4];
        for (int i = 0; i < newInteractiveObjectData.size(); i++) convertedInteractiveObjectData[i] = (int[]) newInteractiveObjectData.get(i);
        
        int[][] convertedEnemyData = new int[newEnemyData.size()][3];
        for (int i = 0; i < newEnemyData.size(); i++) convertedEnemyData[i] = (int[]) newEnemyData.get(i);
        
        player.init(newSpawnTileX, newSpawnTileY);
        world.init(newMapData);
        game.init(convertedInteractiveObjectData, convertedEnemyData);
        
        game.start();
        
      } else show();
      
    } else {
      playButton.iterate();
      loadMapButton.iterate();
    }
    
  }
  
}
