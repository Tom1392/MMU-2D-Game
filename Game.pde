ArrayList<Enemy> enemies = new ArrayList<>(); 
ArrayList<Enemy> wave = new ArrayList<>();
ArrayList<Obstacle> obstacles = new ArrayList<>();
int score;
float speed;
boolean wavePresent=false;
//int EnemiesCounter;
int numberOfEnemies=200;
int numberOfObstacles=20;
Goal earth;
Player newPlayer;
void setup()
{
 size(1000, 1000);
 background(0);
 speed = 1.5;
 earth = new Goal(width/2, height/2);
 newPlayer= new Player(width/2, 300);
 
 for(int i=0; i<numberOfEnemies; i++)
  {
 int spawnPoint = int(random(4));
 switch(spawnPoint)
 {
   case 0: 
   {
     enemies.add(new Enemy(-random(50,200),random(0,height)));
   if(obstacles.size()<numberOfObstacles)
   {
   obstacles.add(new Obstacle(-random(50,200),random(0,height)));
   }
     break;
   }
   case 1:
   {
     enemies.add(new Enemy(width+random(50,200),random(0,height)));
     if(obstacles.size()<numberOfObstacles)
   {
   obstacles.add(new Obstacle(width+random(50,200),random(0,height)));
   }
     break;
   }
   case 2:
   {
     enemies.add(new Enemy(random(0,width),-random(50,200)));
       if(obstacles.size()<numberOfObstacles)
   {
   obstacles.add(new Obstacle(random(0,width),-random(50,200)));
   }
     break;
   }
   case 3:
   {
     enemies.add(new Enemy(random(0,width),height+random(50,200)));
        if(obstacles.size()<numberOfObstacles)
   {
   obstacles.add(new Obstacle(random(0,width),height+random(50,200)));
   }
     break;
   }
 }
}
}
// create a subset array from the the origanal array. this subset will represent each wave. 
ArrayList<Enemy> createWave(ArrayList<Enemy> enemies)
{
 int waveSize=0;
 int spawnOp=int(random(5)); 
 switch(spawnOp)
 {
  case 0:
  waveSize =int(random(1,10));
  wave = new ArrayList<Enemy>(enemies.subList(0, waveSize));
  enemies.removeAll(wave);
  break;
  case 1:
  waveSize =int(random(10,20));
  wave = new ArrayList<Enemy>(enemies.subList(0, waveSize));
  enemies.removeAll(wave);
  break;
  case 2:
  waveSize =int(random(20,30));
  wave = new ArrayList<Enemy>(enemies.subList(0, waveSize));
  enemies.removeAll(wave);
  break;
  case 3:
  waveSize =int(random(30,40));
  wave = new ArrayList<Enemy>(enemies.subList(0, waveSize));
  enemies.removeAll(wave);
  break;
  default:
  waveSize =int(random(40,50));
  wave = new ArrayList<Enemy>(enemies.subList(0, waveSize));
  enemies.removeAll(wave);
  break;
 }
  return wave;
}

void gameOver(String result)
{
       switch(result)
       {
       case "lose":  
       textSize(50);
       text("Game Over", (width/2.6), height/3);
       noLoop();
       break;
         
       case "win":
       textSize(50);
       text("Victory", (width/2.6), height/3);
       noLoop();
       break;
       }
}




void draw()
{
 if(enemies.size()==0)
 {
    gameOver("win");
 }
 else
 {
 background(0);
 if(!wavePresent)
 {
   wave = createWave(enemies);
   wavePresent=true;
 }
   for(int i=wave.size()-1;i>=0 ;i--)
   {
     Enemy e =wave.get(i);
     e.move(earth.getEarthPosition());
     e.animation();
     if(newPlayer.collision(e))
     {
       gameOver("lose");
     }
     if(earth.collision(e))
     {
       gameOver("lose");
     }
     else 
     {
     for(int j=newPlayer.lasers.size()-1;j>=0;j--)
     {
       if(newPlayer.lasers.get(j).strike(e))
       {
         wave.remove(e);
         newPlayer.lasers.remove(newPlayer.lasers.get(j));
         score++;
         println(score);
         if(wave.size()==0)
         {
          wavePresent=false; 
         }
       }
     }
   }
   }
   
   newPlayer.move();
   newPlayer.animation();
   earth.animation();
   if(newPlayer.lasers.size()>0) 
   {
   newPlayer.laserDisplay(); 
   }
   if(mousePressed)
  {
    if(frameCount % 2 == 0)
    {
  PVector target = new PVector(mouseX,mouseY);
  newPlayer.fire(target);
  }
  }
 }
}
