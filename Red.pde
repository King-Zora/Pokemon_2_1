class Red {
  //Class variables
  int x, y;
  int xClef, yClef; //Clefairy Not being displayed
  int side;
  int direction;
  float currentFrame;
  float currentFrameClef;
  int screenState;
  boolean walk;
  boolean collideD, collideU, collideR, collideL;
  int blockWalk; //Takes the control of the movement
  int nextYPos, nextXPos; //Goal. Position that should be reach once one block has been crossed
  int speed;
  int canWarp;
  int talk;
  String name;
  int textBox;
  int amountOfBox;
  int textTalk;
  int jump;
  int clefWait;
  int clefTime;
  int clefTimeInt;

  //Constructor
  Red(int _x, int _y) {
    x = _x;
    y = _y; 
    side = 32;
    direction = 1;
    currentFrame = 0;
    currentFrameClef = 0;
    screenState = 0;
    walk = false;
    blockWalk = 0;
    nextYPos = yCam;
    nextXPos = xCam;
    speed = 2;
    canWarp = 0;
    talk = 0;
    name = "Red";
    textBox = 1;
    amountOfBox = 0;
    textTalk = 0;
    jump = 0;
    yClef = _y + side + 2;
    xClef = _x - 2;
    clefWait = 0;
    clefTime = 0;
    clefTimeInt = 150;
  }

  void run() { //Run all the functions of the class
    resetCol();
    for (int j = 0; j < wall.length; j++) {
      wall[j].run(ash); //Run every single wall

      collision(wall[j]); //Check Collisions for every single wall
    }

    for (int h = 0; h < grass.length; h++) {
      grass[h].run(ash); //Run all the grass
    }

    for (int h = 0; h < fences.length; h++) {
      fences[h].run(ash); //Run every fence

      fenceJump(fences[h]); //Check to jump over every fence
    }

    for (int h = 0; h < npcs.length; h++) {
      npcs[h].displayChar(); //Display Characters

      if (talk == 1) {
        image(playerBattleBar1, 0, 190); //Text Box
      }

      npcs[h].run(ash); //Run every npc

      collisionNPC(npcs[h]); //Check for collisions with every npc
    }

    stairs.run(ash); //Only one warp block to run

    //displayClef(); //Not currently displaying. Failed attempt at making a pokemon follow you

    display();

    actionsClef();

    actions();

    checkCollisions();

    sound(stairs);

    warping(stairs);
  }

  void collisionNPC(NPC theNPC) {
    if ((x + side > theNPC.x) && (x < theNPC.x + theNPC.w) && (y + side == theNPC.y)) { //Check collisions
      collideD = true;
      if (keyPressed) {
        if (key == 'x') {
          if (talk == 0) {
            if (direction == 0) {
              talk = 1; //Start to talk if colliding and pressing 'x'
              textTalk = millis() + 500; //Keep the text on screen for a minimum amount of time
            }
          }
        }
      }
    }
    if ((x + side > theNPC.x) && (x < theNPC.x + theNPC.w) && (y == theNPC.y + theNPC.h)) {
      collideU = true;
      if (keyPressed) {
        if (key == 'x') {
          if (talk == 0) {
            if (direction == 1) {
              talk = 1;
              textTalk = millis() + 500;
            }
          }
        }
      }
    }
    if ((y + side > theNPC.y) && (y < theNPC.y + theNPC.h) && (x + side == theNPC.x)) {
      collideR = true;
      if (keyPressed) {
        if (key == 'x') {
          if (talk == 0) {
            if (direction == 2) {
              talk = 1;
              textTalk = millis() + 500;
            }
          }
        }
      }
    }
    if ((y + side > theNPC.y) && (y < theNPC.y + theNPC.h) && (x == theNPC.x + theNPC.w)) {
      collideL = true;
      if (keyPressed) {
        if (key == 'x') {
          if (talk == 0) {
            if (direction == 3) {
              talk = 1;
              textTalk = millis() + 500;
              if (millis() > textTalk) {
                textBox++;
              }
            }
          }
        }
      }
    }
    if (keyPressed) {
      if (key == 'x') {
        if (millis() > textTalk) {
          if (textBox < amountOfBox) {
            textBox++; //Go through all the text boxes
            textTalk = millis() + 500;
          } 
          if (textBox == amountOfBox) {
            if (millis() > textTalk) {
              talk = 3; //Stop talking
              textBox = 1;
            }
            textTalk = millis() + 500;
          }
        }
      }
    }
  }


  void checkCollisions() { //Attempt at fixing the offCentered grid glitch. Sometimes works sometimes doesn't. I thinks it's because the displacement is by 2 every time(speed = 2).
    if (collideD || collideU) {
      ySpeed = 0;
    }  
    if (collideR || collideL) {
      xSpeed = 0;
    }
  }

  void fenceJump(Fence theFence) {
    //Ckeck Regular Collisions with the fences. If not approaching them from above
    if ((x + side > theFence.x) && (x < theFence.x + theFence.w) && (y == theFence.y + theFence.h)) {
      collideU = true;
    }
    if ((y + side > theFence.y) && (y < theFence.y + theFence.h) && (x + side == theFence.x)) {
      collideR = true;
    }
    if ((y + side > theFence.y) && (y < theFence.y + theFence.h) && (x == theFence.x + theFence.w)) {
      collideL = true;
    }
    if (x + side <= theFence.x + theFence.w && x >= theFence.x && y == theFence.y) { //If approaching them from above
      collideL = true;
      collideR = true;
      nextYPos = yCam - side - 2; //Walk one block down to somewhat jump over the fence
      direction = 0;
      jump = 1;
      blockWalk = 1;
    }
  }

  void displayClef() { //Not currently in use
    if (!walk) {
      if (direction == 0) {
        image(Clef_D[0], xClef, yClef);
      }
      if (direction == 1) {
        image(Clef_U[0], xClef, yClef);
      }
      if (direction == 2) {
        image(Clef_R[0], xClef, yClef);
      }
      if (direction == 3) {
        image(Clef_L[0], xClef, yClef);
      }
    } else {
      currentFrameClef = (currentFrameClef + 0.1) % 2;
      for (int i = 0; i < 2; i++) {
        if (direction == 0) {
          image(Clef_D[int(currentFrameClef)], xClef, yClef);
        }
        if (direction == 1) {
          image(Clef_U[int(currentFrameClef)], xClef, yClef);
        }
        if (direction == 2) {
          image(Clef_R[int(currentFrameClef)], xClef, yClef);
        }
        if (direction == 3) {
          image(Clef_L[int(currentFrameClef)], xClef, yClef);
        }
      }
    }
  }

  void actionsClef() { //Not currently in use
    if (clefWait == 0) {
      if (direction == 0) {
        yClef = y - side - 2;
        xClef = x - 2;
      }
      if (direction == 1) {
        yClef = y + side + 2;
        xClef = x - 2;
      }
      if (direction == 2) {
        yClef = y + 2;
        xClef = x - side;
      }
      if (direction == 3) {
        yClef = y + 2;
        xClef = x + side;
      }
    }
    if (keyPressed) {
      if (keyCode == DOWN) {
        if (direction != 0) {
          yClef = y;
          xClef = x;
          clefWait = 1;
          clefTime = int(millis()) + clefTimeInt;
        }
      }
      if (keyCode == UP) {
        if (direction != 1) {
          yClef = y;
          xClef = x;
          clefWait = 1;
          clefTime = int(millis()) + clefTimeInt;
        }
      }
      if (keyCode == RIGHT) {
        if (direction != 2) {
          yClef = y;
          xClef = x;
          clefWait = 1;
          clefTime = int(millis()) + clefTimeInt;
        }
      }
      if (keyCode == LEFT) {
        if (direction != 3) {
          yClef = y;
          xClef = x;
          clefWait = 1;
          clefTime = int(millis()) + clefTimeInt;
        }
      }
    }
    if (millis() >= clefTime) {
      clefWait = 0;
    }
  }

  void display() {
    //rect(x, y, side, side);
    if (!walk) {
      //Stopped sprites
      if (direction == 0) { //DOWN
        image(Red_D[0], x, y);
      }
      if (direction == 1) { //UP
        image(Red_U[0], x, y);
      }
      if (direction == 2) { //RIGHT
        image(Red_R[0], x, y);
      }
      if (direction == 3) { //LEFT
        image(Red_L[0], x, y);
      }
    } else {
      //Walking annimations
      if (direction == 0 || direction == 1) {
        if (jump == 0) {
          currentFrame = (currentFrame + 0.1) % 4; //Go through the annimation if not jumping
        }
        for (int i = 0; i < 4; i++) { //Vertical displacement require 4 sprites
          if (direction == 0) {
            image(Red_D[int(currentFrame)], x, y);
          }
          if (direction == 1) {
            image(Red_U[int(currentFrame)], x, y);
          }
        }
      }
      if (direction == 2 || direction == 3) { //Horizontal displacement only require 2
        if (jump == 0) {
          currentFrame = (currentFrame + 0.1) % 2;
        } 
        for (int i = 0; i < 2; i++) {
          if (direction == 2) {
            image(Red_R[int(currentFrame)], x, y);
          }
          if (direction == 3) {
            image(Red_L[int(currentFrame)], x, y);
          }
        }
      }
    }
  }

  void actions() {
    if (talk == 0 || talk == 3) {
      if (blockWalk == 1) {
        walk = true;
        if (direction == 0 || direction == 1) {
          yCam += ySpeed; //Scroll the background Vertically
        }  
        if (direction == 2 || direction == 3) {
          xCam += xSpeed; //Scroll the background Horizontally
        }

        if (direction == 0 || direction == 1) {
          if (yCam == nextYPos) {
            blockWalk = 0; //Reached the next intended block position
            jump = 0;
          }
        }
        if (direction == 2 || direction == 3) {
          if (xCam == nextXPos) {
            blockWalk = 0; //Reached the next intended block position
            jump = 0;
          }
        }
      } else {
        walk = false;
      }

      if (keyPressed) {
        if (blockWalk == 0) {
          if (keyCode == DOWN) {
            if (collideD) {
              ySpeed = 0; //No movement if there is a collision
            } else {
              ySpeed = -1 * speed; //Movement if there isn't a collision
            }
            direction = 0; //Set direction
            nextYPos = yCam - side; //Set next intended block position
            blockWalk = 1;
            talk = 0;
            textBox = 1;
          }  
          if (keyCode == UP) {
            if (collideU) {
              ySpeed = 0;
            } else {
              ySpeed = speed;
            }
            direction = 1;
            nextYPos = yCam + side;
            blockWalk = 1;
            talk = 0;
            textBox = 1;
          }
          if (keyCode == RIGHT) {
            if (collideR) {
              xSpeed = 0;
            } else {
              xSpeed = -1 * speed;
            }
            direction = 2;
            nextXPos = xCam - side;
            blockWalk = 1;
            talk = 0;
            textBox = 1;
          }
          if (keyCode == LEFT) {
            if (collideL) {
              xSpeed = 0;
            } else {
              xSpeed = speed;
            }
            direction = 3;
            nextXPos = xCam + side;
            blockWalk = 1;
            talk = 0;
            textBox = 1;
          }
        }
        resetCol(); //Reset collisions and recheck every time
      }
    }
  }

  void resetCol() { //Reset the collision variables in order to check for them again
    collideD = false;
    collideU = false;
    collideR = false;
    collideL = false;
  }

  void collision(Wall theWall) { //Set the collision variables to be true if there is a collision
    if ((x + side > theWall.x) && (x < theWall.x + theWall.w) && (y + side == theWall.y)) {
      collideD = true;
    }
    if ((x + side > theWall.x) && (x < theWall.x + theWall.w) && (y == theWall.y + theWall.h)) {
      collideU = true;
    }
    if ((y + side > theWall.y) && (y < theWall.y + theWall.h) && (x + side == theWall.x)) {
      collideR = true;
    }
    if ((y + side > theWall.y) && (y < theWall.y + theWall.h) && (x == theWall.x + theWall.w)) {
      collideL = true;
    }
  }

  void sound(Warp theWarp) { //Play the different songs used outside
    if (room == 2) {
      if (yCam == 160 || yCam == 1280) { //Check the position and play the song required
        music[0].close(); //Stop the previous music
        music[0] = minim.loadFile("Pokemon Blue-Red - Pallet Town.mp3"); //Reload the previous music
        music[3].close();
        music[3] = minim.loadFile("09 - Pewter (Viridian) City Theme [Pokemon RedBlueYellow OST].mp3");
        music[2].loop(); //Play the new music
      }
      if (yCam == 128) {
        music[2].close();
        music[2] = minim.loadFile("Pokemon red - The road to viridian city.mp3");
        music[0].loop();
      }
      if (yCam == 1312) {
        music[2].close();
        music[2] = minim.loadFile("Pokemon red - The road to viridian city.mp3");
        music[3].loop();
      }
    }
  }

  void warping(Warp theWarp) { //Warps from room to room
    if (canWarp == 0) {
      if (x + side <= theWarp.x + theWarp.w && x >= theWarp.x && y == theWarp.y) { //If entered the warp block
        xSpeed = 0;
        canWarp = 1;
        if (room == 0) {
          room = 1; //Change to appropriate room according to the current room
        } else {
          if (room == 1) {
            if (yCam > -160) { //Check the position upon warping and change rooms accordingly
              room = 0;
            } else {
              room = 2; 
              yCam = -96; //Reset the x and y locations if so required
              xCam = -128;
            }
          } else {
            if (room == 2) {
              if (yCam < 128) {
                if (xCam >= -224) {
                  room = 1;
                  xCam = -64;
                  yCam = -256;
                } else {
                  if (yCam > -160) {
                    room = 3;
                    xCam = 64;
                    yCam = -128;
                  } else {
                    room = 4;
                    xCam = 0;
                    yCam = -256;
                    music[0].close();
                    music[0] = minim.loadFile("Pokemon Blue-Red - Pallet Town.mp3");
                    music[1].loop(); //Play the new room's song
                  }
                }
              } else {
                if (yCam < 1632) {
                  room = 5;  
                  yCam = -128;
                  xCam = 32;
                  music[3].close(); 
                  music[3] = minim.loadFile("09 - Pewter (Viridian) City Theme [Pokemon RedBlueYellow OST].mp3");
                  music[4].loop();
                } else {
                  if (yCam < 1792) {
                    room = 6;
                    yCam = -128;
                    xCam = 32;
                  } else {
                    if (yCam <= 3264) {
                      room = 10; 
                      yCam = -128;
                      xCam = 0;
                    }
                  }
                }
              }
            } else {
              if (room == 3) {
                room = 2;
                xCam = -384;
                yCam = -96;
              } else {
                if (room == 4) {
                  music[1].close();
                  music[1] = minim.loadFile("Pokemon red - Oak's lab.mp3");
                  music[0].loop();
                  room = 2;
                  xCam = -352;
                  yCam = -288;
                }
                if (room == 5) {
                  music[4].close();
                  music[4] = minim.loadFile("10 - Pokemon Center [Pokemon RedBlueYellow OST].mp3");
                  music[3].loop();
                  room = 2;
                  xCam = -384;
                  yCam = 1536;
                }
                if (room == 6) {
                  room = 2;
                  xCam = -576;
                  yCam = 1728;
                }
                if (room == 10) {
                  if (yCam <= 0) {
                    room = 2;
                    xCam = -64;
                    yCam = 3264;
                  } else {
                    room = 11;
                    xCam = -352;
                    yCam = -1344;
                  }
                } else {
                  if (room == 11) {
                    room = 10;
                    xCam = -32;
                    yCam = 126;
                  }
                }
              }
            }
          }
        }
      }
      createWalls();
    } else {
      if (x != theWarp.x || y != theWarp.y) {
        canWarp = 0; //Reset the ability to warp
      }
    }
  }

  void redRel() { //Stop walking upon releasing arrow keys
    if (keyCode == DOWN || keyCode == UP) {
      if (ySpeed == 0) {
        blockWalk = 0;
      }
    }  
    if (keyCode == RIGHT || keyCode == LEFT) {
      if (xSpeed == 0) {
        blockWalk = 0;
      }
    }
  }
}
