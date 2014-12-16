//Pair programing assignment
//Rahul, Josh, Jean-Baptiste
//Comp-Sci 30

//Controls:
//-Arrow Keys to move
//-'x' to interact with interactive blocks(NPC)
//-'ENTER' to enter or leave the menu
//-Arrow Keys to scroll through the menus
//-'x' to enter some of the sub-menus
//-'z' to leave the sub-menus

//Known bugs:
//-Their is a glitch that allows the player to get centered off the grid.
//If the player is offCentered the collisions won't work anymore.
//It isn't quite understood how the glitch is engaged. Just mash the arrow keys until being centered off the grid.
//-They are two different yPositions where no music is played (They are located at the start and end of route 01).

//Other:
//-The rectangles have been commented out in the Block's display.
//Comment that line out if you want to see the collision blocks and the location of the interactive blocks.
//-The screen size is quite small. It is not intended to be changed. The small size of the window has been picked to emulate the small gameboy screen.
//-The collisions have not been set past Viridian City.
//-Press 'ENTER' to stop the video and start playing.
//-The battleSystem can be accessed by pressing 'p' during the video.

//Task Distribtion:
//-Rahul: Menus and Battle System
//-Josh: Sprite editing
//Jean-Baptiste: Movement code, collisions, block handeling.

//Import video library to play videos
import processing.video.*;

//Import minim library to play sounds
import ddf.minim.*;

Movie intro;

//Set the song
AudioPlayer[] music = new AudioPlayer[5];
Minim minim;

//Global Variables :_(
int xCam, yCam;
int xSpeed, ySpeed;
int room;
PFont font;

//Create the image variables and arrays
PImage[] Red_L = new PImage[2];
PImage[] Red_R = new PImage[2];
PImage[] Red_D = new PImage[4];
PImage[] Red_U = new PImage[4];

PImage[] Clef_D = new PImage[2];
PImage[] Clef_U = new PImage[2];
PImage[] Clef_R = new PImage[2];
PImage[] Clef_L = new PImage[2];

PImage Mom_D;
PImage Mom_U;
PImage Mom_R;
PImage Mom_L;

PImage[] Oak_D = new PImage[2];

PImage[] Blue_Sis_R = new PImage[2];

PImage[] Nurse_D = new PImage[2];

PImage Salesman_R;
PImage Salesman_L;

PImage[] bg = new PImage[12];

PImage playerBattleBar1;
PImage ArrowText;

PImage tS;

//Call classes
Red ash;
Grass[] grass = new Grass[8];
Wall[] wall = new Wall[21];
Fence[] fences = new Fence[9];
NPC[] npcs = new NPC[4];
Warp stairs;
Menu inGameMenu;
BattleSystem theBattleSystem;

