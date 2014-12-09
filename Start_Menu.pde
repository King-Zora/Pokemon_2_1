// Rahul Sarker
// the in game menu

class Menu{
  float x, y, arrowX, arrowY, pokedexY, pokemonY, itemY, charecterY, saveY, optionY, exitY, cancelY, itemArrowY; // all the various Xs and Ys
  PImage startMenu, arrow, pokedex, pokemon, item, charecter, save, option, exit, item_screen, char_screen, itemArrow; // the image variables
  boolean menuIsOpen, itemIsOpen, charIsOpen; // the booleans to see what is open
  int top, bot; //boundaries for the arrow
  int yIntervals; // the amount the arrow goes down
  PFont pokefont; // the font
  
  Menu(){
   x = width - 157; // xs and ys for the menu
   y = 0; 
   arrowX = x + 15;
   arrowY = y + 25;
   top = 25; //the boundaries for the arrow
   bot = 223;
   yIntervals = 33;
   startMenu = loadImage("Start_Menu.PNG"); // all the various images
   arrow = loadImage("arrow.PNG");
   itemArrow = loadImage("arrow.PNG");
   pokedex = loadImage("pokédex.PNG");
   pokemon = loadImage("pokémon.PNG");
   item = loadImage("item.PNG");
   charecter = loadImage("red_menu.PNG");
   save = loadImage("save_menu.PNG");
   option = loadImage("option_menu.PNG");
   exit = loadImage("exit_menu.PNG");
   item_screen = loadImage("item_menu_screen.PNG");
   char_screen = loadImage("red_menu_screen.PNG");
   menuIsOpen = false; //boolean to see what is open and not
   itemIsOpen = false;
   charIsOpen = false;
   pokedexY = 25; //the various xs and ys
   pokemonY = 58;
   itemY = 91;
   charecterY = 124;
   saveY = 157;
   optionY = 190;
   exitY = 223;
   cancelY = 64;
   itemArrowY = cancelY-15;
   pokefont = loadFont("PokemonGB-18.vlw"); //the font
   textFont(pokefont, 18);
  }
  
  void display(){ // display
    if (menuIsOpen){
      image(startMenu, x, y);
      image(arrow, arrowX, arrowY);
      image(pokedex, x+35, pokedexY);
      image(pokemon, x+35, pokemonY);
      image(item, x+35, itemY);
      image(charecter, x+35, charecterY);
      image(save, x+35, saveY);
      image(option, x+35, optionY);
      image(exit, x+35, exitY);
      if (itemIsOpen){ //if item is open
        fill(0);
        image(item_screen, width-235, 27);
        text("cancel", x-45, cancelY);
        image(itemArrow, x-65, itemArrowY);
      }
      if (charIsOpen){ //if character screen is open
        image(char_screen, 1, 0);
      }
    }
  }
  
  void isMenuOpen(BattleSystem anyBattle){ //checks when you can open the menu and such
    if (!menuIsOpen && !anyBattle.battleStart){
      menuIsOpen = true;
    }
    else if(menuIsOpen){
      if (!itemIsOpen && !charIsOpen){
        menuIsOpen = false;
      }
    }
  }
  
  void isAnythingOpen(Wall[] anyWall){ //checks what is open in the menu and such
    if (menuIsOpen){
      if (key == 'x'){ //the main interactive key, used to select things
        if ((arrowY == itemY) && !itemIsOpen){
          itemIsOpen = true;
        }
        else if ((itemArrowY == cancelY-15) && itemIsOpen){
          if (room == 2) {
            image(bg[6], xCam - 225, yCam - 2200);
            image(bg[5], xCam + 96, yCam - 1150);
          }
          image(bg[room], xCam, yCam);
          if (room == 2) {
            if (yCam >= 160) {
              image(bg[5], xCam + 96, yCam - 1150);
            }
            if (yCam >= 1312) {
              image(bg[6], xCam - 225, yCam - 2200);
            }
          }
          itemIsOpen = false;
        }
        if (arrowY == charecterY){
          charIsOpen = true;
        }
        if (arrowY == exitY){
          menuIsOpen = false;
        }
      }
      if (key == 'z'){ //the cancel key, can close the currently menu when ever wanted
        if (!itemIsOpen && !charIsOpen){
          menuIsOpen = false;
        }
      background(0);
      if (room == 2) {
        image(bg[6], xCam - 225, yCam - 2200);
        image(bg[5], xCam + 96, yCam - 1150);
      }
      image(bg[room], xCam, yCam);
      if (room == 2) {
        if (yCam >= 160) {
          image(bg[5], xCam + 96, yCam - 1150);
        }
        if (yCam >= 1312) {
          image(bg[6], xCam - 225, yCam - 2200);
        }
      }
        itemIsOpen = false;
        charIsOpen = false;
      }
    }
  }
  
  void theArrow() { //the arrow itself and its various functions (going up and down and the boundaries and such)
    if (menuIsOpen && !itemIsOpen && !charIsOpen){
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
  
  void theArrowReleased() { // the arrow resets basically
    if (key == ENTER){
      arrowY = y + top;
    }  
  }
  
}
