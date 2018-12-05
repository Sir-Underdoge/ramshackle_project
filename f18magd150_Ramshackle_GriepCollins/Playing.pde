class Playing
{
  boolean music = false;
  int score = 0;
  
  Player p = new Player();
  
  void manager()
  {
    if(!music)
    {
      music = true;
      f18magd150_Ramshackle_GriepCollins.game.loop();
    }
    
    p.render();
  }
   
}
