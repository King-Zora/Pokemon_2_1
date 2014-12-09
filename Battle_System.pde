// Rahul Sarker
// This is the battle system class (currently very incomplete)
// As you may already know this is going to be our final project so we are not close to done yet
// the controlls are x (which equals a), and z (which equals b)
// currently to initiate the battle system, you need to press 'p' before you start the main game

class BattleSystem {
  PImage playerPokemonBar, enemyPokemonBar, playerBattleBar2, arrow, testPokemonB, battleMoves, battlePP, battleItems, battlePokemons, pokemonArrow, itemArrow, pokemonMenu, pokemonMenuArrow, thePokemonStats, pokemonMovesArrow; // all the sprites
  int arrowX, arrowY, lineNumber, pokemonArrowY, itemArrowY, pokemonMenuArrowY, pokemonMovesArrowY; //all the y variables, x variables, and some to check the dialogue number
  boolean battleStart, battleDialogue, battleMove, battleItem, battlePokemon, pokemonStatsMenu, pokemonStats; //variables to make sure what is open and what is not
  PFont battleText; //text

  BattleSystem() {
    playerPokemonBar = loadImage("BattlePlayerBar.PNG"); //your pokemons hp and such
    enemyPokemonBar = loadImage("BattleEnemyBar.PNG"); //enemy pokemons hp and such
    playerBattleBar2 = loadImage("BattleBar2.PNG"); //the main battle menu
    arrow = loadImage("arrow.PNG"); // the arrow for the main battle menu
    pokemonArrow = loadImage("arrow.PNG"); //the arrow for the pokemon selecting
    itemArrow = loadImage("arrow.PNG"); // the arrow for the pokemon battle itmes
    testPokemonB = loadImage("Pokemon_Back_Poses//Charizard.png"); //testing pokemon sprite
    battleText = loadFont("PokemonGB-18.vlw"); //the text
    battleMoves = loadImage("battleMoveScreen.PNG"); //your moves
    battlePP = loadImage("battlePPScreen.PNG"); //the info and the amount of a specific move
    battleItems = loadImage("item_menu_screen.PNG"); // your items
    battlePokemons = loadImage("battlePokemonScreen.PNG"); //your pokemon
    pokemonMenu = loadImage("battlePokemonMenu.PNG"); //menu in your pokemon screen
    pokemonMenuArrow = loadImage("arrow.PNG"); //the arrow for the pokemon menu
    thePokemonStats = loadImage("missingno_stats.png"); //stats screen for pokemon (right now its a default)
    pokemonMovesArrow = loadImage("arrow.PNG"); //the arrow for the pokemon moves
    textFont(battleText, 14); //text
    lineNumber = 0; //the dialogue
    arrowX = width-174; //the arrow Xs and Ys
    arrowY = height-65;
    pokemonArrowY = 17;
    pokemonMenuArrowY = 195;
    pokemonMovesArrowY = 207;
    battleStart = false; //the booleans
    battleDialogue = false;
    battleMove = false;
    battleItem = false;
    battlePokemon = false;
    pokemonStatsMenu = false;
    pokemonStats = false;
  }

  void didBattleStart() { //this looks and checks if the battle should start or not (just press p to initiate)
    if ((key == 'p') && (!battleDialogue)) {
      battleStart = true;
      battleDialogue = true;
      lineNumber = 0;
    }
  }

  void display() { //the display
    println(lineNumber);
    println(pokemonMovesArrowY);
    background(0);
    if (battleStart) { //battle started
      background(248, 248, 248);
      image(playerBattleBar1, 0, height-96);
      if (!battleDialogue) { //once dialogue is over the real battle starts
        image(playerBattleBar2, width-188, height-95);
        image(arrow, arrowX, arrowY);
        image(testPokemonB, 0, height-200);
        image(playerPokemonBar, width-183, height-160);
        image(enemyPokemonBar, 10, 16);
        if (battleMove) { //if the moves section is open
          image(battleMoves, width-252, height-93);
          image(battlePP, -1, height-158);
          image(pokemonMovesArrow, width-238, pokemonMovesArrowY);
          thePokemonMovesDisplay();
        }
        if (battleItem) { //if the items menu is open
          image(battleItems, width-235, 41);
        }
        if (battlePokemon) { // if the pokemon screen is open and such
          image(battlePokemons, 0, 0);
          image(pokemonArrow, 0, pokemonArrowY);
          if (pokemonStatsMenu) {
            image(pokemonMenu, width-140, height-108);
            image(pokemonMenuArrow, width-128, pokemonMenuArrowY);
            if (pokemonStats) {
              image(thePokemonStats, 0, 0, width, height);
            }
          }
        }
      } else if (battleDialogue) { //if its dialogue
        fill(0);
        if (lineNumber == 0) {
          text("A wild Josh appeared.", 18, height-60);
        }
        if (lineNumber == 1) {
          text("Go! CHARIZARD!", 18, height-60);
        }
        if (lineNumber == 3) {
          text("You escaped safely.", 18, height-60);
        }
      }
    }
  }

