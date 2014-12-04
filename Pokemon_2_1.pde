//Import video library to play videos
import processing.video.*;

//Import minim library to play sounds
import ddf.minim.*;

Movie intro;

//Set the song
AudioPlayer[] music = new AudioPlayer[3];
Minim minim;

int xCam, yCam;
int xSpeed, ySpeed;
int room;
PFont font;

//Create the image variables and arrays
PImage[] Red_L = new PImage[2];
PImage[] Red_R = new PImage[2];
PImage[] Red_D = new PImage[4];
PImage[] Red_U = new PImage[4];

PImage[] bg = new PImage[7];

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

  xCam = -320;
  yCam = 1280;
  room = 2;

  //intro = new Movie(this, "cinematic.mp4");

  //Load the song
  minim = new Minim(this);
  music[0] = minim.loadFile("Pokemon Blue-Red - Pallet Town.mp3");
  music[1] = minim.loadFile("Pokemon red - Oak's lab.mp3");
  music[2] = minim.loadFile("Pokemon red - The road to viridian city.mp3");

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

  bg[0] = loadImage("FirstRoomRed.png");
  bg[1] = loadImage("Room01Red.png");
  bg[2] = loadImage("Pallet Town R.png");
  bg[3] = loadImage("House Blue Red.png");
  bg[4] = loadImage("Lab Red.png");
  bg[5] = loadImage("route 01 R.png");
  bg[6] = loadImage("Viridian City 2.png");

  tS = loadImage("Title Screen.png");

  playerBattleBar1 = loadImage("BattleBar.PNG");
  ArrowText = loadImage("Arrow Down.png");
}


void draw() {
  //frameRate(200);
  println(xCam);
  println(yCam);
  createWalls();
  if (ash.screenState == 0) {
    //Title Screen
    //intro.play();
    //image(intro, 0, 0, 320, 288);
    theBattleSystem.display();//checking the battle system
  } else {
    //Gameplay
    if (!inGameMenu.menuIsOpen) {
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
      ash.run();
    }
    inGameMenu.display();
  }
}

void keyPressed() {
  theBattleSystem.didBattleStart();
  
  if (ash.screenState == 0) { //checking the battle system
    theBattleSystem.actions();
  }


  if (key == ENTER) {
    //Change from tittle screen to gameplay when pressed
    if (ash.screenState == 0) {
      ash.screenState = 1; 
      fill(255);
      //intro.stop();  
      //music[0].loop();
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
  //m.read();
}

//Stop minim and the music at the end of the program
void stop() {
  music[0].close();
  music[1].close();
  minim.stop();
  super.stop();
}
