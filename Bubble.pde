class Bubble
{
  Rettangolo r[]= new Rettangolo[10];
  int dist=58;
  int quadratino=15;
  int i=0;
  int j=0;
  int cont=0;
  int sel_count = 0;
  int scorr_array_bubb = 0;
  
  Bubble()
  {
    for(int i=0; i<10; i++)
    {
      int val=(int)random(1, 20);
      r[i]= new Rettangolo(150+i*dist, 440-val*quadratino, val, quadratino);
    }
  }
    
  void display(int j)
  {
    image(Backg, 0, 0);
    
    color c1 = #8CD88C;
    color c2 = #03FF11;
    
    for(int i=0; i<10; i++)
    {
      if (i==j || i==j+1)
      r[i].displayForBubble(c2);
      else
      r[i].displayForBubble(c1);
    }
  }
  
  boolean scambia(Rettangolo ret1, Rettangolo ret2)
  {
    boolean vai = true;
        
    vai = ret1.move_rect_x(ret2.getXprec());
    vai = ret2.move_rect_x(ret1.getXprec());
    return vai;    
  }
  
  int getScorr_array_bubb()
  {
    return scorr_array_bubb;
  }
  
  int BubbleSort()
  { 
    boolean continua = false;
    
    if(sel_count==50) //
    {    
    while(i<9 && sel_count!=0)
    {
      while(j<9 && sel_count!=0)
      {
        if(r[j].getValore() > r[j+1].getValore())
        {          
          continua = scambia(r[j], r[j+1]);
          
          if(continua==false)
          {  
            r[j].aggiornaXprec();
            r[j+1].aggiornaXprec();
            
            Rettangolo k = r[j];
            r[j] = r[j+1];
            r[j+1] = k;           
          }                         
        }
        if (continua==false)
        {
          j++;
          sel_count = 0;
        }
        else
        break;
      }
      if (continua==false && j==9)
      {
        i++;
        j=0;
        sel_count = 0;
      }
      else
      break;      
    }
    }
    if(sel_count < 50)
    sel_count++;
    if(i<9)   
    display(j);
    else
    display(-2);
    
    if(keyPressed)
    {
      if(key=='b')
      {
        back_player.play(0);
        scorr_array_bubb = 1;
        return 0;
      }
    }
    
    return 1;
  }  
}
