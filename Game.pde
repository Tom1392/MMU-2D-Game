ArrayList<Enemy> enemies = new ArrayList<>(); 
ArrayList<Enemy> wave = new ArrayList<>();
int score;
float speed;
boolean wavePresent=false;
int EnemiesCounter;
int numberOfEnemies=800;
Goal earth;

void setup()
{
 size(1000, 1000);
 background(0);
 speed = 1.5;
 earth = new Goal(width/2, height/2);
 
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
print(enemies.size());
}
// create a subset array from the the origanal array. this subset will represent each wave. 
ArrayList<Enemy> createWave(ArrayList<Enemy> enemies)
{
  print("createWave");
 int waveSize=0;
 int spawnOp=int(random(5)); 
 switch(spawnOp)
 {
  case 0:
  waveSize =int(random(10));
   print("use WaveSize");
  wave = new ArrayList<Enemy>(enemies.subList(0, waveSize));
  enemies.removeAll(wave);
  break;
  case 1:
  waveSize =int(random(50));
  print("use WaveSize");
  wave = new ArrayList<Enemy>(enemies.subList(0, waveSize));
  enemies.removeAll(wave);
  break;
  case 2:
  waveSize =int(random(100));
  print("use WaveSize");
  wave = new ArrayList<Enemy>(enemies.subList(0, waveSize));
  enemies.removeAll(wave);
  break;
  case 3:
  waveSize =int(random(200));
  print("use WaveSize");
  wave = new ArrayList<Enemy>(enemies.subList(0, waveSize));
  enemies.removeAll(wave);
  break;
  default:
  waveSize =int(random(500));
  print("use WaveSize");
  wave = new ArrayList<Enemy>(enemies.subList(0, waveSize));
  enemies.removeAll(wave);
  break;
 }
  return wave;
}






void draw()
{
 background(0);
 if(!wavePresent)
 {
   print("draw");
   wave = createWave(enemies);
   wavePresent=true;
   print(wave);
 }
   for(int i=0; i<wave.size();i++)
   {
     print(i);
     wave.get(i).move(earth.getEarthPosition());
     print("move");
     wave.get(i).animation();
     print("annimation");
   }  
   
   earth.animation();
 }
