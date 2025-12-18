


//================Global Variables======================



ArrayList<A_Sprite> enemies = new ArrayList<>();
ArrayList<A_Sprite> enemyWave = new ArrayList<>();
ArrayList<A_Sprite> obstacles = new ArrayList<>();
ArrayList<A_Sprite> obstaclesWave = new ArrayList<>();
float speed;
int score;
int round;
String scoreStr;
String roundStr;
boolean wavePresent=false;
boolean obstaclesReleased=false;
int numberOfEnemies=200;
int numberOfObstacles=50;
String createEnemy = "Enemy";
String createObstacle = "Obstacle";
Goal earth;
Player newPlayer;
PImage space;
Difficulty myVar = Difficulty.MID;
GameMenu gameMenu = new GameMenu();
GameState gameState = GameState.SPLASH;
//================setup method==========================


enum GameState {
  SPLASH,
  MENU,
  GAME,
  GAMEOVER
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
  gui();
}


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
          sprites.add(new Enemy(-random(50, 200), random(0, height)));
        } else if (classType.equals("Obstacle"))
        {
          sprites.add(new Obstacle(-random(50, 200), random(0, height)));
        }
        break;
      }
    case 1:
      {
        if (classType.equals("Enemy"))
        {
          sprites.add(new Enemy(width+random(50, 200), random(0, height)));
        } else if (classType.equals("Obstacle"))
        {
          sprites.add(new Obstacle(width+random(50, 200), random(0, height)));
        }
        break;
      }
    case 2:
      {
        if (classType.equals("Enemy"))
        {
          sprites.add(new Enemy(random(0, width), -random(50, 200)));
        } else if (classType.equals("Obstacle"))
        {
          sprites.add(new Obstacle(random(0, width), -random(50, 200)));
        }
        break;
      }
    case 3:
      {
        if (classType.equals("Enemy"))
        {
          sprites.add(new Enemy(random(0, width), height+random(50, 200)));
        } else if (classType.equals("Obstacle"))
        {
          sprites.add(new Obstacle(random(0, width), height+random(50, 200)));
        }
        break;
      }
    }
  }
}

//================create enemy wave==========================

// create a subset array from the the origanal array. this subset will represent each wave.
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



void gameOver(String result)
{
  switch(result)
  {
  case "lose":
    fill(255, 0, 0);
    textSize(50);
    text("Game Over", (width/2.6), height/3);
    break;

  case "win":
    fill(255, 0, 0);
    textSize(50);
    text("Victory", (width/2.5), height/3);
    break;
  }

 gameState = GameState.GAMEOVER;
}



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

void setSpeed()
{
    switch(myVar) 
    {
      case EASY:
        speed= .5;
        break;
      case MID:
         speed= 1.5;
        break;
      case HARD:
         speed= 2;
        break;
    }  
}


void resetGame()
{
  enemies.clear();
  obstacles.clear();
  enemyWave.clear();
  obstaclesWave.clear();
  newPlayer.lasers.clear();
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
  switch (gameState)
  {
    case SPLASH:
    gameMenu.splashScreen();
    break;
    case MENU:
    image(space, 0, 0);
    gameMenu.homeMenu();
    if (mousePressed)
    switch(gameMenu.homeButtonSelect())
    {
      case 1:
      gameState = GameState.GAME;
      break;
      case 2:
      myVar = Difficulty.EASY;
      break;
      case 3:
      myVar = Difficulty.MID;
      break;
      case 4:
      myVar = Difficulty.HARD;
      break;
      case 5:
      break;
      case 6:
      exit();
      break;
    }
    break;
    case GAME:
    setSpeed();
  image(space, 0, 0);
  println(score);
  if (!wavePresent)
  {
    enemyWave = createWave(enemies, enemyWave, 10);
    obstaclesWave = createWave(obstacles, obstaclesWave, 2);
    wavePresent=true;
    round++;
  }
  for (int i=enemyWave.size()-1; i>=0; i--)
  {
    Enemy e=(Enemy)enemyWave.get(i);
    e.move(earth.getEarthPosition());
    e.animation();
    if (newPlayer.collision(e))
    {
      gameOver("lose");
    }
    if (earth.collision(e))
    {
      gameOver("lose");
    }


    if (strikeChecking(newPlayer, enemyWave.get(i)))
    {
      enemyWave.remove(e);
      
    switch(myVar) 
    {
      case EASY:
        score++;
        break;
      case MID:
         score+=2;
        break;
      case HARD:
         score+=3;
        break;
    } 
     
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



  for (int j=obstaclesWave.size()-1; j>=0; j--)
  {
    Obstacle o=(Obstacle)obstaclesWave.get(j);
    o.move(newPlayer.pos);
    o.animation();
    if (strikeChecking(newPlayer, obstaclesWave.get(j)))
    {
      obstaclesWave.remove(j);
      score++;
    }
    if (newPlayer.collision(o))
    {
      gameOver("lose");
    }
  }

  newPlayer.move();
  newPlayer.animation();
  earth.animation();
  if (newPlayer.lasers.size()>0)
  {
    newPlayer.laserDisplay();
  }
  if (mousePressed)
  {
    if (frameCount % 3 == 0)
    {
      PVector target = new PVector(mouseX, mouseY);
      newPlayer.fire(target);
    }
  }
  gui();
break;

    case GAMEOVER:
    if(mousePressed)
    {
    gameMenu.gameOverMenu();
    if(mousePressed)
    {
     switch(gameMenu.gameOverButtonSelect())
     {
      case 1:
      resetGame();
      gameState = GameState.GAME;
      break;
      case 2:
      resetGame();
      gameState = GameState.MENU;
      break;
     }
    }
    }
    break;
}
}
