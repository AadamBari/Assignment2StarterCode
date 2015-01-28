class Player
{
  PVector pos;
  char up;
  char down;
  char left;
  char right;
  char start;
  char button1;
  char button2;
  int index;
  color colour;
  int paddleH;
  int paddleW;
  float speed;
  int lives;
 
  public Player()
  {
    pos = new PVector(width / 2, height / 2);
    paddleH = height/6;
    paddleW = width/100; 
    speed = 10;
  }
  
  Player(int index, color colour, char up, char down, char left, char right, char start, char button1, char button2)
  {
    this();
    this.index = index;
    this.colour = colour;
    this.up = up;
    this.down = down;
    this.left = left;
    this.right = right;
    this.start = start;
    this.button1 = button1;
    this.button2 = button2;
  }
  
  Player(int index, color colour, XML xml)
  {
    this(index
        , colour
        , buttonNameToKey(xml, "up")
        , buttonNameToKey(xml, "down")
        , buttonNameToKey(xml, "left")
        , buttonNameToKey(xml, "right")
        , buttonNameToKey(xml, "start")
        , buttonNameToKey(xml, "button1")
        , buttonNameToKey(xml, "button2")
        );
  }
  
  void update()
  {
    if (checkKey(up) && pos.y > 0)//constrain paddle to screen
    {
      pos.y -= speed;
    }
    if (checkKey(down) && pos.y < height - paddleH)//constrain paddle to screen
    {
      pos.y += speed;
    }
    /*
    if (checkKey(left))
    {
      pos.x -= 1;
    }    
    if (checkKey(right))
    {
      pos.x += 1;
    }
    */
    if (checkKey(start))
    {
      println("Player " + index + " start");
    }
    if (checkKey(button1))
    {
      println("Player " + index + " button 1");
    }
    if (checkKey(button2))
    {
      println("Player " + index + " butt2");
    }    
  }
  
  void display()
  {    
    
    //draw paddles
    smooth();
    fill(colour);  
    rect(pos.x, pos.y, paddleW, paddleH);
    
    //draw background details
    stroke(colour);
    line(width/2, 0, width/2, height);
    noFill();
    rect(1, 1, width-2, height-2);
    ellipse(width/2, height/2, width/4, height/3);
       
    //draw game statistics
    textFont(gamefont, width/10);
    textAlign(LEFT, TOP);
    text(p1.lives , width/7, height/7);
    textAlign(RIGHT, TOP);
    text(p2.lives , (width - width/7), height/7);
  }  
}
