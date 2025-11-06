//-------------------Player-------------------
class Player extends A_Sprite
{
  ArrayList<LaserBeam> lasers = new ArrayList<>();
  int playerSize=30;
  PVector pos;
  
  int angle;
  float rad;
  
  Player(int x, int y)
  {
    super(x,y);
    pos = new PVector(x,y);
  }


void laserDisplay()
{
  println("step 5");
  while(lasers.size()>0)
  {
   
    for(int i=0; i<lasers.size(); i++)
    {
      if(lasers.get(i).x<0 || lasers.get(i).y<0 || lasers.get(i).x>width || lasers.get(i).y>height)
      {
       lasers.remove(i); 
      }
      else
      {
       println("step 6");
      lasers.get(i).move();
      lasers.get(i).animation();
      }
    }
  }
  return;
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
   println("Player Aimation");
  float r=playerSize;
  if(keyPressed)
  {
    if(key == 'A' || key == 'a') 
    {
      if(frameCount % 0.5d == 0)
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
    println(angle);
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
   println("step 2");
   lasers.add(new LaserBeam(int(pos.x),int(pos.y),target));
 }
}
