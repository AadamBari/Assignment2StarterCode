PFont gamefont;
PFont gamefont2;

import ddf.minim.*;

Minim minim;
AudioPlayer p1Sound;
AudioPlayer p2Sound;
AudioPlayer wallHit;
AudioPlayer roundSound;

void loading()//load files
{
  //Allow Minim to access data directory where it loads sound files
  minim = new Minim(this);
  p1Sound = minim.loadFile("Blip_Select20.wav");
  p2Sound = minim.loadFile("Blip_Select21.wav");
  wallHit = minim.loadFile("Hit_Hurt8.wav");
  roundSound = minim.loadFile("Powerup2.wav");
  
  gamefont = loadFont("Unibody8-40.vlw");
  gamefont2 = loadFont("V5ProphitDot-40.vlw");
  
}//end loading()

