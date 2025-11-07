//-------------------LaserBeam-------------------
class LaserBeam extends A_Sprite
{
  PVector velocity;
  
  LaserBeam(float x, float y, PVector velocity)
  {
    super(x, y);
    this.velocity=velocity;
  }

  void move()
  {
   this.x += velocity.x;
   this.y += velocity.y;
  }

  boolean strike(A_Sprite sprite)
  {
    
    float dis = dist(this.x, this.y, sprite.pos.x, sprite.pos.y);
     if(dis <= sprite.size)
     {
       println(sprite.size);
       println(dis);
       return true;
     }
     return false;
  }

  //Overloaded
  void animation()
  {
    pushMatrix();
    translate(this.x,this.y);
    stroke(0, 255, 0);
    strokeWeight(2);
    line(velocity.x, velocity.y, velocity.x*2, velocity.y*2);
    popMatrix();
  }
}
