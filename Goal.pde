//-------------------Goal-------------------
class Goal extends A_Sprite
{
    PVector pos;
    PImage[] moving;
    int size=50;
    boolean resized=false;
    
    Goal(float x, float y)
  {
   super(x,y);
   pos = new PVector(x,y);
   moving = new PImage[6];
   moving[0] = loadImage("Pixel Earth1.png");
   moving[1] = loadImage("Pixel Earth2.png");
   moving[2] = loadImage("Pixel Earth3.png");
   moving[3] = loadImage("Pixel Earth4.png");
   moving[4] = loadImage("Pixel Earth5.png");
   moving[5] = loadImage("Pixel Earth6.png");
  }
  
  PVector getEarthPosition()
  {
   return pos; 
  }
  
  boolean collision(Enemy enemy)
{
    float dis = dist(pos.x, pos.y, enemy.pos.x, enemy.pos.y);
     if(dis < enemy.size)
     {
       return true;
     }
     return false;
}
  
   //Animation method.
 void animation()
 {
   if(!resized)
   {
   moving[0].resize(size,size);
   moving[1].resize(size,size);
   moving[2].resize(size,size);
   moving[3].resize(size,size);
   moving[4].resize(size,size);
   moving[5].resize(size,size);
   resized=true;
   }
  int currentFrame = (frameCount / 15) % moving.length;
  image(moving[currentFrame], pos.x-size/2, pos.y-size/2);
 }
  
void splashAnimation()
{
  int currentFrame = (frameCount / 15) % moving.length;
  image(moving[currentFrame], width/2+100, height/2+100);
}
  
  
}  
