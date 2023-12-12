float dt = 0.1f;
public PVector gravity = new PVector(0, 16.2);
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
  
  boden.draw();
  rocket.draw();
}

void crash() {
  par.addParticleExplosion();
}

void checkCollision() {
  if (CKEYS[C_G] == false && rocket.getPos().y > height-100) {
    crash();
  } else if (CKEYS[C_G] == true && rocket.getLegs().y > height-100) {
    if (rocket.getVelocity().y > 40) {
      crash();
    } else {
      println("Landed Succefully");
    }
  }
}


void draw() {
  dt = 1/frameRate;
  
  crash();
  
  moveAll();
  checkCollision();
  drawAll();
  
  par.setOrigin(new PVector(rocket.getPos().x, height-100));
  par.run();
}




//Register Keyboard Inputs to add to Array
void keyPressed() {
  CKEYS[keyCode] = true;
}

//Register when Key is released to remove from Array
void keyReleased() {
  if (keyCode != C_G) {
    CKEYS[keyCode] = false;
  }
}
