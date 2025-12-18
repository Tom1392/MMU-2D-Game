//-------------------Obstacle-------------------
class Obstacle extends A_Sprite
{
  int size=20;
  float speed;
  Obstacle(float x, float y)
  {
   super(x,y);
   pos = new PVector(x,y);
   speed=random(2,4);
  }

 // Move Method
 //Overloaded
 void move(PVector target) 
 {
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
   stroke(0,0,255);
   strokeWeight(2);
   fill(0,0,255);
   ellipse(pos.x, pos.y, size,size);
   //rect(pos.x,pos.y,pos.x*2, pos.y*2);
 } 
}