  void actions() { //all the various actions that can be done in the battle system
    if (key == 'z') { //this is basically used as a cancel button, so you could press b to come out of a menu that you are currently in
      if (battleMove) {
        battleMove = false;
      } else if (battleItem) {
        battleItem = false;
      } else if (battlePokemon && !pokemonStatsMenu) {
        battlePokemon = false;
        pokemonArrowY = 17;
      } else if (pokemonStatsMenu && !pokemonStats) {
        pokemonStatsMenu = false;
        pokemonMenuArrowY = 195;
      } else if (pokemonStats) {
        pokemonStats = false;
      }
    }
    if (key == 'x') { //this is the main interactive button
      if (lineNumber <=3) { //the dialogue
        if (battleDialogue) {
          lineNumber+=1;
        }
      }
      if (!battleDialogue) { //this checks what should be open in the pokemon menu
        if (battlePokemon && !pokemonStatsMenu) {
          pokemonStatsMenu = true;
        } else if (pokemonStatsMenu) {
          if (pokemonMenuArrowY == 255) {
            pokemonStatsMenu = false;
            pokemonMenuArrowY = 195;
          }
          if (pokemonMenuArrowY == 225) {
            pokemonStats = true;
          }
        }
        if ((arrowX == width-80) && (arrowY == height-35)) { //checks where the arrow is and what should open
          lineNumber+=1;
          battleDialogue = true;
        }
        if ((arrowX == width-174) && (arrowY == height-65)) {
          battleMove = true;
        }
        if ((arrowX == width-174) && (arrowY == height-35)) {
          battleItem = true;
        }
        if ((arrowX == width-80) && (arrowY == height-65)) {
          battlePokemon = true;
        }
      }
      if (lineNumber == 2) { // the dialogue
        battleDialogue = false;
      }
      if (lineNumber>3) { //the dialogue
        battleStart = false;
        battleDialogue = false;
      }
    }
    if (battleStart && !battleDialogue && !battleMove && !battleItem && !battlePokemon) { // moves the main menu arrow
      if (keyCode == UP) {
        arrowY-=30;
      } else if (keyCode == DOWN) {
        arrowY+=30;
      } else if (keyCode == RIGHT) {
        arrowX+=94;
      } else if (keyCode == LEFT) {
        arrowX-=94;
      }
      arrowY = constrain(arrowY, height-65, height-35);
      arrowX = constrain(arrowX, width-174, width-80);
    }
    if (battlePokemon && !pokemonStatsMenu) { //moves the pokemon menu arrow
      if (keyCode == UP) {
        pokemonArrowY-=31;
      } else if (keyCode == DOWN) {
        pokemonArrowY+=31;
      }
      pokemonArrowY = constrain(pokemonArrowY, 17, 171);
    } else if (pokemonStatsMenu&& !pokemonStats) { // moves the pokemon stats menu arrow
      if (keyCode == UP) {
        pokemonMenuArrowY-=30;
      } else if (keyCode == DOWN) {
        pokemonMenuArrowY+=30;
      }
      pokemonMenuArrowY = constrain(pokemonMenuArrowY, 195, 255);
    }
    if (battleMove) { // moves the battle menu arrow
      if (keyCode == UP) {
        pokemonMovesArrowY-=16;
      } else if (keyCode == DOWN) {
        pokemonMovesArrowY+=16;
      }
      pokemonMovesArrowY = constrain(pokemonMovesArrowY, 207, 255);
    }
  }

  void thePokemonMovesDisplay() { //this is for the various types of moves and such
    text("Tackle", width-222, height-65);
    text("Gust", width-222, height-50);
    text("-", width-222, height-35);
    text("-", width-222, height-20);
    if (pokemonMovesArrowY == height-81) {
      text("Normal", 35, height-115);
      text("35", 90, height-98);
      text("35", 130, height-98);
    }
    if (pokemonMovesArrowY == height-65) {
      text("Flying", 35, height-115);
      text("25", 90, height-98);
      text("25", 130, height-98);
    }
    if (pokemonMovesArrowY > height-65) {
      text("???", 35, height-115);
      text("??", 90, height-98);
      text("??", 130, height-98);
    }
  }
}
