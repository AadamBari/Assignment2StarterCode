
void initialise()//reinitialise after life lost
{
  //producing random number of either 1 or -1
  int r = int(random(-1, 1));
  while (r == 0)
  {
    r = int(random(-1, 1));
  }
  //reset the ball position and speed
  theBall.pos.x = width/2;
  theBall.pos.y = height/2;
  theBall.speedY = 0;
  theBall.speedX = 15 * r;//random left and right direction
  
  //reset player positions (The position of the paddles)
  p1.pos.x = p1.paddleW;
  p1.pos.y = (height / 2) - (p1.paddleH / 2);
  p2.pos.x = width - (2 * p2.paddleW);
  p2.pos.y = (height / 2) - (p2.paddleH / 2);
  
  //sound effect for new round after life is lost
  roundSound.play();
  roundSound.rewind();
  
}//end initialise()

boolean gamestart;//toggle for spalsh screen

void splashscreen()
{
  //game title
   fill(255);
   textFont(gamefont, width/10);
   textAlign(CENTER, CENTER);
   text("|  PONG  |" , width/2, height/5);
   
   String instructions1 = "INSTRUCTIONS:\n Don't allow the ball to pass behind your paddle!";
   String instructions2 = "\n Use keys to move your paddle and deflect the ball!";
   String instructions3 = "\n It's pong not rocket science.";
   textFont(gamefont2, width/50);
   text(instructions1+instructions2+instructions3, width/2, height/2);
   
   //flash effect text
   String flashtext = "PRESS ANY KEY TO START";
   int s = second();
   if (s % 2 == 0)
   {
     fill(255);
     textFont(gamefont, width/50);
     text(flashtext, width/2, (height - height/10) );
   }
   else
   {
     fill(0);
     textFont(gamefont, width/50);
     text(flashtext, width/2, (height - height/10) );
   }
   
  
  if (keyPressed)
  {
    gamestart = true;
  }
  
}//end splashscreen()

void gameover()
{
  fill(255);
  textAlign(CENTER, CENTER);
  
  //Game over text
  textFont(gamefont, width/10);
  text("GAME OVER" , width/2, height/2);
  
  if(p1.lives <= 0)//if player 1 loses
  {
    textFont(gamefont2, width/25);
    text("PLAYER 2 WINS!" , width/2, height/5);
  }
  else if(p2.lives <= 0)//if player 2 loses
  {
    textFont(gamefont2, width/25);
    text("PLAYER 1 WINS!" , width/2, height/5);
  }
  
  //textFont(gamefont, width/30);
  //text("press any key to play again" , width/2, (height - height/5));
  
  //flash effect text for game over screen
   String flashtext = "press any key to play again";
   int s = second();
   if (s % 2 == 0)
   {
     fill(255);
     textFont(gamefont, width/30);
     text(flashtext, width/2, (height - height/5) );
   }
   else
   {
     fill(0);
     textFont(gamefont, width/30);
     text(flashtext, width/2, (height - height/5) );
   }
  
    
  if (keyPressed)//reset lives and reinitialise
  {
    p1.lives = 3;
    p2.lives = 3;
    initialise();
  }
  
}//end gameover()
