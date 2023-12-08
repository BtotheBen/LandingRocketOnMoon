class Rocket {

  protected float m = 1f;
  protected PVector r = new PVector(0, 0);
  protected PVector v = new PVector(0, 0);
  protected float size = 20;
  protected PVector gravity = new PVector(0, 1.62);
  protected Antrieb a1 = new Antrieb();
  protected Antrieb a2 = new Antrieb();

  Rocket(PVector g, float mm, float rx, float ry, float vx, float vy) {
    gravity = g;
    m = mm;
    r.x = rx;
    r.y = ry;
    v.x = vx;
    v.y = vy;
  }

  public void accel(PVector extForce) {
    a1.check();
    a2.check();
    PVector force = new PVector(0, 0);

    force.add(extForce);
    force.add(a1.getPForce());
    println(a1.getPForce());
    force.add(a2.getPForce());
    
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
    translate(r.x, r.y);
    //rotate(radians(a1.getAngle()));
    
    triangle(0, 0, -size, size, size, size);
    circle(0, 0, size);
    
    a1.draw(size/9, size-3);
    
    resetMatrix();
    translate(r.x, r.y);
    //rotate(radians(a1.getAngle()));
    a2.draw(-size/2, size-3);
  }

}
