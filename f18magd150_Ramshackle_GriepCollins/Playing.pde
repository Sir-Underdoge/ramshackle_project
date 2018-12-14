class Playing
{
  boolean music = false, alive = true;
  int score = 0;
  Obstacle[] test = new Obstacle[3];
  Player p = new Player();
  Obstacle obs = new Obstacle(750, 650, 5, true);
  Obstacle obs_1 = new Obstacle(900, 600, 5, false);
  
  Playing()
  {
    for(int i = 0; i < 3; i++)
    {
      test[i] = new Obstacle(750 + i*250, 650, 5);
    }
  }
  
  void manager()
  {
    background(50);
    //music
    if(!music)
    {
      music = true;
      f18magd150_Ramshackle_GriepCollins.game.loop();
    }
    
    //ground line
    color(0);
    stroke(3);
    line(0, 700, 750, 700);
    
    p.updatePlayer();
    
    //obstacle render
    for(int i = 0; i < 3; i++)
    {
      
      if(test[i].loc.x <= 0) { test[i].loc.x =  750; test[i].randomize(); }
      
      image(test[i].building ? f18magd150_Ramshackle_GriepCollins.building:f18magd150_Ramshackle_GriepCollins.plane, test[i].loc.x, test[i].loc.y);
    }
    
    
   
    if(alive)
    {
      score += frameCount%60 == 0 ? 1:0;
      text("Score: " + score, width/2, 50);
      
      if(obs.loc.x + 29 <= 0) obs.loc.x = width;
    
      //if(p.loc.x == obs.loc.x && p.ground == p.loc.y) alive = false; //"collision" system
      for(int i = 0; i < 3; i++)
      { 
        //if collides then alive = false;
        //if( (p.loc.x == test[i].loc.x && p.ground == p.loc.y && test[i].building) || (p.loc.x + 259 == test[i].loc.x && p.ground == p.loc.y && test[i].building)) alive  = false;
        
        if( (p.loc.x == test[i].loc.x || p.loc.x + 90 == test[i].loc.x) && p.ground == p.loc.y && test[i].building) alive  = false; //building
        if( (p.loc.x == test[i].loc.x || p.loc.x + 90 == test[i].loc.x) && (p.ground != p.loc.y  || !p.ducking) && !test[i].building) alive  = false;
        test[i].loc.x -= test[i].speed;
      }
    }
    else
    {
      text("Good luck next time! Score: " + score, width/2,  50);
      //p.loc.y--;
    }
  }
   
}
