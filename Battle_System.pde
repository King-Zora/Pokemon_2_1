class BattleSystem{
  PImage playerPokemonBar, enemyPokemonBar, playerBattleBar1, playerBattleBar2, arrow, testPokemonB;
  int arrowX, arrowY;
 
 BattleSystem(){
   playerPokemonBar = loadImage("BattlePlayerBar.PNG");
   playerBattleBar1 = loadImage("BattleBar.PNG");
   enemyPokemonBar = loadImage("BattleEnemyBar.PNG");
   playerBattleBar2 = loadImage("BattleBar2.PNG");
   arrow = loadImage("arrow.PNG");
   testPokemonB = loadImage("Pokemon_Back_Poses/Charmander.png");
   arrowX = width-174;
   arrowY = height-65;
 }
  
  void display(){
    background(248,248,248);
    image(enemyPokemonBar, 10, 16);
    image(playerBattleBar1, 0, height-96);
    image(playerPokemonBar, width-183, height-160);
    image(playerBattleBar2, width-188, height-95);
    image(arrow, arrowX, arrowY);
    image(testPokemonB, 20, height-126, 90, 64);
  }
  
  void actions(){
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
