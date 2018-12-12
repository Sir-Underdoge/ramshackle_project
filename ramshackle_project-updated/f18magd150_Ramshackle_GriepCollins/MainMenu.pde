class MainMenu
{
  int index = 0, max=1;
  int x = 200  , y = 300, w = 200, h = 200;
  int minArrowX = x, maxArrowX = x+15, arrowX = x;
  int r = 0, g = 0, b = 0;
  boolean music = false, right = true, increaseR = true, increaseG = true, increaseB = true;

  void render()
  {
    if(!music)
    {
      music = true;
      f18magd150_Ramshackle_GriepCollins.menu.loop();
    }
    //render stuff here
    fill(250);
    //rect(x, y, w, h);
    textSize(40);
    textAlign(CENTER);
    image(f18magd150_Ramshackle_GriepCollins.logo, width/2-250, 50, 500, 200);
    image(f18magd150_Ramshackle_GriepCollins.arrow, arrowX, y + index*75, 50, 50);
    if(index == 0 ) tint( r, 11, 255);
    image(f18magd150_Ramshackle_GriepCollins.play, x, y-20);
    noTint();
    if(index == 1) tint( 11, 255, r);
    image(f18magd150_Ramshackle_GriepCollins.score, x+50, y+50);
    noTint();
    //onButtonClick();
    arrowAnimate();
    colorizer();

  }
  
  
  void colorizer()
  {
    if(r  == 255) increaseR = false;
    else if (r == 0) increaseR = true;
    if(increaseR) r++;
    else r--;
  }
  
  void onButtonClick()
  {
    if(mouseX > x &&  mouseX < x+w && mouseY > y && mouseY < y+h)
    {
      f18magd150_Ramshackle_GriepCollins.menu.stop();
      f18magd150_Ramshackle_GriepCollins.index++;
    }
  }
  
  void arrowAnimate()
  {
    if(frameCount % 5 == 0)
    {
      if(right)
      {
        if(maxArrowX == arrowX) right = false;
        else arrowX++;
      }
      else
      {
        if(minArrowX == arrowX) right = true;
        else arrowX--;
      }
    }
  }
  
  
  void keyManager()
  {
    //INDEX MANAGER
    if(key == 's')
    {
      if(index != max) index++;
      else index = 0;
    }
    else if(key == 'w')
    {
      if(index != 0) index--;
      else index = max;
    }
    
    
    //NextScreenDecider (Decides what screen to show depending on index, also stops music)
    if(key == ' ')
    {
      f18magd150_Ramshackle_GriepCollins.index = (index == 0 ? 1 : 2); //if index == 0, send user to game... else send to score page
      music = false;
      f18magd150_Ramshackle_GriepCollins.menu.stop();
    }
      
  }
}
