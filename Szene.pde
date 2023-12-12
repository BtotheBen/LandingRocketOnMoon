float dt = 0.1f;
public PVector gravity = new PVector(0, 1.62);
public boolean[] CKEYS = new boolean[255];

public int C_G = 71;

ParticleSystem par = new ParticleSystem(new PVector(0, 0), 10);

Rocket rocket;
Boden boden;

void setup() {
  fill(255);
  size(1200, 800);
  
  rocket = new Rocket(gravity, 15000, width/2, height/10, 0, 0);
  boden = new Boden();
  
}

void moveAll() {
  rocket.accel();
  rocket.move();
}

void drawAll() {
  background(0);
  resetMatrix();
  
  boden.draw();
  rocket.draw();
}

void crash() {
  for (int i=0; i<10000; i++){
    par.addParticleExplosion();
  }
  rocket.setLife(false);
  rocket.setPos(rocket.getPos().x, height-100);
}

void land() {
  rocket.setPos(rocket.getPos().x, /*rocket.getLegs().y*/height-100-20-15);
  rocket.setVelocity(0.0, 0.0);
}

void checkCollision() {
  if (rocket.getLanding() == false && rocket.getPos().y > height-100) {
    crash();
  } else if (rocket.getLanding() == true && rocket.getLegs().y > height-100) {
    if (rocket.getVelocity().y > 20) {
      crash();
    } else {
      land();
      println("Landed Succefully");
    }
  }
}


void draw() {
  dt = 1/frameRate;
  
  println(rocket.getVelocity());
  
  moveAll();
  checkCollision();
  drawAll();
  
  par.setOrigin(rocket.getPos());
  par.run();
}




//Register Keyboard Inputs to add to Array
void keyPressed() {
  CKEYS[keyCode] = true;
  
  if (keyCode == C_G) {
    rocket.setLanding(!(rocket.getLanding()));
  }
}

//Register when Key is released to remove from Array
void keyReleased() {
  CKEYS[keyCode] = false;
}
