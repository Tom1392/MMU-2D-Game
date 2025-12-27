class Explosion extends A_Sprite
{
   ArrayList<Debris> debris = new ArrayList<>();
   PVector pos;
   
   Explosion(float x, float y)
  {
    super(x, y);
    pos = new PVector(x,y);
  } 
  
  
  void explode()
  {
   for(int i=10; i>0;i--)
   {
    
   debris.add(new Debris(pos.x,pos.y));
   }
  }
  
  void explosionDisplay()
{
  if(debris.size()>0)
  {
   
    for(int i=0; i<debris.size(); i++)
    {
      if(debris.get(i).x<0 || debris.get(i).y<0 || debris.get(i).x>width || debris.get(i).y>height)
      {
       debris.remove(i); 
      }
      else
      {
      debris.get(i).move();
      explosionAnimation(debris.get(i));
      }
    }
  }
  return;
}
  
  void explosionAnimation(Debris d)
  {
    d.animation();
  }
  
}
