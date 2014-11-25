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

//Create the image variables and arrays
PImage[] Red_L = new PImage[2];
PImage[] Red_R = new PImage[2];
PImage[] Red_D = new PImage[4];
PImage[] Red_U = new PImage[4];

PImage[] bg = new PImage[3];

PImage tS;

//Call classes
Red ash;
Wall[] wall = new Wall[14];
Warp stairs;
Menu inGameMenu;

void setup() {
  //Size of window
  size(320, 288); 

  xCam = -96;
  yCam = -192;
  room = 0;

  //intro = new Movie(this, "cinematic.mp4");

  //Load the song
  minim = new Minim(this);
  music0 = minim.loadFile("Pokemon Blue-Red - Pallet Town.mp3");

  //Create a new Red object
  ash = new Red(128, 128);

  //  stairs = new Warp(8, -1, 1, 1);

  //Create the walls

  inGameMenu = new Menu();

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

  tS = loadImage("Title Screen.png");
}

void createWalls() {
  if (room == 0) {
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

    stairs = new Warp(8, -1, 1, 1);
  } else {
    if (room == 1) {
      wall[0] = new Wall(4, -1, 1, 1);  //TV
      wall[1] = new Wall(4, 2, 2, 2);  //Table
      wall[2] = new Wall(1, -1, 2, 1);  //Shelves
      wall[3] = new Wall(5, 6, 4, 1);  //Bot Right
      wall[4] = new Wall(1, 6, 2, 1);  //Bot Left
      if (yCam > -160) {
        stairs = new Warp(8, -1, 1, 1);
      } else {
        stairs = new Warp(3, 6, 2, 1);
      }
    } else {
      wall[0] = new Wall(2, 14, 2, 1);  //Bot Left of Lake
      wall[1] = new Wall(4, 10, 4, 4);  //Lake
      wall[2] = new Wall(8, 13, 12, 1);  //Bot Right of Lake
      wall[3] = new Wall(1, 13, 1, 1);  //Bot Corner Left
      wall[4] = new Wall(0, -3, 1, 17);  //Main Left
      wall[5] = new Wall(1, -3, 9, 1);  //Top Left of Grass
      wall[6] = new Wall(12, -3, 8, 1); //Top Right of Grass
      wall[7] = new Wall(19, -2, 1, 16); //Main Right
      wall[8] = new Wall(9, -6, 1, 3);  //Top Left Grass Vertical
      wall[10] = new Wall(4, -1, 4, 2); //Top House Red (Room 3)
      wall[11] = new Wall(3, 1, 2, 1);  //Pannel Red (Room 3)
      wall[12] = new Wall(6, 1, 2, 1);  //Right Bot Corner House Red (Room 3)
      wall[13] = new Wall(4, 5, 4, 1);  //Fence 01 (Room 3)

      stairs = new Warp(5, 1, 1, 1);
    }
  }
}



void draw() {
  background(0);
  println(xCam);
  createWalls();
  if (ash.screenState == 0) {
    //Title Screen
    //intro.play();
    //image(intro, 0, 0, 320, 288);
  } else {
    //Gameplay
    if (!inGameMenu.menuIsOpen) {
      image(bg[room], xCam, yCam);
      ash.run();
    }
    inGameMenu.display();
  }
}

void keyPressed() {
  if (key == ENTER) {
    //Change from tittle screen to gameplay when pressed
    if (ash.screenState == 0) {
      ash.screenState = 1;    
      //intro.stop();  
      //music0.loop();
    } else if (ash.screenState == 1) {
      //Change from gameplay to menu
      inGameMenu.isMenuOpen();
    }
  }
  inGameMenu.theArrow();
}

void keyReleased() {
  inGameMenu.theArrowReleased();
  ash.redRel();
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
