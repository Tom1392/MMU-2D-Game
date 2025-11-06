ArrayList<Enemy> enemies = new ArrayList<>(); 
ArrayList<Enemy> wave = new ArrayList<>();
int score;
float speed;
boolean wavePresent=false;
int EnemiesCounter;
int numberOfEnemies=800;
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
     break;
   }
   case 1:
   {
     enemies.add(new Enemy(width+random(50,200),random(0,height)));
     break;
   }
   case 2:
   {
     enemies.add(new Enemy(random(0,width),-random(50,200)));
     break;
   }
   case 3:
   {
     enemies.add(new Enemy(random(0,width),height+random(50,200)));
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
  waveSize =int(random(10,50));
  wave = new ArrayList<Enemy>(enemies.subList(0, waveSize));
  enemies.removeAll(wave);
  break;
  case 2:
  waveSize =int(random(50,100));
  wave = new ArrayList<Enemy>(enemies.subList(0, waveSize));
  enemies.removeAll(wave);
  break;
  case 3:
  waveSize =int(random(100,200));
  wave = new ArrayList<Enemy>(enemies.subList(0, waveSize));
  enemies.removeAll(wave);
  break;
  default:
  waveSize =int(random(200,500));
  wave = new ArrayList<Enemy>(enemies.subList(0, waveSize));
  enemies.removeAll(wave);
  break;
 }
  return wave;
}

void mouseClicked()
{
  println("step 1");
  PVector target = new PVector(mouseX,mouseY);
  newPlayer.fire(target);
}





void draw()
{

 background(0);
 if(!wavePresent)
 {
   wave = createWave(enemies);
   wavePresent=true;
 }
   for(int i=0; i<wave.size();i++)
   {
     wave.get(i).move(earth.getEarthPosition());
     wave.get(i).animation();
   }  
   newPlayer.move();
   newPlayer.animation();
   earth.animation();
   if(newPlayer.lasers.size()>0) { println("step 4"); newPlayer.laserDisplay(); }
 }
