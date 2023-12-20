class FuelTank {
  protected float fuelMax;
  protected float fuel;

  FuelTank(float ff) {
    fuelMax = ff;
    fuel = ff;
  }

  public void subFuel(float change) {
    if (change >= 0) {
      if (change < fuel) {
        fuel -= change;
      } else if (change >= fuel) {
        fuel = 0;
        println("fuel leer");
      }
    }
  }

  public float getFuel() {
    return fuel;
  }
}
