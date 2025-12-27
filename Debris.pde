//-------------------LaserBeam-------------------
class Debris extends A_Sprite
{
  PVector velocity;
  float debrisWidth;
  float debrisLength;
  float speed;
  Debris(float x, float y )
  {
    super(x, y);
    speed=random(2,10);
    debrisWidth=random(10);
    debrisLength=random(10);
    PVector target = new PVector(random(1000), random(1000));
   velocity = PVector.sub(target, pos);
   velocity.setMag(speed);
  }
  
    void move()
  {
   this.x += velocity.x;
   this.y += velocity.y;
  }
  

  void animation()
  {
   stroke(#FF7300);
   strokeWeight(1);
   fill(255,255,0);
   ellipse(x,y,debrisWidth,debrisLength);
  }
}
