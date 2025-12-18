//-------------------Player-------------------
class Player extends A_Sprite
{
  ArrayList<LaserBeam> lasers = new ArrayList<>();
  int playerSize=30;
  PVector pos;
  int angle;
  int speed=4;
  
  Player(float x, float y)
  {
    super(x,y);
    pos = new PVector(x,y);
  }

void laserDisplay()
{
  if(lasers.size()>0)
  {
   
    for(int i=0; i<lasers.size(); i++)
    {
      if(lasers.get(i).x<0 || lasers.get(i).y<0 || lasers.get(i).x>width || lasers.get(i).y>height)
      {
       lasers.remove(i); 
      }
      else
      {
      lasers.get(i).move();
      lasers.get(i).animation();
      }
    }
  }
  return;
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


 // Move Method
 //Overloaded
 void move() 
 {
   float targetX=map(mouseX, 0,width, 0, width);
   float targetY=map(mouseY, 0,height,0,height);
   PVector target = new PVector(targetX,targetY);
   PVector dir = PVector.sub(target, pos); //calc vector from pos to target. 
   dir.normalize(); // Set the length to 1.
   dir.mult(speed); // set the speed.
   pos.add(dir); // move
 }
 

 
 //Explode method.
 void explode()
 {
   
 }
 //Animation method.
 void animation()
 {
  float r=playerSize;
  if(keyPressed)
  {
    if(key == 'A' || key == 'a') 
    {
      if(frameCount % 0.5 == 0)
      {
        if(angle>0)
          {
          angle--;
          }
        else
        {
        angle=360;  
        }
      }
    }
    if(key == 'D' || key == 'd') 
    {
      if(frameCount % 0.5 == 0)
        {
        if(angle<360)
          {
           angle++; 
          }
        else
          {
           angle=0; 
          }
      }
    }
  }
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(radians(angle));
    fill(0);
    stroke(255);
    strokeWeight(2);
    triangle(0, 0-r/2, 0+r/3, 0+r/2, 0-r/3, 0+r/2);
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
