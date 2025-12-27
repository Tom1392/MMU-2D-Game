class GameMenu implements B_menu
{
     
     int gameOverPause=1000;
     int splashStartTime;
     int splashDuration = 3000;
     boolean displaySplash = true;
     boolean scoresPrinted=false;
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
     fill(255,255,0);
     textSize(100);
     text("Earth Defender", (width/5), height/3);
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
 
 
 void gameOverMenu()
 {
   menu.buttonY=502;
   stroke(255,255,0);
   fill(0);
   rect(width/3, 400, 333, 180, 9);
   replay.displayButton();
   menu.displayButton();
   
   replay.overButton(); 
   menu.overButton();
 }
 
 void scores(Scores scores)
 {
   scoresPrinted=false; 
   
   if(!scoresPrinted)
   {
   int label=0;
   String space="      ";
   menu.buttonY=610;
   fill(0);
   stroke(255,255,0);
   rect(width/3, height/5, 333, 500, 9);
   fill(255, 255, 0);
   textSize(38);
   text("TOP TEN SCORES", width/2-140, 230); 
   for (int i = 0 ; i < scores.topTenScores.length; i++) 
   {
   textSize(25);
   label=i+1; 
   if(label==10)
   {
    space="   "; 
   }
   text("["+label+"]"+space+scores.topTenScores[i], 380, 290+(i*30));
   }
   scoresPrinted=true;
   }
   menu.displayButton();
   menu.overButton();
 }
 
 
  void addAndSortScores(Scores scores, String newScore)
  {
   scores.addScore(newScore);
   scores.sortScores();
  }
}
