/*
    DIT OOP Assignment 2 Starter Code
    =================================
    
    Loads player properties from an xml file
    See: https://github.com/skooter500/DT228-OOP 
*/

ArrayList<Player> players = new ArrayList<Player>();
boolean[] keys = new boolean[526];

void setup()
{
  size(1000, 750);
  
  setUpPlayerControllers();
}

void draw()
{ 
  background(0);
  for(Player player:players)
  {
    player.update();
    player.display();
  }
}

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
    Player p1 = new Player(
            1
            , color(255)//(random(0, 255), random(0, 255), random(0, 255))
            , playerXML1);

    p1.pos.x = p1.paddleW;
    p1.pos.y = width / 2;
   players.add(p1);         
  
   
  XML playerXML2 = children[1]; 
  Player p2 = new Player(
            2
            , color(255)//(random(0, 255), random(0, 255), random(0, 255))
            , playerXML2);

    p2.pos.x = width - (2 * p2.paddleW);
    p2.pos.y = width / 2;
   players.add(p2); 
  
}
