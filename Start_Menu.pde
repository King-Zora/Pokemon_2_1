class Menu{
  float x, y, arrowX, arrowY;
  PImage startMenu, arrow;
  boolean menuIsOpen;
  int top, bot;
  int yIntervals;
  PFont pokemonFont;
  
  Menu(){
   x = width - 157; 
   y = 0;
   arrowX = x + 10;
   arrowY = y + 20;
   top = 20;
   bot = 218;
   yIntervals = 33;
   startMenu = loadImage("Start_Menu.PNG");
   arrow = loadImage("arrow.PNG");
   menuIsOpen = false;
  }
  
  void display(){
    if (menuIsOpen){
      image(startMenu, x, y);
      image(arrow, arrowX, arrowY);
    }
  }
  
  void isMenuOpen(){
    if (!menuIsOpen){
      inGameMenu.menuIsOpen = true;
    }
    else if(menuIsOpen){
      inGameMenu.menuIsOpen = false;
    }
  }
  
  void theArrow() {
    if (menuIsOpen){
      if (keyCode == DOWN){
        arrowY += yIntervals;
      }
      if (keyCode == UP){
        arrowY -= yIntervals;
      }
    }
    if (arrowY > (y + bot)){
      arrowY = y + top;
    }
    if (arrowY < (y + top)){
      arrowY = y + bot;
    }
  }
  
  void theArrowReleased() {
    if (key == ENTER){
      arrowY = y + top;
    }  
  }
  
}
