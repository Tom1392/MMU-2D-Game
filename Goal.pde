//-------------------Goal-------------------
class Goal extends A_Sprite
{
    PVector pos;
    
    Goal(float x, float y)
  {
    super(x,y);
    pos = new PVector(x,y);
  }
  
  PVector getEarthPosition()
  {
   return pos; 
  }
  
   //Animation method.
 void animation()
 {
   fill(255);
   noStroke();
   ellipse(pos.x,pos.y,50,50);
 }
  
}  
