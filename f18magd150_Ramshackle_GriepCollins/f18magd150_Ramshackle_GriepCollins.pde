import processing.sound.*;
static int index;
static SoundFile menu;
static SoundFile game;
static PImage logo, arrow, play, score, walk, jump, duck, building, plane;

MainMenu mainMenu = new MainMenu();
Playing playing = new Playing();
HighScores highScores = new HighScores();

void setup()
{
  size(750, 750);
  background(0);
  index = 0;
  logo = loadImage("ramshackle.png");
  play = loadImage("play.png");
  score = loadImage("highscores.png");
  arrow = loadImage("arrow.png"); //https://www.iconfinder.com/icons/211620/arrow_b_right_icon
  menu = new SoundFile(this, "mainmenu.wav"); // https://freesound.org/people/joshuaempyre/sounds/251461/
  game = new SoundFile(this, "game.wav"); // https://freesound.org/people/ShiftKun/sounds/435782/
  
  walk = loadImage("Monster_Run.png");
  jump = loadImage("Monster_Jump.png");
  duck = loadImage("Monster_Duck.png");
  building = loadImage("Obstacle_Building.png");
  plane = loadImage("Obstacle_Plane.png");
}

void draw()
{
  background(0);
  switch(index)
  {
    case 0 : // Main menu
      mainMenu.render();
      break;
    case 1 : // playing
      playing.manager();
      break;
    case 2 : // scoreboard
      highScores.render();
      break;
  }
   
   
}

void keyPressed()
{
  switch(index)
  {
    case 0: // main menu
      mainMenu.keyManager();
      break;
    case 1:
      playing.p.keyManager(true);
      break;
    case 2:
      break;
  }
}

void keyReleased()
{
  switch(index)
  {
    case 0: //main menu
    break;
    
    case 1: //playing
    playing.p.keyManager(false);
    break;
    
    case 2: //score
    break;
  }
}
