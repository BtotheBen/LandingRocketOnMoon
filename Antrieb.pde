/*
class Antrieb {
  
  protected PVector pForce = new PVector(0, 0);
  protected int power = 30;
  protected ParticleSystem ps;
  protected float waste = 0.0;
  protected float fuel = 0.0;


  Antrieb(Gravity g, float mm, float rx, float ry, float vx, float vy) {
    super(g, mm, rx, ry, vx, vy, 10);
    
    size = 10;
    addBody(new Square(g, mm/2, rx, ry, vx, vy, size));
    addBody(new Circle(g, mm/2, rx+size/2, ry, vx, vy, size));
    
    ps = new ParticleSystem(new PVector(r.x, r.y), 50);
  }


  private void schub(int px, int py) {
    pForce.add(new PVector(px * power, py * power));
    waste += power/120.0;
    ps.addParticle();
  }


  private void powerChange(int pp) {
    power = pp;
  }

  public void check() {    
    pForce = new PVector(0, 0);
    if (fuel > 0) {
      if (CKEYS[UP] == true) {
        schub(0, -1);
      }
      if (CKEYS[DOWN] == true) {
        schub(0, 1);
      }
      if (CKEYS[LEFT] == true) {
        schub(-1, 0);
      }
      if (CKEYS[RIGHT] == true) {
        schub(1, 0);
      }
    }
    
    if (CKEYS[SPACE] == true && (millis() - timestamps[SPACE]) > 300) {
      if (power < 300) {
        powerChange(300);
      } else {
        powerChange(50);
      }
      timestamps[SPACE] = millis();
    }
   
  }

  public void setPower(int pp) {
    power = pp;
  }
  
  public void setFuel(float ff) {
    fuel = ff;
  }

  public int getPower() {
    return power;
  }

  public PVector getPForce() {
    return pForce;
  }
  
  public float getWaste() {
    float ww = waste;
    waste = 0.0;
    return ww;
  }

  public void draw()  {
    super.draw();
    
    ps.setOrigin(new PVector(r.x+size/2, r.y+size));
    ps.run();
  }
  
  
} */
