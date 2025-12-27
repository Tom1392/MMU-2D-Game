


//================Global Variables======================

ArrayList<A_Sprite> enemies = new ArrayList<>();
ArrayList<A_Sprite> enemyWave = new ArrayList<>();
ArrayList<A_Sprite> obstacles = new ArrayList<>();
ArrayList<A_Sprite> obstaclesWave = new ArrayList<>();
ArrayList<A_Sprite> explosions = new ArrayList<>();
float speed;
int score;
int round;
String scoreStr;
String roundStr;
boolean wavePresent=false;
boolean obstaclesReleased=false;
int numberOfEnemies=200;
int numberOfObstacles=30;
String createEnemy = "Enemy";
String createObstacle = "Obstacle";
Goal earth;
Player newPlayer;
PImage space;
Difficulty myVar = Difficulty.MID;
GameMenu gameMenu = new GameMenu();
GameState gameState = GameState.SPLASH;
Scores highScores;
int gameOverTime;
//================setup method==========================


enum GameState {
  SPLASH,
  MENU,
  GAME,
  PAUSE,
  GAMEOVER,
  SCORES
}

//Enum for difficulty
enum Difficulty {
  EASY,
  MID,
  HARD
}


void setup()
{
  size(1000, 900);
  noSmooth();
  space = loadImage("bg5.jpg");
  space.resize(width, height);
  earth = new Goal(width/2, height/2);
  newPlayer= new Player(width/2, 300);
  spawn(enemies, numberOfEnemies, createEnemy);
  spawn(obstacles, numberOfObstacles, createObstacle);
  highScores = new Scores();
}

//Randomly spawn enemies and obstacles at random postions just of the screen. 
void spawn(ArrayList<A_Sprite> sprites, int numberOfSprites, String classType)
{
  for (int i=0; i<numberOfSprites; i++)
  {
    int spawnPoint = int(random(4));
    switch(spawnPoint)
    {
    case 0:
      {
        if (classType.equals("Enemy"))
        {
          sprites.add(new Enemy(-random(50, 400), random(0, height)));
        } else if (classType.equals("Obstacle"))
        {
          sprites.add(new Obstacle(-random(50, 400), random(0, height)));
        }
        break;
      }
    case 1:
      {
        if (classType.equals("Enemy"))
        {
          sprites.add(new Enemy(width+random(50, 400), random(0, height)));
        } else if (classType.equals("Obstacle"))
        {
          sprites.add(new Obstacle(width+random(50, 400), random(0, height)));
        }
        break;
      }
    case 2:
      {
        if (classType.equals("Enemy"))
        {
          sprites.add(new Enemy(random(0, width), -random(50, 400)));
        } else if (classType.equals("Obstacle"))
        {
          sprites.add(new Obstacle(random(0, width), -random(50, 400)));
        }
        break;
      }
    case 3:
      {
        if (classType.equals("Enemy"))
        {
          sprites.add(new Enemy(random(0, width), (height-100)+random(50, 400)));
        } else if (classType.equals("Obstacle"))
        {
          sprites.add(new Obstacle(random(0, width), (height-100)+random(50, 400)));
        }
        break;
      }
    }
  }
}

//================create enemy wave==========================

// create subset array from the the origanal array. this subset represents each wave.
ArrayList<A_Sprite> createWave(ArrayList<A_Sprite> sprites, ArrayList<A_Sprite> currentWave, int size)
{
  if (size>sprites.size())
  {
    size=sprites.size();
  }
  int waveSize=0;
  int spawnOp=int(random(5));
  switch(spawnOp)
  {
  case 0:
    waveSize =int(random(1, size));
    break;
  case 1:
    waveSize =int(random(size, size*2));
    break;
  case 2:
    waveSize =int(random(size*2, size*3));
    break;
  case 3:
    waveSize =int(random(size*3, size*4));
    break;
  default:
    waveSize =int(random(size*4, size*5));
    break;
  }
  if (waveSize > sprites.size())
  {
    waveSize = sprites.size();
  }


  currentWave = new ArrayList<A_Sprite>(sprites.subList(0, waveSize));
  sprites.removeAll(currentWave);

  return currentWave;
}


