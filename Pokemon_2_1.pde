//Import video library to play videos
import processing.video.*;

//Import minim library to play sounds
import ddf.minim.*;

Movie intro;

//Set the song
AudioPlayer music0;
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

PImage tS;

//Call classes
Red ash;
Grass[] grass = new Grass[8];
Wall[] wall = new Wall[21];
Fence[] fences = new Fence[9];
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
  music0 = minim.loadFile("Pokemon Blue-Red - Pallet Town.mp3");

  //Create a new Red object
  ash = new Red(128, 128);

  //Create the walls

  inGameMenu = new Menu();

  theBattleSystem = new BattleSystem();

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

  bg[0] = loadImage("First Room Test.png");
  bg[1] = loadImage("Room01.png");
  bg[2] = loadImage("Pallet Town.png");
  bg[3] = loadImage("House Blue.png");
  bg[4] = loadImage("Lab.png");
  bg[5] = loadImage("route01.png");
  bg[6] = loadImage("Viridian City 2.png");

  tS = loadImage("Title Screen.png");
}

void createWalls() {
  fences[0] = new Fence(4, -13, 2, 1); //L01 Left
  fences[1] = new Fence(10, -13, 8, 1); //L01 Right
  fences[2] = new Fence(16, -17, 2, 1); //L02 Right
  fences[3] = new Fence(4, -21, 1, 1); //L03 Left
  fences[4] = new Fence(6, -21, 3, 1); //L03 Middle
  fences[5] = new Fence(10, -21, 8, 1); //L03 Right
  fences[6] = new Fence(6, -27, 4, 1); //L04 Middle
  fences[7] = new Fence(4, -31, 5, 1); //L05 Left
  fences[8] = new Fence(4, -35, 10, 1); //L06 Left
  
  grass[0] = new Grass (10, -8, 2, 6); 
  grass[1] = new Grass (4, -10, 4, 2); 
  grass[2] = new Grass (6, -12, 4, 2); 
  grass[3] = new Grass (12, -10, 4, 2); 
  grass[4] = new Grass (14, -12, 4, 2); 
  grass[5] = new Grass (12, -18, 4, 4); 
  grass[6] = new Grass (14, -28, 4, 4); 
  grass[7] = new Grass (10, -34, 8, 4); 
  if (room == 0) { //Ash's Room
    //Create all the walls
    wall[0] = new Wall(1, -1, 3, 1);  //Desk
    wall[1] = new Wall(4, 2, 1, 2);  //TV
    wall[2] = new Wall(1, 4, 1, 2);  //Bed
    wall[3] = new Wall(7, 4, 1, 2);  //Tree
    wall[4] = new Wall(1, 6, 8, 1);  //Bot
    wall[5] = new Wall(0, -2, 1, 8);  //Left
    wall[6] = new Wall(1, -2, 9, 1); //Top
    wall[7] = new Wall(9, -2, 1, 8); // Right
    wall[8] = new Wall(3, 7, 2, 1);  //Block Door (Room 2)
    wall[9] = new Wall(11, -1, 1, 3);  //Top Right Grass Vertical (Room 3)
    wall[10] = new Wall(0, -3, 9, 1); //Top House Red (Room 3)
    wall[11] = new Wall(-1, -2, 1, 8);  //Pannel Red (Room 3)
    wall[12] = new Wall(1, 7, 8, 1);  //Right Bot Corner House Red (Room 3)
    wall[13] = new Wall(1, 8, 8, 1);  //Fence 01 (Room 3)
    wall[14] = new Wall(11, 4, 4, 2); //Top House Blue (Room 3)
    wall[15] = new Wall(10, 6, 2, 1);  //Pannel Blue (Room 3)
    wall[16] = new Wall(13, 6, 2, 1);  //Right Bot Corner House Blue (Room 3)
    wall[17] = new Wall(9, 9, 6, 3);  //Lab Top (Room 3)
    wall[18] = new Wall(9, 12, 2, 1);  //Lab Bot Left (Room 3)
    wall[19] = new Wall(12, 12, 3, 1);  //Lab Bot Right (Room 3)
    wall[20] = new Wall(9, 14, 6, 1);  //Fence 02 (Room 3)

    stairs = new Warp(8, -1, 1, 1);
  } 
  if (room == 1) { //Ash's House 
    wall[0] = new Wall(4, -1, 1, 1);  //TV
    wall[1] = new Wall(4, 2, 2, 2);  //Table
    wall[2] = new Wall(1, -1, 2, 1);  //Shelves
    wall[3] = new Wall(5, 6, 4, 1);  //Bot Right
    wall[4] = new Wall(1, 6, 2, 1);  //Bot Left

    //Reset walls
    wall[5] = new Wall(0, -2, 1, 8);  //Left
    wall[6] = new Wall(1, -2, 9, 1); //Top
    wall[7] = new Wall(9, -2, 1, 8); // Right
    wall[8] = new Wall(3, 7, 2, 1);  //Block Door (Room 2)
    wall[9] = new Wall(11, -1, 1, 3);  //Top Right Grass Vertical (Room 3)
    wall[10] = new Wall(0, -3, 9, 1); //Top House Red (Room 3)
    wall[11] = new Wall(-1, -2, 1, 8);  //Pannel Red (Room 3)
    wall[12] = new Wall(1, 7, 8, 1);  //Right Bot Corner House Red (Room 3)
    wall[13] = new Wall(1, 8, 8, 1);  //Fence 01 (Room 3)
    wall[14] = new Wall(11, 4, 4, 2); //Top House Blue (Room 3)
    wall[15] = new Wall(10, 6, 2, 1);  //Pannel Blue (Room 3)
    wall[16] = new Wall(13, 6, 2, 1);  //Right Bot Corner House Blue (Room 3)
    wall[17] = new Wall(9, 9, 6, 3);  //Lab Top (Room 3)
    wall[18] = new Wall(9, 12, 2, 1);  //Lab Bot Left (Room 3)
    wall[19] = new Wall(12, 12, 3, 1);  //Lab Bot Right (Room 3)
    wall[20] = new Wall(9, 14, 6, 1);  //Fence 02 (Room 3)
    if (yCam > -160) {
      stairs = new Warp(8, -1, 1, 1);
    } else {
      stairs = new Warp(3, 6, 2, 1);
    }
  } 
  if (room == 2) { //Outside
    if (xCam >= -224) {
      stairs = new Warp(5, 1, 1, 1);
    } else {
      if (yCam >= -192) {
        stairs = new Warp(13, 1, 1, 1);
      } else {
        stairs = new Warp(12, 7, 1, 1);
      }
    }
    if (yCam <= 1280) { //Route 01
      wall[0] = new Wall(18, -17, 1, 1);  //Fence L02 Right //
      wall[1] = new Wall(4, -17, 8, 1);  //Trees L02 Left //
      wall[2] = new Wall(3, -13, 1, 1);  //Fence L01 Left //
      wall[3] = new Wall(9, -13, 1, 1);  //Fence L01 Right //
      wall[4] = new Wall(3, -39, 1, 31);  //Main Left //
      wall[5] = new Wall(3, -8, 7, 1);  //Bot Left //
      wall[6] = new Wall(12, -8, 7, 1); //Bot Right //
      wall[7] = new Wall(18, -39, 1, 31); //Main Right //
      wall[8] = new Wall(9, -8, 1, 6);  //Top Left Grass Vertical //
      wall[9] = new Wall(12, -8, 1, 6);  //Top Right Grass Vertical (Room 3) //
      wall[10] = new Wall(3, -21, 1, 1); //Fence L03 Left //
      wall[11] = new Wall(3, -21, 1, 1);  //Fence L03 Middle //
      wall[12] = new Wall(10, -27, 4, 1);  //Fence L03 Right //
      wall[13] = new Wall(4, -27, 2, 1);  //Trees L04 Left //

      wall[14] = new Wall(3, -31, 1, 1); //Fence L05 Left //
      wall[15] = new Wall(3, -35, 1, 1);  //Fence L06 Left //
      wall[16] = new Wall(9, -36, 1, 6);  //Trees Vertical //
      wall[17] = new Wall(4, -39, 6, 1);  //Top Left //
      wall[18] = new Wall(12, -39, 6, 1);  //Top Right //
      wall[19] = new Wall(9, -42, 1, 3);  //Top Left Vertical //
      wall[20] = new Wall(12, -42, 1, 3);  //Top Right Vertical //
    } else { //Viridian City
      if (yCam < 1728) {
        wall[0] = new Wall(16, -17, 2, 1);  //Fence L02 Right 
        wall[1] = new Wall(-10, -57, 3, 1);  //Top of Left Bot Hill //
        wall[2] = new Wall(20, -56, 2, 1);  //Bot Right Mart //
        wall[3] = new Wall(18, -56, 1, 1);  //Bot Left Mart//
        wall[4] = new Wall(-7, -57, 1, 14);  //Main Left // 
        wall[5] = new Wall(18, -59, 4, 3);  //Top Mart // 
        wall[6] = new Wall(-6, -54, 4, 1); //Bushes Full Left Top Left of Lake // 
        wall[7] = new Wall(26, -74, 1, 30); //Main Right //
        wall[8] = new Wall(-2, -53, 1, 1);  //Tree Top Left of Lake //
        wall[9] = new Wall(-2, -52, 2, 1);  //Bush Top Left of Lake // 
        wall[10] = new Wall(14, -50, 2, 1); //Bot Right Pokemon Center //
        wall[11] = new Wall(12, -50, 1, 1);  //Bot Left pokemon Center //
        wall[12] = new Wall(12, -53, 4, 3);  //Pokemon Center Top //
        wall[13] = new Wall(10, -48, 16, 1);  //Fence L01 Right // 

        wall[14] = new Wall(6, -48, 3, 1); //Fence L01 Middle //
        wall[15] = new Wall(-2, -51, 6, 3);  //Lake //
        wall[16] = new Wall(-7, -48, 12, 1);  //Rence L01 Left // 
        wall[17] = new Wall(-7, -44, 16, 1);  //Top Left //
        wall[18] = new Wall(12, -44, 15, 1);  //Bot Right //
        wall[19] = new Wall(9, -44, 1, 3);  //Top Left Vertical //
        wall[20] = new Wall(12, -44, 1, 3);  //Top Right Vertical //
      } else {
        wall[0] = new Wall(10, -58, 4, 1);  //Fence L03 Center //
        wall[1] = new Wall(-10, -57, 3, 1);  //Top of Left Bot Hill //
        wall[2] = new Wall(20, -56, 2, 1);  //Bot Right Mart //
        wall[3] = new Wall(18, -56, 1, 1);  //Bot Left Mart //
        wall[4] = new Wall(-7, -57, 1, 14);  //Main Left //  
        wall[5] = new Wall(18, -59, 4, 3);  //Top Mart // 
        wall[6] = new Wall(7, -58, 1, 1); //Sign //
        wall[7] = new Wall(26, -74, 1, 30); //Main Right //
        wall[8] = new Wall(-2, -59, 8, 1);  //Bot Samall Forest //
        wall[9] = new Wall(-3, -69, 10, 10);  //Small Foest //
        wall[10] = new Wall(-2, -70, 8, 1); //Small Forest Top //
        wall[11] = new Wall(-10, -75, 6, 14);  //Top Left Hill //  
        wall[12] = new Wall(-4, -75, 11, 4);  //Trees furthest top Left //
        wall[13] = new Wall(10, -75, 16, 2);  //Trees furthest Top Right //

        wall[14] = new Wall(10, -73, 4, 2); //Trees Furthest top Right lower //
        wall[15] = new Wall(10, -61, 4, 1);  //House 01 Top //
        wall[16] = new Wall(10, -60, 1, 1);  //House 01 Bot Left //
        wall[17] = new Wall(12, -60, 2, 1);  //House 01 Bot Right //
        wall[18] = new Wall(10, -62, 16, 1);  //Fence L04 Right //
        wall[19] = new Wall(9, -44, 1, 3);  //Top Left Vertical 
        wall[20] = new Wall(12, -44, 1, 3);  //Top Right Vertical
      }
    }
    if (yCam <= 128) { //Pallet Town
      wall[0] = new Wall(2, 14, 2, 1);  //Bot Left of Lake
      wall[1] = new Wall(4, 10, 4, 4);  //Lake
      wall[2] = new Wall(8, 13, 12, 1);  //Bot Right of Lake
      wall[3] = new Wall(1, 13, 1, 1);  //Bot Corner Left
      wall[4] = new Wall(0, -3, 1, 17);  //Main Left
      wall[5] = new Wall(1, -3, 9, 1);  //Top Left of Grass
      wall[6] = new Wall(12, -3, 8, 1); //Top Right of Grass
      wall[7] = new Wall(19, -2, 1, 16); //Main Right
      wall[8] = new Wall(9, -6, 1, 3);  //Top Left Grass Vertical
      wall[9] = new Wall(12, -6, 1, 3);  //Top Right Grass Vertical (Room 3)
      wall[10] = new Wall(4, -1, 4, 2); //Top House Red (Room 3)
      wall[11] = new Wall(3, 1, 2, 1);  //Pannel Red (Room 3)
      wall[12] = new Wall(6, 1, 2, 1);  //Right Bot Corner House Red (Room 3)
      wall[13] = new Wall(4, 5, 4, 1);  //Fence 01 (Room 3)

      wall[14] = new Wall(12, -1, 4, 2); //Top House Blue (Room 3)
      wall[15] = new Wall(11, 1, 2, 1);  //Pannel Blue (Room 3)
      wall[16] = new Wall(14, 1, 2, 1);  //Right Bot Corner House Blue (Room 3)
      wall[17] = new Wall(10, 4, 6, 3);  //Lab Top (Room 3)
      wall[18] = new Wall(10, 7, 2, 1);  //Lab Bot Left (Room 3)
      wall[19] = new Wall(13, 7, 3, 1);  //Lab Bot Right (Room 3)
      wall[20] = new Wall(10, 9, 6, 1);  //Fence 02 (Room 3)
    }
  } 
  if (room == 3) { //Blue's House
    wall[0] = new Wall(4, -5, 1, 1);  //TV
    wall[1] = new Wall(0, -3, 2, 2);  //Table
    wall[2] = new Wall(-3, -5, 2, 1);  //Shelves
    wall[3] = new Wall(2, 2, 4, 1);  //Bot Right
    wall[4] = new Wall(-3, 2, 2, 1);  //Bot Left

    //Reset walls
    wall[5] = new Wall(-4, -6, 1, 8);  //Left
    wall[6] = new Wall(-3, -6, 9, 1); //Top
    wall[7] = new Wall(5, -6, 1, 8); // Right
    wall[8] = new Wall(-1, 3, 2, 1);  //Block Door (Room 2)
    wall[9] = new Wall(7, -5, 1, 3);  //Top Right Grass Vertical (Room 3)
    wall[10] = new Wall(-4, -7, 9, 1); //Top House Red (Room 3)
    wall[11] = new Wall(-5, -6, 1, 8);  //Pannel Red (Room 3)
    wall[12] = new Wall(1, 2, 8, 1);  //Right Bot Corner House Red (Room 3)
    wall[13] = new Wall(-3, 4, 8, 1);  //Fence 01 (Room 3)
    wall[14] = new Wall(7, 0, 4, 2); //Top House Blue (Room 3)
    wall[15] = new Wall(4, 0, 1, 2);  //Pannel Blue (Room 3)
    wall[16] = new Wall(-3, 0, 1, 2);  //Right Bot Corner House Blue (Room 3)
    wall[17] = new Wall(5, 5, 6, 3);  //Lab Top (Room 3)
    wall[18] = new Wall(5, 8, 2, 1);  //Lab Bot Left (Room 3)
    wall[19] = new Wall(8, 8, 3, 1);  //Lab Bot Right (Room 3)
    wall[20] = new Wall(5, 10, 6, 1);  //Fence 02 (Room 3)

    stairs = new Warp(-1, 2, 2, 1);
  } 
  if (room == 4) { //Lab
    wall[0] = new Wall(3, -5, 4, 1);  //TV
    wall[1] = new Wall(3, -3, 4, 1);  //Table //
    wall[2] = new Wall(-3, -5, 4, 1);  //Shelves
    wall[3] = new Wall(3, 6, 4, 1);  //Bot Right //
    wall[4] = new Wall(-3, 6, 4, 1);  //Bot Left //

    //Reset walls
    wall[5] = new Wall(-4, -6, 1, 12);  //Left //
    wall[6] = new Wall(-3, -6, 10, 1); //Top
    wall[7] = new Wall(7, -6, 1, 12); // Right //
    wall[8] = new Wall(1, 7, 2, 1);  //Block Door (Room 2) //
    wall[9] = new Wall(7, -5, 1, 3);  //Top Right Grass Vertical (Room 3)
    wall[10] = new Wall(-4, -7, 9, 1); //Top House Red (Room 3)
    wall[11] = new Wall(-5, -6, 1, 8);  //Pannel Red (Room 3)
    wall[12] = new Wall(1, 7, 8, 1);  //Right Bot Corner House Red (Room 3)
    wall[13] = new Wall(-3, 7, 8, 1);  //Fence 01 (Room 3) //
    wall[14] = new Wall(7, 0, 4, 2); //Top House Blue (Room 3)
    wall[15] = new Wall(3, 0, 4, 2);  //Pannel Blue (Room 3)
    wall[16] = new Wall(-3, 0, 4, 2);  //Right Bot Corner House Blue (Room 3)
    wall[17] = new Wall(7, 5, 6, 3);  //Lab Top (Room 3)
    wall[18] = new Wall(5, 8, 2, 1);  //Lab Bot Left (Room 3)
    wall[19] = new Wall(8, 8, 3, 1);  //Lab Bot Right (Room 3)
    wall[20] = new Wall(5, 10, 6, 1);  //Fence 02 (Room 3)

    stairs = new Warp(1, 6, 2, 1);
  }
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
  if (ash.screenState == 0) { //checking the battle system
    theBattleSystem.actions();
  }


  if (key == ENTER) {
    //Change from tittle screen to gameplay when pressed
    if (ash.screenState == 0) {
      ash.screenState = 1; 
      fill(255);
      //intro.stop();  
      //music0.loop();
    } else if (ash.screenState == 1) {
      //Change from gameplay to menu
      inGameMenu.isMenuOpen();
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
  music0.close();
  minim.stop();
  super.stop();
}
