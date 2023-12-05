class Rocket {

  protected float m = 1;
  protected PVector r = new PVector(0, 0);
  protected PVector v = new PVector(0, 0);
  protected float size = 10;

  Rocket(float mm, float rx, float ry, float vx, float vy) {
    m = mm;
    r.x = rx;
    r.y = ry;
    v.x = vx;
    v.y = vy;
  }

  public void accel(PVector extForce) {
    PVector force = new PVector(0, 0);

    force.add(extForce);
    
    PVector acc = new PVector();
    if (m != 0) {
      acc.set(force).div(m);
    } else {
      acc.set(new PVector(0, 0, 0));
    }

    PVector dv = acc.mult(dt);
    v.add(dv);
  }

  public void accel() {
    accel(new PVector(0, 0));
  }

  public void move() {
    PVector dr = new PVector();

    dr.set(v);
    dr.mult(dt);
    r.add(dr);
  }

  public PVector getPos() {
    return r;
  }

  public float getMass() {
    return m;
  }
  

  public void draw() {
    fill(255);
    
    circle(r.x, r.y, size);
  }

}
