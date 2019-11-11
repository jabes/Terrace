public class Button {

  private final int buttonX;
  private final int buttonY;
  private final int buttonWidth;
  private final int buttonHeight;

  private String buttonLabel;
  private PImage buttonIcon;

  private int iconX;
  private int iconY;
  private int iconW;
  private int iconH;

  private int[][] colors;

  public boolean isMouseOver;
  public boolean isActive;

  public Button (int x, int y, int w, int h, int[][] c) {
    buttonX = x;
    buttonY = y;
    buttonWidth = w;
    buttonHeight = h;
    colors = c;
  }

  public void reset () {
    isMouseOver = false;
    isActive = false;
  }

  public void changeColor (int[][] c) {
    colors = c;
  }

  public void changeText (String t) {
    buttonLabel = t;
  }

  public void changeIcon (PImage i, int x, int y, int w, int h) {
    buttonIcon = i;
    iconX = x;
    iconY = y;
    iconW = w;
    iconH = h;

  }

  public void iterate () {
    isMouseOver = mouse.overRect(buttonX, buttonY, buttonWidth, buttonHeight);
    isActive = isMouseOver && mouse.wasClicked;

    if (isMouseOver) {
      mouse.cursor = HAND;
    }

    pushStyle();
    fill(
      colors[isMouseOver ? 1 : 0][0],
      colors[isMouseOver ? 1 : 0][1],
      colors[isMouseOver ? 1 : 0][2]
    );
    rect(buttonX, buttonY, buttonWidth, buttonHeight);
    popStyle();

    if (buttonLabel!= null) {
      pushStyle();
      fill(isMouseOver ? 255 : 0);
      textFont(fonts.VcrOsdMono);
      textAlign(CENTER, CENTER);
      text(buttonLabel, buttonX + (buttonWidth / 2), buttonY + (buttonHeight / 2));
      popStyle();
    }

    if (buttonIcon != null) {
      image(buttonIcon, buttonX + iconX, buttonY + iconY, iconW, iconH);
    }
  }
}
