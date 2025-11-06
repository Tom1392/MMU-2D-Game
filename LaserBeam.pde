//-------------------LaserBeam-------------------
class LaserBeam extends A_Sprite
{
  PVector target;
  PVector pos;
  
  LaserBeam(int x, int y, PVector target)
  {
    super(x, y);
    println("step 3");
    pos = new PVector(x,y);
    this.target=target;
  }

  void move()
  {
    println("step 7");
   PVector dir = PVector.sub(target, pos); //calc vector from pos to target. 
   dir.normalize(); // Set the length to 1.
   dir.mult(speed); // set the speed.
   pos.add(dir); // move
  }


  //Overloaded
  void animation()
  {
     println("step 8");
    pushMatrix();
    translate(pos.x,pos.y);
    stroke(0, 255, 0);
    strokeWeight(2);
    ellipse(pos.x,pos.y,20,20);
    popMatrix();
  }
}
