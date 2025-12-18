class GameMenu implements B_menu
{
     int splashStartTime;
     int splashDuration = 2000;
     boolean displaySplash = true;
     float buttonX=350;
     float buttonWidth=300;
     float buttonHieght=50;
     int buttonCorners=9;
  
  GameMenu() 
  {
    splashStartTime = millis(); // runs once when object is created
  }
  
  
  
   void splashScreen()
   {
     background(0);
     fill(255,255,255);
     textSize(50);
     text("Space Battle", (width/2.6), height/3);
     if (millis() - splashStartTime > splashDuration) 
     {
     gameState = GameState.MENU;
     }
   }
   
   
   void homeMenu()
 {
   fill(0);
   rect(width/3, height/5, 333, 500, 9);
   button(200, "Play");
   button(280, "EASY");
   button(360, "MEDIUM");
   button(440, "HARD");
   button(520, "SCORES");
   button(600, "QUIT");
 }
 

  void button(int buttonY, String txt)
  {
    textSize(50);
    fill(0);
    rect(buttonX, buttonY, buttonWidth, buttonHieght, buttonCorners);
    fill(255, 255, 0);
    text(txt, width/2-140, buttonY+40);
  }
 
boolean overButton(float buttonY)  {
  if (mouseX >= buttonX && mouseX <= buttonX+buttonWidth && mouseY >= buttonY && mouseY <= buttonY+buttonHieght) {
    return true;
  } else {
    return false;
  }
}
 
int homeButtonSelect()
{
  if(overButton(200))
  return 1;
  else if(overButton(280))
  return 2;
  else if(overButton(360))
  return 3;
  else if(overButton(440))
  return 4;
  else if(overButton(520))
  return 5;
  else if(overButton(600))
  return 6;
  else return 0;
}
 
 void gameOverMenu()
 {
   fill(0);
   rect(width/3, 400, 333, 180, 9);
   button(426, "REPLAY");
   button(502, "MENU");
 }
 
 int gameOverButtonSelect()
 {
  if(overButton(426))
  return 1;
  else if(overButton(502))
  return 2;
  else
  return 0;
 }
   void buttonCheck(){}
}
