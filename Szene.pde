public float dt = 0.1f;
public PVector gravity = new PVector(0, 1.62);
public boolean[] CKEYS = new boolean[255];

public PVector emp = new PVector(0, 0, 0);

public int C_G = 71;
public int C_SPACE = 32;
public PFont crashFont;
public PFont font;
public PImage indienFlagge;

Rocket rocket;
Boden boden;

void setup() {
  fill(255);
  size(1200, 800);
  crashFont = createFont("Silkscreen-Regular.ttf", 200);
  font = createFont("MicrosoftSansSerif.ttf", 12);
  indienFlagge = loadImage("indien.jpeg");
  textFont(font);

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
  if (rocket.getLanding() == false && rocket.getPos().y > boden.getHeight(rocket.getPos().x)-20) {
    rocket.crash(boden.getHeight(rocket.getPos().x));
  } else if (rocket.getLanding() == true && rocket.getLegs().y > boden.getHeight(rocket.getPos().x)) {
    if (rocket.getVelocity().y > 20 || rocket.getLife() == false || boden.getDanger(rocket.getPos().x)) {
      rocket.crash(boden.getHeight(int(rocket.getPos().x)));
    } else {
      rocket.land(boden.getHeight(int(rocket.getPos().x)));
    }
  }
}

void draw() {
  dt = 1/frameRate;

  moveAll();
  drawAll();
  checkCollision();
}

void keyPressed() {
  CKEYS[keyCode] = true;

  if (keyCode == C_SPACE && rocket.getLife() == true) {
    rocket.setLanding(!(rocket.getLanding()));
  }
}

void keyReleased() {
  CKEYS[keyCode] = false;
}
