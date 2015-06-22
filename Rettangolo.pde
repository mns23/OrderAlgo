class Rettangolo
{
  int xpos;
  int ypos;
  int xprec;
  int yprec;
  int larg=30;
  int quadratino;
  int valore;
  int lung;
  
  Rettangolo (int x, int y, int val, int quad)
  {
    xpos = x;
    xprec = x;
    ypos = y;
    yprec = y;
    quadratino = quad;
    valore = val;
    lung = quadratino*val;
  }
  
  int getValore()
  {
    return valore;
  }
  
  int getXprec()
  {
    return xprec;
  }
  
  int getXpos()
  {
    return xpos;
  }
  
  void setXpos(int X)
  {
    xpos=X;
  }
  
  void aggiornaXprec()
  {
    xprec=xpos;
  }
  
  void displayForBubble(color c)
  {
    fill(c);
    rect(xpos, ypos, larg, lung);
    fill(0);
    textFont(valuefont, 15);
    text(valore, xpos+(larg/2), 438);
    textFont(retrofont, 65);
    fill(#8CD88C);
    text("BubbleSort", 430, 50);
    textSize(30);
    text("press 'b' to back to the menu", 430, 100);
  }
  
  void displayForSelection(color c)
  {
    fill(c);
    rect(xpos, ypos, larg, lung);
    fill(0);
    textFont(valuefont, 15);
    text(valore, xpos+(larg/2), 438);
    textFont(retrofont, 65);
    fill(#8CD88C);
    text("SelectionSort", 430, 50);
    textSize(30);
    text("press 'b' to back to the menu", 430, 100);
  }
  
  boolean move_rect_x(int xend)
  {
      if(xend>xpos)
      xpos++;
      else if(xend<xpos)
      xpos--;
      else if(xend==xpos)
      return false;
      
      return true;
  }
}
