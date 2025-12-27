
//-------------------Sprite class-------------------

class A_Sprite
{
  float x;
  float y;
  float size;
  PVector pos;
  
 A_Sprite(float x, float y) 
 {
   this.x = x;
   this.y = y;
   pos= new PVector(x,y);
 }

 
 // Move Method
 void move() 
 {
   
 }
 //Animation method.
 void animation()
 {
   
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
}
