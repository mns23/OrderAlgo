import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;

Bubble b[];
MySelectionSort s[];
PImage Backg;
PFont retrofont;
PFont valuefont;
int scelta = 0;
int menu_selection = 1;
int array_bubble = 0;
int array_selection = 0;
int ppp = 0;
Minim select_sound, enter_sound, back_sound;
AudioPlayer select_player, enter_player, back_player;

void setup()
{  
  Backg = loadImage("Backg.png");
  retrofont = loadFont("Code-48.vlw");
  valuefont = loadFont("TlwgTypo-Bold-48.vlw");
  
  size(860, 480);
  image(Backg, 0, 0);
  
  b = new Bubble[10];
  s = new MySelectionSort[10];
  
  for(int i=0; i<10; i++)
    {
      b[i]= new Bubble();
      s[i]= new MySelectionSort();
    }
    
  select_sound = new Minim(this);
  enter_sound = new Minim(this);
  back_sound = new Minim(this);
  select_player = select_sound.loadFile("sound_select_menu.mp3");
  enter_player = enter_sound.loadFile("sound_enter_menu.mp3");
  back_player = back_sound.loadFile("sound_back_menu.wav");
}

void draw()
{
  frameRate(70);
  switch(scelta)
  {
    case 0:
      displayMenu();
      break;
    case 1:
      array_bubble += b[array_bubble].getScorr_array_bubb();
      scelta = b[array_bubble].BubbleSort();
      break;
    case 2:
      array_selection += s[array_selection].getScorr_array_selection();
      scelta = s[array_selection].SelectionSort();
      break;
    case 3:
      scelta = 0;  
  }
}  
 
 void keyPressed()
 {
   if (key == CODED)
   {
     if (keyCode == UP)
     {
       select_player.play(700);
       menu_selection--;
       if (menu_selection < 1)
       menu_selection = 3;
     }
     else if (keyCode == DOWN)
     {
       select_player.play(700);
       menu_selection++;
       if(menu_selection > 3)
       menu_selection = 1;
     } 
   }
   if(key == ENTER)
   {
     enter_player.play(700);     
     scelta = menu_selection;  
   }
 }
 
 void displayMenu()
  {
    image(Backg, 0, 0);
    textFont(retrofont, 65);
    fill(#8CD88C);
    textAlign(CENTER);
    text("OrderAlgo", 430, 70);
    
    textSize(40);
    for(int i=0; i<4; i++)
    {
      if(i==menu_selection)
        fill(#FFFFFF);
      else
        fill(#8CD88C);
       
      if(i==1)
        text("BUBBLESORT", 430, 220);      
      else if(i==2)
        text("SELECTIONSORT", 430, 280);
      else if(i==3)
      {
        fill(#AFAFAF);
        if(i==menu_selection)
        fill(#CECECE);
        text("QUICKSORT", 430, 340);
      }  
    }
  }
  
  
  //RUMORE QUICK
