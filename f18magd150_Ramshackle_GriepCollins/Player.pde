class Player
{
  PVector loc;
  int x = 20, y = 700;
  boolean grounded;
  boolean ducking;
  
  Player()
  {
    loc = new PVector(x, y);
    grounded = true;
    ducking = false;
  }
  
  void manager()
  {
    render();
  }
  
  
  void render()
  {
    fill(200);
    rect(20, 700, 20, 20);
  }
  
  void jump()
  {
    if(grounded)
    {
      //jump
      grounded = false;
      
    }
  }
  
  void crouch()
  {
    if(grounded)
    {
      //crouch
    }
  }
  
  void keyManager()
  {
    if(key == 'w')
      jump();
    else if(key == 's')
      crouch();
  }
}