void setup() {
  background(0);

  //Size of window
  size(320, 288); 

//  xCam = -96;
//  yCam = -192;
//  room = 0;

  xCam = -64;
  yCam = 3232;
  room = 2;

  intro = new Movie(this, "cinematic.mp4");

  //Load the song
  minim = new Minim(this);
  music[0] = minim.loadFile("Pokemon Blue-Red - Pallet Town.mp3");
  music[1] = minim.loadFile("Pokemon red - Oak's lab.mp3");
  music[2] = minim.loadFile("Pokemon red - The road to viridian city.mp3");
  music[3] = minim.loadFile("09 - Pewter (Viridian) City Theme [Pokemon RedBlueYellow OST].mp3");
  music[4] = minim.loadFile("10 - Pokemon Center [Pokemon RedBlueYellow OST].mp3");

  //Create a new Red object
  ash = new Red(128, 128);

  //Create the walls

  inGameMenu = new Menu();

  theBattleSystem = new BattleSystem();

  //Load the font
  font = loadFont("PokemonGB-18.vlw");

  //Load the images
  Red_L[0] = loadImage("Red_L0.png");
  Red_L[1] = loadImage("Red_L1.png");

  Red_R[0] = loadImage("Red_R0.png");
  Red_R[1] = loadImage("Red_R1.png");

  Red_D[0] = loadImage("Red_D0.png");
  Red_D[1] = loadImage("Red_D1.png");
  Red_D[2] = Red_D[0];
  Red_D[3] = loadImage("Red_D2.png");

  Red_U[0] = loadImage("Red_U0.png");
  Red_U[1] = loadImage("Red_U1.png");
  Red_U[2] = Red_U[0];
  Red_U[3] = loadImage("Red_U2.png");

  Clef_D[0] = loadImage("Clef_D0.png");
  Clef_D[1] = loadImage("Clef_D1.png");

  Clef_U[0] = loadImage("Clef_U0.png");
  Clef_U[1] = loadImage("Clef_U1.png");

  Clef_R[0] = loadImage("Clef_R0.png");
  Clef_R[1] = loadImage("Clef_R1.png");

  Clef_L[0] = loadImage("Clef_L0.png");
  Clef_L[1] = loadImage("Clef_L1.png");

  Mom_D = loadImage("Mom_D.png");
  Mom_U = loadImage("Mom_U.png");
  Mom_R = loadImage("Mom_R.png");
  Mom_L = loadImage("Mom_L.png");
  
  Oak_D[0] = loadImage("Oak_D0.png");
  
  Blue_Sis_R[0] = loadImage("Blue's_Sis_R0.png");
  
  Nurse_D[0] = loadImage("Nurse_D0.png");
  
  Salesman_L = loadImage("Salesman_L.png");
  Salesman_R = loadImage("Salesman_R.png");

  bg[0] = loadImage("FirstRoomRed.png");
  bg[1] = loadImage("Room01Red.png");
  bg[2] = loadImage("Pallet Town R.png");
  bg[3] = loadImage("House Blue Red.png");
  bg[4] = loadImage("Lab Red.png");
  bg[5] = loadImage("Pokemon Center Red.png");
  bg[6] = loadImage("Mart.png");
  bg[7] = loadImage("Viridian City 2.png");
  bg[8] = loadImage("route 01 R.png");
  bg[9] = loadImage("Route 03 Red Enlarged.png");
  bg[10] = loadImage("Forest Trans Room.png");
  bg[11] = loadImage("Viridian Forest Legit.png");

  tS = loadImage("Title Screen.png");

  playerBattleBar1 = loadImage("BattleBar.PNG");
  ArrowText = loadImage("Arrow Down.png");
}


void draw() {
  println(xCam);
  println(yCam);
  createWalls();
  if (ash.screenState == 0) {
    //Title Screen
    intro.play();
    image(intro, 0, 0, 320, 288);
    theBattleSystem.display();//checking the battle system
  } else {
    //Gameplay
    if (!inGameMenu.menuIsOpen) {
      //Black Background
      background(0);
      if (room == 2) {
        image(bg[9], xCam + 90, yCam - 4506); //Route 03
        image(bg[7], xCam - 225, yCam - 2200); //Viridian City
        image(bg[8], xCam + 96, yCam - 1150); //Route 01
      }
      image(bg[room], xCam, yCam); //Background of current room
      //Run ashs functions
      ash.run();
    }
    inGameMenu.display();
  }
}

void keyPressed() {

  if (ash.screenState == 0) { //checking the battle system
    theBattleSystem.actions();
    theBattleSystem.didBattleStart();
  }


  if (key == ENTER) {
    //Change from tittle screen to gameplay when pressed
    if (ash.screenState == 0) {
      ash.screenState = 1; 
      fill(255);
      intro.stop();  
      music[0].loop();
    } else if (ash.screenState == 1) {
      //Change from gameplay to menu
      inGameMenu.isMenuOpen(theBattleSystem);
    }
  }
  inGameMenu.theArrow();
  inGameMenu.isAnythingOpen(wall);
  if (key == ' ') {
    frameRate(500);
  }
}

void keyReleased() {
  inGameMenu.theArrowReleased();
  ash.redRel();
  if (key == ' ') {
    frameRate(60);
  }
}

// Read the video
void movieEvent(Movie m) {
  m.read();
}

//Stop minim and the music at the end of the program
void stop() {
  //  music[0].close();
  //  music[1].close();
  minim.stop();
  super.stop();
}
