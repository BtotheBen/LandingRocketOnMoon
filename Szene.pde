Planet mond = new Planet(new PVector(600, 400), 7 * Math.pow(10, 5), 300);
Rocket rocket = new Rocket(15000f, 100f, 100f, 0f, 0f);

void setup() {
  size(1200, 800);
  
}

void moveAll() {
  rocket.accel();
  rocket.move();
}

void drawAll() {
  background(0);
  
  mond.draw();
  rocket.draw();
}

void draw() {
  rocket.accel();
  drawAll();
  
  
}
