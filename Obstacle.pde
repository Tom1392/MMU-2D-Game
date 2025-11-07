//-------------------Obstacle-------------------
class Obstacle extends A_Sprite
{
  int size=20;
  PVector pos;
  float speed=3;
  Obstacle(float x, float y)
  {
   super(x,y);
   pos = new PVector(x,y);
  }



 // Move Method
 //Overloaded
 void move(PVector target) 
 {
   PVector dir = PVector.sub(target, pos); //calc vector from pos to target. 
   dir.normalize(); // Set the length to 1.
   dir.mult(this.speed); // set the speed.
   pos.add(dir); // move
 }
 //Explode method.
 void explode()
 {
   
 }
 //Animation method.
 void animation()
 {
   stroke(255,0,0);
   strokeWeight(2);
   rect(pos.x,pos.y,pos.x*2, pos.x*2);
 } 
}
