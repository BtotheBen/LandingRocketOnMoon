class ParticleExplosion extends Particle {

  ParticleExplosion(PVector l) {
    super(l);
    acceleration = new PVector(random(-0.01, 0.01), random(-0.01, 0.01));
    velocity = new PVector(random(-0.10, 0.01), random(-0.01, 0.01));
    position = l.copy();
    position.x += random(-15, 15);
    position.y += random(-15, 15);
    lifespan = 255.0;
  }

  // Method to update position
  public void update() {
    velocity.add(acceleration);
    position.add(velocity);
    lifespan -= 1.0;
  }

}
