float dt = 0.1f;
public PVector gravity = new PVector(0, 1.62);
public boolean[] CKEYS = new boolean[255];

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

void draw() {
  dt = 1/frameRate;
  
  moveAll();
  drawAll();
  
  
}



//Register Keyboard Inputs to add to Array
void keyPressed() {
  CKEYS[keyCode] = true;
}

//Register when Key is released to remove from Array
void keyReleased() {
  CKEYS[keyCode] = false;
}
