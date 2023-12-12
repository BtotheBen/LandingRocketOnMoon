class Antrieb {
  
  protected PVector pForce = new PVector(0, 0);
  protected int power = 30000;
  protected int size = 10;
  protected int angle = 0;
  protected ParticleSystem ps = new ParticleSystem(new PVector(0, 0), 50);

  Antrieb() {
  }

  private void schub(int px, int py) {
    angle = 45 * px;
    
    pForce.add(new PVector(0, -power));
    pForce.rotate(radians(angle));
    
    ps.addParticle();
  }

  private void powerChange(int pp) {
    power = pp;
  }

  public void check() {    
    pForce = new PVector(0, 0);
    
    if (CKEYS[UP] == true) {
      schub(0, -1);
    } else if (CKEYS[LEFT] == true) {
      schub(-1, 0);
    } else if (CKEYS[RIGHT] == true) {
      schub(1, 0);
    } else if (CKEYS[RIGHT] == false && CKEYS[LEFT] == false && CKEYS[UP] == false) {
      angle = 0;
    }
   
  }

  public void setPower(int pp) {
    power = pp;
  }

  public PVector getPForce() {
    return pForce;
  }
  
  public int getAngle() {
    return angle;
  }

  public void draw()  {
    rotate(radians(angle));
    
    rectMode(CORNERS);
    rect(-size/2, 0, size/2, size);
    rectMode(CORNER);
    circle(0, 0, size);
    
    
    ps.setOrigin(new PVector(0, size));
    ps.run();
  } 
}
