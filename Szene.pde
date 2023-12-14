float dt = 0.1f;
public PVector gravity = new PVector(0, 162);
public boolean[] CKEYS = new boolean[255];

public int C_G = 71;
public PFont font;


Rocket rocket;
Boden boden;

void setup() {
  fill(255);
  size(1200, 800);
  font = createFont("Silkscreen-Regular.ttf", 200);
  
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
  rocket.check();
}


void checkCollision() {
  if (rocket.getLanding() == false && rocket.getPos().y > height-100) {
    rocket.crash();
    println("crashed without landing");
  } else if (rocket.getLanding() == true && rocket.getLegs().y > height-100) {
    if (rocket.getVelocity().y > 20 || rocket.getLife() == false) {
      rocket.crash();
    } else {
      rocket.land();
    }
  }
}


void draw() {
  dt = 1/frameRate;

  //println(rocket.getVelocity());

  moveAll();
  drawAll();
  checkCollision();
}




//Register Keyboard Inputs to add to Array
void keyPressed() {
  CKEYS[keyCode] = true;

  if (keyCode == C_G && rocket.getLife() == true) {
    rocket.setLanding(!(rocket.getLanding()));
  }
}

//Register when Key is released to remove from Array
void keyReleased() {
  CKEYS[keyCode] = false;
}
