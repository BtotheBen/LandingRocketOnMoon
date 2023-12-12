class ParticleExplosion {
  PVector position;
  PVector velocity;
  PVector acceleration;
  float lifespan;

  ParticleExplosion(PVector l) {
    acceleration = new PVector(random(-1, 1), random(-1, 1));
    velocity = new PVector(random(-1, 1), random(-1, 1));
    position = l.copy();
    lifespan = 255.0;
  }

  public void run() {
    update();
    display();
  }

  // Method to update position
  public void update() {
    velocity.add(acceleration);
    position.add(velocity);
    lifespan -= 1.0;
  }

  // Method to display
  public void display() {
    stroke(255, lifespan);
    fill(random(200, 255), random(0, 120), 0, lifespan);
    
    if (random(1) > 0.5) {
      ellipse(position.x, position.y, 8, 8);
    } else {
      triangle(position.x, position.y, position.x+3, position.y+6, position.x+6, position.y);
    }
    
    
    stroke(2);
    fill(255);
  }

  // Is the particle still useful?
  boolean isDead() {
    if (lifespan < 0.0) {
      return true;
    } else {
      return false;
    }
  }
}
