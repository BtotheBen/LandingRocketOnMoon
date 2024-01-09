class Boden {
  
  int numTeile = 20;
  int[] teile; 
  
  int numPoints = 5;
  int[] points;
  
  Boden() {
     teile = new int[numTeile];
     points = new int[numPoints];
     
     noiseDetail(8, 0.5);
     for (int i=0; i<numTeile; i++) {
        teile[i] = height - int(noise(i) * 50 + 80);
     }
     
     int pointsperarea = numTeile / numPoints;
     
     
  }
  
  public int getHeight(int posx){
    int floor = teile[floor(posx / (width/numTeile))];
    return floor;
  }
  
  public void draw() {
    noStroke();
    rectMode(CORNERS);
    fill(205);
    for (int i=0; i<numTeile; i++) {
      rect(i*(width/numTeile), teile[i], (i+1)*(width/numTeile), height); 
    }
    stroke(1);
    fill(255);
  }
}
