//-------------------Obstacle-------------------
class Obstacle extends A_Sprite
{
  int size=40;
  float speed;
  PImage[] moving;
  float angle;
  
  Obstacle(float x, float y)
  {
   super(x,y);
   pos = new PVector(x,y);
   speed=random(2,5);
   moving = new PImage[3];
   moving[0] = loadImage("00_enemyNimble.png");
   moving[1] = loadImage("01_enemyNimble.png");
   moving[2] = loadImage("02_enemyNimble.png");
   moving[0].resize(size,size);
   moving[1].resize(size,size);
   moving[2].resize(size,size);
  }

 void move(PVector target) 
 {
   PVector dir = PVector.sub(target, pos); //calc vector from pos to target. 
   angle=dir.heading();
   dir.normalize(); // Set the length to 1.
   dir.mult(speed); // set the speed.
   pos.add(dir); // move
   //println(speed);
 }

 void explode()
 {
   
 }

 void animation()
 {
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(angle+radians(270));
    int currentFrame = (frameCount / 5) % moving.length;
    image(moving[currentFrame], 0-size/2, 0-size/2);
    popMatrix();
 } 
}
