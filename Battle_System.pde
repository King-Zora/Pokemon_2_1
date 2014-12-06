class BattleSystem{
  PImage playerPokemonBar, enemyPokemonBar, playerBattleBar2, arrow, testPokemonB, battleMoves, battlePP, battleItems, battlePokemons;
  int arrowX, arrowY, lineNumber;
  boolean battleStart, battleDialogue, battleMove, battleItem, battlePokemon;
  PFont battleText;
 
 BattleSystem(){
   playerPokemonBar = loadImage("BattlePlayerBar.PNG");
   enemyPokemonBar = loadImage("BattleEnemyBar.PNG");
   playerBattleBar2 = loadImage("BattleBar2.PNG");
   arrow = loadImage("arrow.PNG");
   testPokemonB = loadImage("Pokemon_Back_Poses/Charmander.png");
   battleText = loadFont("PokemonGB-18.vlw");
   battleMoves = loadImage("battleMoveScreen.PNG");
   battlePP = loadImage("battlePPScreen.PNG");
   battleItems = loadImage("item_menu_screen.PNG");
   battlePokemons = loadImage("battlePokemonScreen.PNG");
   textFont(battleText, 14);
   lineNumber = 0;
   arrowX = width-174;
   arrowY = height-65;
   battleStart = false;
   battleDialogue = false;
   battleMove = false;
   battleItem = false;
   battlePokemon = false;
 }
 
 void didBattleStart(){
    if ((key == 'p') && (!battleDialogue)){
      battleStart = true;
      battleDialogue = true;
      lineNumber = 0;
   }
    else if ((key == 'p')  && (battleStart || battleDialogue)){
     battleStart = false;
     battleDialogue = false;
     arrowX = width-174;
     arrowY = height-65;
   }
   if (key == 'z'){
     if (battleMove){
       battleMove = false;
     }
     if (battleItem){
       battleItem = false;
     }
     if (battlePokemon){
       battlePokemon = false;
     }
   }
   if (key == 'x'){
     if (lineNumber <=3){
       if (battleDialogue){
         lineNumber+=1;
       }
     }
     if (!battleDialogue){
       if ((arrowX == width-80) && (arrowY == height-35)){
         lineNumber+=1;
         battleDialogue = true;
       }
       if ((arrowX == width-174) && (arrowY == height-65)){
         battleMove = true;
       }
       if ((arrowX == width-174) && (arrowY == height-35)){
         battleItem = true;
       }
       if ((arrowX == width-80) && (arrowY == height-65)){
         battlePokemon = true;
       }
     }
     if (lineNumber == 2){
       battleDialogue = false;
     }
     if (lineNumber>3){
       battleStart = false;
       battleDialogue = false;
     }
   }
 }
  
  void display(){
    println(lineNumber);
    background(0);
    if (battleStart){
      background(248,248,248);
      image(enemyPokemonBar, 10, 16);
      image(playerBattleBar1, 0, height-96);
      image(playerPokemonBar, width-183, height-160);
      if (!battleDialogue){
        image(playerBattleBar2, width-188, height-95);
        image(arrow, arrowX, arrowY);
        if (battleMove){
          image(battleMoves, width-252, height-93);
          image(battlePP, -1, height-158);
        }
        if (battleItem){
          image(battleItems, width-235, 41);
        }
        if (battlePokemon){
          image(battlePokemons, 0, 0);
        }
      }
      else if(battleDialogue){
        fill(0);
        if (lineNumber == 0){
          text("A wild Josh appeared.", 18, height-60);
        }
        if (lineNumber == 1){
          text("Go! Jean!", 18, height-60);
        }
        if (lineNumber == 3){
          text("You escaped safely.", 18, height-60);
        }
      }
    }
  }
  
  void actions(){
    if (battleStart && !battleDialogue && !battleMove && !battleItem && !battlePokemon){
      if (keyCode == UP){
        arrowY-=30;
      }
      else if (keyCode == DOWN){
        arrowY+=30;
      }
      else if (keyCode == RIGHT){
        arrowX+=94;
      }
      else if (keyCode == LEFT){
        arrowX-=94;
      }
      arrowY = constrain(arrowY, height-65, height-35);
      arrowX = constrain(arrowX, width-174, width-80);
    }
  }
  
}
