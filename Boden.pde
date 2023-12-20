class Boden {
  
  int numTeile = 20;
  int[] teile; 
  
  Boden() {
     teile = new int[numTeile];
     
     noiseDetail(2, 0.9);
     for (int i=0; i<numTeile; i++) {
        teile[i] = height - int(noise(i) * 50 + 80);
     }
     
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
