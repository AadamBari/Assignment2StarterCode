class Ball
{
  
  PVector pos;
  float ballRad;
  
  Ball()
  {
    pos = new PVector(width/2, height/2);
    ballRad = width/50;
    
  }
  
  
  void display()
  {
    stroke(255);
    fill(255); 
    ellipse(pos.x, pos.y, ballRad, ballRad);
    
  }
}//end Ball

