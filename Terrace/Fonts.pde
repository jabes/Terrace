public class Fonts {

  public PFont AndaleMono;
  public PFont VcrOsdMono;
  public PFont OpenSansRegular;

  private String fontsPath;

  public Fonts () {
    try {
      fontsPath = sketchPath("resources/fonts");
    } catch (NoSuchMethodError e) {
      fontsPath = "Terrace/resources/fonts";
    }

    AndaleMono      = createFont(fontsPath + "/Andale-Mono.ttf", 36);
    VcrOsdMono      = createFont(fontsPath + "/VCR-OSD-Mono.ttf", 20);
    OpenSansRegular = createFont(fontsPath + "/OpenSans-Regular.ttf", 12);
  }
}