//Print result of game to screen and add and sort score to determine if belongs it top ten.
void gameOver(String result)
{
  switch(result)
  {
  case "lose":
    fill(255, 0, 0);
    textSize(50);
    text("Game Over", (width/2.6), height/3);
    gameState = GameState.PAUSE;
    gameOverTime=millis();
    break;

  case "win":
    fill(255, 0, 0);
    textSize(50);
    text("Victory", (width/2.5), height/3);
    gameState = GameState.GAMEOVER;
    break;
  }
      String stringScore = Integer.toString(score);
      gameMenu.addAndSortScores(highScores ,stringScore);
}


//Check is lasers have struck enemies. 
boolean strikeChecking(Player currentPlayer, A_Sprite currentSprite)
{
  for (int i = currentPlayer.lasers.size()-1; i>=0; i--)
  {
    if (newPlayer.lasers.get(i).strike(currentSprite))
    {
      newPlayer.lasers.remove(i);
      return true;
    }
  }
  return false;
}


void gui() 
{
  scoreStr=Integer.toString(score);
  roundStr=Integer.toString(round);
  fill(0,0,255);
  fill(0);
  stroke(255,255,0);
  rect(2, height-100, width-3, 98, 9);
  fill(255,255,0);
  textSize(80);
  text(score, width-200, height-30);
  text("Round: "+round, 50, height-30);
}
//set speed based on game difficulty
void setSpeed()
{
    switch(myVar) 
    {
      case EASY:
        speed= .25;
        break;
      case MID:
         speed= .5;
        break;
      case HARD:
         speed= 1;
        break;
    }  
}


//Check if buttons have been pressed. 
void mousePressed()
{
  switch(gameState)
  {
  case MENU:
  {
  if (gameMenu.play.mouseOver)
  {
    gameState = GameState.GAME;
  }
  else if(gameMenu.easy.mouseOver)
  {
    myVar = Difficulty.EASY;
  }
  else if(gameMenu.medium.mouseOver)
  {
    myVar = Difficulty.MID;
  }
   else if(gameMenu.hard.mouseOver)
  {
    myVar = Difficulty.HARD;
  }
    else if(gameMenu.scores.mouseOver)
  {
    gameState = GameState.SCORES;
  }
     else if(gameMenu.quit.mouseOver)
  {
    exit();
  }
  }
  break;
  case GAMEOVER:
  {
     if(gameMenu.replay.mouseOver)
  {
    resetGame();
    gameState = GameState.GAME;
  }
     else if(gameMenu.menu.mouseOver)
  {
    resetGame();
    gameState = GameState.MENU;
  }
  }
  break;
  case SCORES:
  {
    if(gameMenu.menu.mouseOver)
  {
    resetGame();
    gameState = GameState.MENU;
  }
  }
  break;
}
}

//Set the colour of the menu buttons based on if moused over. 
void setDifficultyButtonColour()
{
 switch(myVar)
 {
 case EASY:
 gameMenu.easy.difficultySelected=true;
 gameMenu.medium.difficultySelected=false;
 gameMenu.hard.difficultySelected=false;
 break;
 case MID:
 gameMenu.easy.difficultySelected=false;
 gameMenu.medium.difficultySelected=true;
 gameMenu.hard.difficultySelected=false;
 break;
 case HARD:
 gameMenu.easy.difficultySelected=false;
 gameMenu.medium.difficultySelected=false;
 gameMenu.hard.difficultySelected=true;
 break;
 }
}

//Clear and reset game objects. 
void resetGame()
{
  enemies.clear();
  obstacles.clear();
  enemyWave.clear();
  obstaclesWave.clear();
  newPlayer.lasers.clear();
  explosions.clear();
  score=0;
  round=0;
  spawn(enemies, numberOfEnemies, createEnemy);
  spawn(obstacles, numberOfObstacles, createObstacle);
  wavePresent=false;
  newPlayer.pos.x=width/2;
  newPlayer.pos.y=300;
}

