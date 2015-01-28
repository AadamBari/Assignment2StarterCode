PFont gamefont;//font for game statistics (lives etc)

void loading()//load files
{
  
  gamefont = loadFont("Unibody8-40.vlw");
  
}

void initialise()//reinitialise after life lost
{
  //reset the ball position and speed
  theBall.pos.x = width/2;
  theBall.pos.y = height/2;
  theBall.speedX = 15;
  theBall.speedY = 0;
  
  //reset player positions (The position of the paddles)
  p1.pos.x = p1.paddleW;
  p1.pos.y = (height / 2) - (p1.paddleH / 2);
  p2.pos.x = width - (2 * p2.paddleW);
  p2.pos.y = (height / 2) - (p2.paddleH / 2);
  
}
