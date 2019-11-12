public class Keyboard {

  public boolean keyUp;
  public boolean keyDown;
  public boolean keyLeft;
  public boolean keyRight;
  public boolean keyControl;
  public boolean keySpace;
  public boolean keyZ;
  public boolean keyX;

  public Keyboard () {
    keyUp = false;
    keyDown = false;
    keyLeft = false;
    keyRight = false;
    keyControl = false;
    keySpace = false;
    keyZ = false;
    keyX = false;
  }

  public void pressed (int code) {
    switch (code) {
      case LEFT: keyLeft = true; break;
      case UP: keyUp = true; break;
      case RIGHT: keyRight = true; break;
      case DOWN: keyDown = true; break;
      case CONTROL: keyControl = true; break;
      case 32: keySpace = true; break;
      case 90: keyZ = true; break;
      case 88: keyX = true; break;
    }
  }

  public void released (int code) {
     switch (code) {
      case LEFT: keyLeft = false; break;
      case UP: keyUp = false; break;
      case RIGHT: keyRight = false; break;
      case DOWN: keyDown = false; break;
      case CONTROL: keyControl = false; break;
      case 32: keySpace = false; break;
      case 90: keyZ = false; break;
      case 88: keyX = false; break;
    }
  }

}
