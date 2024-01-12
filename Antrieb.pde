class Antrieb {
  
  protected PVector pForce = new PVector(0, 0);
  protected int power = 30000;
  protected int size = 10;
  protected int angle = 0;
  protected float cost = 0.5;
  protected ParticleSystem ps = new ParticleSystem(new PVector(0, 0), 50);
  protected Rocket rocketDelegate;
  protected boolean status = false;

  Antrieb(Rocket rr) {
    rocketDelegate = rr;
  }

  private void schub(int px, int py) {
    
    if (rocketDelegate.getLanding() == false) {
      status = true;
      
      angle = 35 * px;
      
      pForce.add(new PVector(0, -power));
      pForce.rotate(radians(angle + (px*45)));

      ps.addParticle();
    }
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
      status = false;
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
  
  public float getCost() {
    return cost; 
  }
  
  public boolean getStatus() {
    return status;
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
