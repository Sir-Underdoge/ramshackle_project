class Player
{
  PVector loc;
  boolean ducking;
  float ground, gravity, velocity, up; 
  
  Player()
  {
    loc = new PVector(20, 600);
    ducking = false;
    
    ground = loc.y;
    gravity = .5;
    velocity = 0;
  }
  
  void updatePlayer()
  {
    if(loc.y < ground) //if off ground
    {
      velocity += gravity;
    }
    else velocity = 0;
    
    if(loc.y >= ground && up != 0) //if at ground level and jump key activated
    {
      velocity = -10;
    }
    
    loc.y += velocity;
    
    render();
  }
  
  void render()
  {
    if(loc.y == ground)
    {
      if(ducking) image(f18magd150_Ramshackle_GriepCollins.duck, 20, loc.y, 100, 100);
      else image(f18magd150_Ramshackle_GriepCollins.walk, 20, loc.y, 100, 100);
    }
    else image(f18magd150_Ramshackle_GriepCollins.jump, 20, loc.y, 100, 100);
     
  }
  
  void keyManager(boolean pressDetect)
  {
    if(pressDetect) //PRESSED
    {
      if(key == 'w')
        up = -1;
      else if(key == 's' && loc.y == ground)
        ducking = true;
    }
    else //RELEASED
    {
      if(key == 'w')
      {
        up = 0;
      }
      else if(key == 's')
      {
        ducking = false;
      }
    }
  }
}
