class Obstacle
{
  PVector loc;
  float speed;
  boolean building;
  
  Obstacle(float x, float y, float speed, boolean isBuilding)
  {
    loc = new PVector(x,y);
    this.speed = speed;
    building = isBuilding;
  }
  
  Obstacle(float x, float y, float speed)
  {
    loc = new PVector(x,y);
    this.speed = speed;
    randomize();
  }
  
  void randomize()
  {
    building = round(random(1)) == 0 ? true:false;
    loc.y = building ? 650:580;
  }
}
