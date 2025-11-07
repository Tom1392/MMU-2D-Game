
//-------------------Sprite class-------------------

class A_Sprite
{
  float x;
  float y;
  float size=20;
  PVector pos;
  
 A_Sprite(float x, float y) 
 {
   this.x = x;
   this.y = y;
   pos= new PVector(x,y);
 }

 
 // ----------Getters and setters----------- 
 
 float getX()
 {
   return x;
 }
 
  float getY()
 {
   return y;
 }
 
 void setX(float x)
 {
   this.x = x;
 }
 
  void setY(float y)
 {
   this.y = y;
 }
 
 
 // Move Method
 void move() 
 {
   
 }
 //Explode method.
 void explode()
 {
   
 }
 //Animation method.
 void animation()
 {
   
 }
}
