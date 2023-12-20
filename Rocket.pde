class Rocket {

  protected float m = 1f;
  protected float originalM;
  protected PVector r = new PVector(0, 0);
  protected PVector v = new PVector(0, 0);
  protected float size = 20;
  protected PVector gravity;
  protected Antrieb a1 = new Antrieb(this);
  protected Antrieb a2 = new Antrieb(this);
  protected boolean life = true;
  protected boolean landing = false;
  protected ParticleSystem par = new ParticleSystem(new PVector(0, 0), 10);
  protected FuelTank tank = new FuelTank(2000);

  Rocket(PVector g, float mm, float rx, float ry, float vx, float vy) {
    gravity = g;
    m = mm + tank.getFuel();
    originalM = mm;
    r.x = rx;
    r.y = ry;
    v.x = vx;
    v.y = vy;
  }

  public void setVelocity(float vx, float vy) {
    v.x = vx;
    v.y = vy;
  }

  public void setPos(float posx, float posy) {
    r = new PVector(posx, posy);
  }

  public void setLanding(boolean state) {
    landing = state;
  }

  public void accel(PVector extForce) {

    if (life) {
      PVector force = emp.copy();

      force.add(extForce);

      if (tank.getFuel() > 0) {
        a1.check();
        a2.check();
        if (a1.getStatus() == true && a2.getStatus() == true && tank.getFuel() > 0) {
          PVector antriebForce = emp.copy();
          force.add(a1.getPForce());
          force.add(a2.getPForce());
          tank.subFuel(a1.getCost() + a2.getCost());
        }
      }

      PVector acc = new PVector();
      if (m != 0) {
        acc.set(force).div(m);
      } else {
        acc.set(new PVector(0, 0, 0));
      }

      acc.add(gravity);

      PVector dv = acc.mult(dt);
      v.add(dv);
    }
  }

  public void accel() {
    accel(new PVector(0, 0));
  }

  public void move() {
    if (life) {
      PVector dr = new PVector();

      dr.set(v);
      dr.mult(dt);
      r.add(dr);
    }
  }

  public void crash(int posy) {
    for (int i=0; i<10000; i++) {
      par.addParticleExplosion();
    }
    if (life) {
      life = false;
    }
    landing = false;
    r.set(r.x, posy);
    v.set(0.0, 0.0);

    resetMatrix();
    textFont(crashFont);
    textAlign(CENTER);
    fill(255, 0, 0);
    text("CRASHED", width/2, height/2);
    fill(255);
    textFont(font);
  }

  public void land(int posy) {
    r.set(r.x, posy-size-15);
    v.set(0.0, 0.0);
  }

  public PVector getPos() {
    return r;
  }

  public PVector getLegs() {
    PVector f = new PVector(r.x, r.y+size+15);
    return f;
  }

  public float getMass() {
    return m;
  }

  public PVector getVelocity() {
    return v;
  }

  public boolean getLanding() {
    return landing;
  }

  public boolean getLife() {
    return life;
  }

  public void draw() {
    fill(255);
    translate(r.x, r.y);

    triangle(0, 0, -size, size, size, size);
    circle(0, 0, size);

    if (landing) {
      stroke(255);
      line(0, size, 0, size+15);
      line(-5, size+15, 5, size+15);

      line(-size+2, size, -size-10, size+15);
      line(-size-10-5, size+15, -size-10+5, size+15);

      line(size-2, size, size+10, size+15);
      line(size+10-5, size+15, size+10+5, size+15);

      stroke(0);
    }

    pushMatrix();

    translate(size/2, size - 3);
    a1.draw();

    popMatrix();
    translate(-size/2, size - 3);
    a2.draw();

    resetMatrix();
  }

  public void check() {
    m = originalM + tank.getFuel();

    textAlign(CENTER);
    text("FUEL: " + tank.getFuel() + "\n GESCHWINDIGKEIT: x:[" + floor(v.x) + "] y:[" + floor(v.y) + "]", 100, 50);
    if (v.y > 20) {
      text("TOO FAST", width/2, height/10);
    }

    par.setOrigin(r);
    par.run();
  }
}
