class Button
{
  float buttonX=350;
  float buttonWidth=300;
  float buttonHieght=50;
  int buttonCorners=9;
  float buttonY;
  String txt;
  boolean mouseOver=false;
  int mouseOverColour=#E300BD;
  
  Button(int buttonY, String txt)
  {
  this.buttonY=buttonY;
  this.txt=txt;
  }
  
  //Display Button
  void displayButton()
  {
    if(mouseOver)
    {
     stroke(mouseOverColour); 
    }
    else 
    {
      stroke(255,255,0);
    }
    textSize(50);
    fill(0);
    rect(buttonX, buttonY, buttonWidth, buttonHieght, buttonCorners);
    fill(255, 255, 0);
    text(txt, width/2-140, buttonY+40);
  }
  
  boolean overButton()  
  {
  return mouseOver=(mouseX >= buttonX && mouseX <= buttonX+buttonWidth && mouseY >= buttonY && mouseY <= buttonY+buttonHieght); 
  }
  
  Boolean buttonIsPressed()
  {
   return mouseOver; 
  }

}
