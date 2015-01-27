class Ball extends Player
{
  
  PVector pos;
  float ballSize;
  float speedX;
  float speedY;
  
  Ball()
  {
    pos = new PVector(width/2, height/2);
    ballSize = width/50;
    speedX = 10;
    speedY = 0;
    
  }
  
  void display()
  {
    stroke(255);
    fill(255); 
    ellipse(pos.x, pos.y, ballSize, ballSize);
    
  }
  
  void update()
  {
    
    pos.x += speedX;
    pos.y += speedY;
    
    //right paddle hit detection
    if (pos.x >= p2.pos.x - (ballSize/2) &&  (pos.y + ballSize/2) >= p2.pos.y  && + pos.y <= (p2.pos.y + p2.paddleH)   )
    {
      speedX *= -1;//reverse dirction of ball
    }
    
    
    
   /* if (pos.x >= p2.pos.x - (ballSize/2) || pos.x <= (p1.pos.x + p1.paddleW) + (ballSize/2))
    {
      speedX *= -1;
    }
    
    if (pos.y >= height - (ballSize/2) || pos.y <= 0 + (ballSize/2))
    {
      speedY *= -1;
    }
    
    //if (pos.y >= height - (ballSize/2) || pos.y <
    /*
    if (pos.x >= width - (ballSize/2) || pos.x <= 0)
    {
      speedX *= -1;
    }*/
    
  }
}//end Ball

