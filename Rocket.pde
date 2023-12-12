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
  
  public PVector getLegs() {
    return new PVector(r.x, r.y+size+15);
  }

  public float getMass() {
    return m;
  }
  
  public PVector getVelocity() {
    return v; 
  }

  public void draw() {
    fill(255);
    translate(r.x, r.y);
    
    triangle(0, 0, -size, size, size, size);
    circle(0, 0, size);
    
    if (CKEYS[C_G] == true) {
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
    pushMatrix();
    translate(-size/2, size - 3);
    a2.draw();
    
    popMatrix();
    
    
  }

}
