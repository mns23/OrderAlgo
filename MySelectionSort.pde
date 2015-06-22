class MySelectionSort
{
  Rettangolo array[]= new Rettangolo[10];
  int dist=58;
  int quadratino=15;
  int i=0, j, save_j, minimo;
  int scorr_array_selection = 0;
  int sel_count = 0;
  boolean incicle = false;
  boolean continua = false;
  
  
  boolean scambia(Rettangolo ret1, Rettangolo ret2)
  {
    boolean vai= true;
        
    vai= ret1.move_rect_x(ret2.getXprec());
    vai= ret2.move_rect_x(ret1.getXprec());
    return vai;    
  }
  
  void display(int iii, int jjj, int minmin)
  {
    image(Backg, 0, 0);
    
    color c1 = #8CD88C;
    color c2 = #03FF11;
    color c3 = #178112;
    
    for(int t=0; t<10; t++)
    {
      if (t==iii || t==jjj)
      array[t].displayForSelection(c2);
      else if (t==minmin)
      array[t].displayForSelection(c3);
      else
      array[t].displayForSelection(c1);
    }
  }
  
  MySelectionSort()
  {
    for(int i=0; i<10; i++)
    {
      int val=(int)random(1, 20);
      array[i]= new Rettangolo(150+i*dist, 440-val*quadratino, val, quadratino);
    }
  }
  
  int getScorr_array_selection()
  {
    return scorr_array_selection;
  }

  int SelectionSort()
  {
    
    
    if(sel_count == 50)
    {
      while(i<9) 
      {
        if(incicle == false && continua == false)
        {
          minimo = i;
          j = i+1;
        }  
      
        if(continua==false)
        {
          while(j<10)
          {
            //j = save_j;
            if(array[minimo].getValore() > array[j].getValore())
            {
              minimo = j;
            }
            sel_count = 0;        
            j++;
            //save_j = j;
            incicle = true;
            if(j==10)
            incicle = false;
            break;
          }
        }
      
        if(minimo!=i && incicle==false)
        {
          continua = scambia(array[i], array[minimo]);
        
          if(continua==false && incicle==false)
          {
            array[i].aggiornaXprec();
            array[minimo].aggiornaXprec();
            
            Rettangolo k = array[minimo];
            array[minimo] = array[i];
            array[i] = k;
          }
          else
          break;
        }        
      
        if (continua==false && incicle==false)
        {      
          i++;
          sel_count = 0;
        }
        else
        break;  
      }
     }
    
    if(sel_count < 50)
    sel_count++;
    
    if(i<9)
    display(i, j, minimo);
    else
    display(-1,-1,-1);
    
    if(keyPressed)
    {
      if(key=='b')
      {
        back_player.play(0);
        scorr_array_selection = 1;
        return 0;
      }
    }
    
    return 2;
  }
}  
