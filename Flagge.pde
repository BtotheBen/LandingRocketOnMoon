class Flagge {

  private PVector pos;

  Flagge(float x, float y) {
    pos = new PVector(x, y);
  }

  public void draw() {
    stroke(255);
    image(indienFlagge, pos.x, pos.y, 40, 25);
    line(pos.x, pos.y, pos.x, pos.y + 60);
    stroke(0);
  }
}
