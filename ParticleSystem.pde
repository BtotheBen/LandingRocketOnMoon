class ParticleSystem {
  private ArrayList<Particle> particles;
  private PVector origin;
  private int timestamp;
  private int limit;

  ParticleSystem(PVector position, int ll) {
    origin = position.copy();
    particles = new ArrayList<Particle>();
    timestamp = millis();
    limit = ll;
  }

  public void setOrigin(PVector position) {
    origin = position;
  }

  public void addParticle() {
    if (millis() - timestamp > limit){
      particles.add(new Particle(origin));
      timestamp = millis();
    }
  }

  public void run() {
    for (int i = particles.size()-1; i >= 0; i--) {
      Particle p = particles.get(i);
      p.run();
      if (p.isDead()) {
        particles.remove(i);
      }
    }
  }
}
