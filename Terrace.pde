PApplet applet;
Globals globals;
Resources resources;
Fonts fonts;
Mouse mouse;
Keyboard keyboard;
Sounds sounds;
Player player;
Sky sky;
World world;
Score score;
ScoreCard scorecard;
Game game;
Menu menu;

void setup () {

  applet = this;
  globals = new Globals();

  applet.size(globals.viewportWidth, globals.viewportHeight);
  applet.noSmooth();
  applet.noStroke();

  resources = new Resources();
  sounds = new Sounds(applet);
  game = new Game();
  menu = new Menu();
  fonts = new Fonts();
  mouse = new Mouse();
  keyboard = new Keyboard();
  sky = new Sky();
  world = new World(60, 60);
  player = new Player();
  score = new Score();
  scorecard = new ScoreCard();
  
  menu.show();
  
}

void stop() {
  //game.stop();
  sounds.unload();
}

void draw () {
  
  applet.background(0);
  
  mouse.cursor = ARROW; // reset every draw (evaluated in code below)
  
  if (game.isRunning) {
    if (player.isAlive) {
      game.iterate();
    } else {
      game.stop();
      scorecard.show();
      player.reset();
      world.reset();
    }
  } else if (menu.isOpen) {
    menu.iterate();
  } else if (scorecard.isOpen) {
    scorecard.iterate();
  }
  
  cursor(mouse.cursor);
  if (mouse.wasClicked) mouse.reset();

}


void keyPressed () {
  keyboard.pressed(keyCode);
}

void keyReleased () {
  keyboard.released(keyCode);
}

void mousePressed () {
  mouse.pressed();
}

void mouseReleased () {
  mouse.released();
}







