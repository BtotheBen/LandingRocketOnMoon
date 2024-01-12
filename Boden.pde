class Boden {
  
  int numTeile = 20;
  Tuple[] teile; 
  
  Boden() {
     teile = new Tuple[numTeile];
     
     noiseDetail(8, 0.5);
     for (int i=0; i<numTeile; i++) {
        teile[i] = new Tuple(height - int(noise(i) * 50 + 80), Math.random() > 0.5);
     }
  }
  
  public int getHeight(float posx){
    return teile[floor(posx / (width/numTeile))].x;
  }
  
  public boolean getDanger(float posx){
    return teile[floor(posx / (width/numTeile))].y;
  }
  
  public void draw() {
    noStroke();
    rectMode(CORNERS);
    fill(205);
    for (int i=0; i<numTeile; i++) {
      if (teile[i].y == false) {
        rect(i*(width/numTeile), teile[i].x, (i+1)*(width/numTeile), height); 
      } else {
        rect(i*(width/numTeile),height - 50, (i+1)*(width/numTeile), height);
        triangle(i*(width/numTeile), height-50, (i+1)*(width/numTeile), height-50, (i+0.5)*(width/numTeile), teile[i].x);
      }
    }
    stroke(1);
    fill(255);
  }
}
