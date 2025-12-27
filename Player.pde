
//-------------------Player-------------------
class Player extends A_Sprite
{
  ArrayList<LaserBeam> lasers = new ArrayList<>();
  int playerSize=35;
  PVector pos;
  float speed=4;
  PImage[] moving;
  PVector dir;
  float angle;
  Player(float x, float y)
  {
    super(x,y);
    pos = new PVector(x,y);
   moving = new PImage[3];
   moving[0] = loadImage("00_ship.png");
   moving[1] = loadImage("01_ship.png");
   moving[2] = loadImage("02_ship.png");
   moving[0].resize(playerSize,playerSize);
   moving[1].resize(playerSize,playerSize);
   moving[2].resize(playerSize,playerSize);
  }

void laserDisplay()
{
  if(lasers.size()>0)
  {
   
    for(int i=0; i<lasers.size(); i++)
    {
      if(lasers.get(i).x<0 || lasers.get(i).y<0 || lasers.get(i).x>width || lasers.get(i).y>(height-100))
      {
       lasers.remove(i); 
      }
      else
      {
      lasers.get(i).move();
      laserAnimation(lasers.get(i));
      }
    }
  }
  return;
}

  void laserAnimation(LaserBeam l)
  {
    l.animation();
  }

boolean collision(A_Sprite sprite)
{
    float dis = dist(pos.x, pos.y, sprite.pos.x, sprite.pos.y);
     if(dis < sprite.size)
     {
       return true;
     }
     return false;
}


 void move() 
 {
   PVector target = new PVector(mouseX, mouseY);
   float dis = dist(pos.x, pos.y, target.x, target.y);
   if(dis < playerSize)
   {
     return;
   } else {
   float mappedSpeed=map(dis, 0, 50 , 0, 5);
   speed = constrain(mappedSpeed, 0, 5);
   //PVector target = new PVector(targetX,targetY);
   PVector dir = PVector.sub(target, pos); //calc vector from pos to target. 
   angle=dir.heading();
   dir.normalize(); // Set the length to 1.
   dir.mult(speed); // set the speed.
   pos.add(dir); // move
   }
 }
 

 
 
 void explode()
 {
   
 }

 void animation()
 {
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(angle+radians(90));
    int currentFrame = (frameCount / 5) % moving.length;
    image(moving[currentFrame], 0-playerSize/2, 0-playerSize/2);
    popMatrix();
 }
 
 
 void fire(PVector target)
 {
   PVector pos = new PVector(this.pos.x, this.pos.y);
   PVector velocity = PVector.sub(target, pos);
   float speed=10;
   velocity.setMag(speed);
   lasers.add(new LaserBeam(pos.x,pos.y,velocity));
 }
}
