/*
    DIT OOP Assignment 2 Starter Code
    =================================
    
    Loads player properties from an xml file
    See: https://github.com/skooter500/DT228-OOP 
*/

ArrayList<Player> players = new ArrayList<Player>();
boolean[] keys = new boolean[526];
boolean devMode = false;
boolean sketchFullScreen() {
  return ! devMode;
}

Ball theBall;
Player p1;
Player p2;


void setup()
{
  //set screen size
    if (devMode)
  {
    size(800, 600);
  }
  else
  {
    size(displayWidth, displayHeight);
  }
  //false therefore splashscreen appears
  gamestart = false; 
  
  //Sets up class
  theBall = new Ball();
  setUpPlayerControllers();
  
  //Loads required fonts/sounds(See InputOutput tab)
  loading();
}

void draw()
{ 
  background(0);
  
  if(p1.lives <= 0 || p2.lives <= 0)
  {
    gameover(); //see GameMethods tab
  }
  else if(gamestart)
  {
    for(Player player:players)
    {
      player.update();
      player.display();
    }
    theBall.display();
    theBall.update();
  }
  else
  {
    splashscreen();
  }
  
}//end draw()



void keyPressed()
{
  keys[keyCode] = true;
}

void keyReleased()
{
  keys[keyCode] = false;
}

boolean checkKey(char theKey)
{
  return keys[Character.toUpperCase(theKey)];
}

char buttonNameToKey(XML xml, String buttonName)
{
  String value =  xml.getChild(buttonName).getContent();
  if ("LEFT".equalsIgnoreCase(value))
  {
    return LEFT;
  }
  if ("RIGHT".equalsIgnoreCase(value))
  {
    return RIGHT;
  }
  if ("UP".equalsIgnoreCase(value))
  {
    return UP;
  }
  if ("DOWN".equalsIgnoreCase(value))
  {
    return DOWN;
  }
  //.. Others to follow
  return value.charAt(0);  
}

void setUpPlayerControllers()
{
  XML xml = loadXML("arcade.xml");
  XML[] children = xml.getChildren("player");
  int gap = width / (children.length + 1);
  
  
    XML playerXML1 = children[0];
    p1 = new Player(
            1
            , color(255)
            , playerXML1);

    p1.pos.x = p1.paddleW;
    p1.pos.y = (height / 2) - (p1.paddleH / 2);
    p1.lives = 3;
   players.add(p1);         
  
   
  XML playerXML2 = children[1]; 
  p2 = new Player(
            2
            , color(255)
            , playerXML2);

    p2.pos.x = width - (2 * p2.paddleW);
    p2.pos.y = (height / 2) - (p2.paddleH / 2);
    p2.lives = 3;
   players.add(p2); 
  
}//end setUpPlayerCotrollers()
