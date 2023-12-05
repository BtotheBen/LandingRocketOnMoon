class Planet {
  
  private PVector r;
  private double mass;
  private int radius;
  
  Planet(PVector pos, double mm, int rad) {
    r = pos;
    mass = mm;
    radius = rad;
  }
  
  public PVector getPos(){
    return r;
  }
  
  public double getMass(){
    return mass;
  }
  
  public void draw() {
    circle(r.x, r.y, radius);
  }
  
}
