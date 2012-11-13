public class Keyboard {
  
  public boolean keyUp;
  public boolean keyDown;
  public boolean keyLeft;
  public boolean keyRight;
  public boolean keyControl;

  public Keyboard () {
    keyUp = false;
    keyDown = false;
    keyLeft = false;
    keyRight = false;
    keyControl = false;
  }

  public void pressed (int code) {
    if (code == UP) keyUp = true;
    else if (code == DOWN) keyDown = true;
    else if (code == LEFT) keyLeft = true;
    else if (code == RIGHT) keyRight = true;
    else if (code == CONTROL) keyControl = true;
}
  
  public void released (int code) {
    if (code == UP) keyUp = false;
    if (code == DOWN) keyDown = false;
    else if (code == LEFT) keyLeft = false;
    else if (code == RIGHT) keyRight = false;
    else if (code == CONTROL) keyControl = false;
  }
  
}