void draw()
{
  //Determine the game state. 
  switch (gameState)
  {
    case SPLASH:
    image(space, 0, 0);
    earth.splashAnimation();
    gameMenu.splashScreen();
    break;
    case MENU:
    image(space, 0, 0);
    gameMenu.homeMenu();
    setDifficultyButtonColour();
    break;
    case GAME:
    setSpeed();
    image(space, 0, 0);
     earth.animation();
  //Is a round already in progress, if not begin round.    
  if (!wavePresent)
  {
    enemyWave = createWave(enemies, enemyWave, 10);
    obstaclesWave = createWave(obstacles, obstaclesWave, 2);
    wavePresent=true;
    round++;
  }
  //Move and animate enemies.
  for (int i=enemyWave.size()-1; i>=0; i--)
  {
    Enemy e=(Enemy)enemyWave.get(i);
    e.move(earth.getEarthPosition());
    e.animation();
    //Check player collision.
    if (newPlayer.collision(e))
    {
      Explosion explosion = new Explosion(newPlayer.pos.x,newPlayer.pos.y);  
      explosion.explode();
      explosions.add(explosion);
      gameOver("lose");
    }
    //check goal collision. 
    if (earth.collision(e))
    {
      gameOver("lose");
    }

    //Check if lasers have struck enemies. Create explosion if collision occures. 
    if (strikeChecking(newPlayer, enemyWave.get(i)))
    {
      enemyWave.remove(e);
      Explosion explosion = new Explosion(e.pos.x,e.pos.y);  
      explosion.explode();
      explosions.add(explosion);
      //Increment score based on difficulty. 
    switch(myVar) 
    {
      case EASY:
        score++;
        break;
      case MID:
         score+=2;
        break;
      case HARD:
         score+=10;
        break;
    } 
     //Check if the player has destroyed all the enimies and won. 
      if (enemyWave.size()==0)
      {
        wavePresent=false;
        if (enemies.size()<1)
        {
          gameOver("win");
        }
      }
    }
  }
  //animate explosions. 
   if (explosions.size()>0)
  {
    for(int i=0; i<explosions.size();i++)
    {
      Explosion eX=(Explosion)explosions.get(i);
      eX.explosionDisplay();
    }
  }

//Move obstacles toword player.
  for (int j=obstaclesWave.size()-1; j>=0; j--)
  {
    Obstacle o=(Obstacle)obstaclesWave.get(j);
    o.move(newPlayer.pos);
    o.animation();

    //Check for collision between player and obstacles. 
    if (newPlayer.collision(o))
    {
      Explosion explosion = new Explosion(newPlayer.pos.x,newPlayer.pos.y);  
      explosion.explode();
      explosions.add(explosion);
      gameOver("lose");
    }
  }
  //move and animate player. 
  newPlayer.move();
  newPlayer.animation();
  //move and display lasers toward postion of mouse. 
  if (newPlayer.lasers.size()>0)
  {
    newPlayer.laserDisplay();
  }
  //If mouse is pressed then fire lasers. 
  if (mousePressed)
  {
    if (frameCount % 3 == 0)
    {
      PVector target = new PVector(mouseX, mouseY);
      newPlayer.fire(target);
    }
  }
  //show GUI
   gui();
break;
    //pause animation and stop movement for all objects except player explosion. 
    case PAUSE:
    
      if(millis() - gameOverTime > 1500)
      {
        gameState = GameState.GAMEOVER;
      }
      else 
      {
        image(space, 0, 0);
        earth.animation();
  for (int j=obstaclesWave.size()-1; j>=0; j--)
  {
    Obstacle o=(Obstacle)obstaclesWave.get(j);
    o.animation();
  }
  
 for (int i=enemyWave.size()-1; i>=0; i--)
  {
    Enemy e=(Enemy)enemyWave.get(i);
    e.animation();
  }
  
  for (int i=explosions.size()-1; i>=0; i--)
  {
    Explosion eX=(Explosion)explosions.get(i);
    for (int j=eX.debris.size()-1; j>=0; j--)
    {
      eX.explosionAnimation(eX.debris.get(j));
    }
  }
  
    for (int i=newPlayer.lasers.size()-1; i>=0; i--)
  {
    LaserBeam l = (LaserBeam)newPlayer.lasers.get(i);
    newPlayer.laserAnimation(l);
  }
  fill(255, 0, 0);
  textSize(50);
  text("Game Over", (width/2.6), height/3);
  Explosion eX=(Explosion)explosions.get(explosions.size()-1);
  eX.explosionDisplay(); 
  gui();
      }
    break;
    //display game over menu.
    case GAMEOVER:
      gameMenu.gameOverMenu();
    break;
    //Dipslay top ten scores. 
    case SCORES:
      gameMenu.scores(highScores);
    break;
}
}
