class BattleSystem{
  PImage playerPokemonBar, enemyPokemonBar, playerBattleBar1;
 
 BattleSystem(){
   playerPokemonBar = loadImage("BattlePlayerBar.PNG");
   playerBattleBar1 = loadImage("BattleBar.PNG");
   enemyPokemonBar = loadImage("BattleEnemyBar.PNG");
 }
  
  void display(){
    background(248,248,248);
    image(enemyPokemonBar, 10, 16);
    image(playerBattleBar1, 0, height-96);
    image(playerPokemonBar, width-183, height-160);
  }
  
}
