

//-------------------Enemy-------------------
class Enemy extends A_Sprite
{
  int size=20;
  PVector pos;
  Enemy(float x, float y)
  {
   super(x,y);
   pos = new PVector(x,y);
  }



 // Move Method
 //Overloaded
 void move(PVector target) 
 {
   print("enemy move called!!!!");
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
   print("enemy annimation called!!!!");
   fill(255,0,0);
   ellipse(pos.x,pos.y,size,size);
 } 
}
