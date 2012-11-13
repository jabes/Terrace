public class Mouse {
  
  boolean isActive;
  boolean wasClicked;

  Mouse () {
    isActive = false;
  }

  void pressed () {
    isActive = true;
  }
  
  void released () {
    wasClicked = true;
    isActive = false;
  }
  
  void reset () {
    wasClicked = false;
  }
  
  boolean overRect (int x, int y, int w, int h) {
    return (
      applet.mouseX >= x 
      && applet.mouseX <= x + w - 1
      && applet.mouseY >= y 
      && applet.mouseY <= y + h - 1
    );
  }

  
}
