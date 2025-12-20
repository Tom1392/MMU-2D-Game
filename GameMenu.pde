class GameMenu implements B_menu
{
     
     int gameOverPause=1000;
     int splashStartTime;
     int splashDuration = 2000;
     boolean displaySplash = true;
     Button play = new Button(200, "PLAY");
     Button easy = new Button(280, "EASY");
     Button medium = new Button(360, "MEDIUM");
     Button hard = new Button(440, "HARD");
     Button scores = new Button(520, "SCORES");
     Button quit = new Button(600, "QUIT");
     
     Button replay = new Button(426, "REPLAY");
     Button menu = new Button(502, "MENU");
     
  GameMenu() 
  {
    splashStartTime = millis(); // runs once when object is created
  }
  
  
  
   void splashScreen()
   {
     background(0);
     fill(255,255,0);
     textSize(50);
     text("Earth Defender", (width/3), height/3);
     if (millis() - splashStartTime > splashDuration) 
     {
     gameState = GameState.MENU;
     }
   }
   
   
   void homeMenu()
 {
   fill(0);
   stroke(255,255,0);
   rect(width/3, height/5, 333, 500, 9);
   play.displayButton(); 
   easy.displayButton(); 
   medium.displayButton(); 
   hard.displayButton(); 
   scores.displayButton(); 
   quit.displayButton();
   
   play.overButton(); 
   easy.overButton(); 
   medium.overButton(); 
   hard.overButton(); 
   scores.overButton(); 
   quit.overButton(); 
 }
 
//void gameOverPause(int gameOverTime)
//{
//  print("pause");
//   gameOverStartTime=millis();
//   if(millis() - gameOverStartTime > gameOverPause)
//   {
//     print("call GameoVer");
//     gameOverMenu();
//   }
//}

 

 
//int homeButtonSelect()
//{
//  if(play.overButton())
//  return 1;
//  else if(easy.overButton())
//  return 2;
//  else if(medium.overButton())
//  return 3;
//  else if(hard.overButton())
//  return 4;
//  else if(scores.overButton())
//  return 5;
//  else if(quit.overButton())
//  return 6;
//  else return 0;
//}
 
 void gameOverMenu()
 {
   stroke(255,255,0);
   fill(0);
   rect(width/3, 400, 333, 180, 9);
   replay.displayButton();
   menu.displayButton();
   
   replay.overButton(); 
   menu.overButton();
 }
 
 //int gameOverButtonSelect()
 //{
 // if(replay.overButton())
 // return 1;
 // else if(menu.overButton())
 // return 2;
 // else
 // return 0;
 //}
   void buttonCheck(){}
}
