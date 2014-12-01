class Red {
  //Class variables
  int x, y;
  int side;
  int direction;
  float currentFrame;
  int screenState;
  boolean walk;
  boolean collideD, collideU, collideR, collideL;
  int blockWalk; //Takes the control of the movement
  int nextYPos, nextXPos; //Goal. Position that should be reach once one block has been crossed
  int speed;
  int canWarp;

  //Constructor
  Red(int _x, int _y) {
    x = _x;
    y = _y; 
    side = 32;
    direction = 1;
    currentFrame = 0;
    screenState = 0;
    walk = false;
    blockWalk = 0;
    nextYPos = yCam;
    nextXPos = xCam;
    speed = 2;
    canWarp = 0;
  }

  void run() {
    resetCol();
    for (int j = 0; j < wall.length; j++) {
      wall[j].run(ash);

      collision(wall[j]);
    }
    
    for (int h = 0; h < grass.length; h++) {
      grass[h].run(ash);  
    }

    stairs.run(ash);

    display();

    actions();

    checkCollisions();

    warping(stairs);
  }

  void checkCollisions() {
    if (collideD || collideU) {
      ySpeed = 0;
    }  
    if (collideR || collideL) {
      xSpeed = 0;
    }
  }

  void display() {
    //rect(x, y, side, side);
    if (!walk) {
      if (direction == 0) {
        image(Red_D[0], x, y);
      }
      if (direction == 1) {
        image(Red_U[0], x, y);
      }
      if (direction == 2) {
        image(Red_R[0], x, y);
      }
      if (direction == 3) {
        image(Red_L[0], x, y);
      }
    } else {
      if (direction == 0 || direction == 1) {
        currentFrame = (currentFrame + 0.1) % 4;
        for (int i = 0; i < 4; i++) {
          if (direction == 0) {
            image(Red_D[int(currentFrame)], x, y);
          }
          if (direction == 1) {
            image(Red_U[int(currentFrame)], x, y);
          }
        }
      }
      if (direction == 2 || direction == 3) {
        currentFrame = (currentFrame + 0.1) % 2;  
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

    if (blockWalk == 1) {
      walk = true;
      if (direction == 0 || direction == 1) {
        yCam += ySpeed;
      }  
      if (direction == 2 || direction == 3) {
        xCam += xSpeed;
      }

      if (direction == 0 || direction == 1) {
        if (yCam == nextYPos) {
          blockWalk = 0;
        }
      }
      if (direction == 2 || direction == 3) {
        if (xCam == nextXPos) {
          blockWalk = 0;
        }
      }
    } else {
      walk = false;
    }

    if (keyPressed) {
      if (blockWalk == 0) {
        if (keyCode == DOWN) {
          if (collideD) {
            ySpeed = 0;
          } else {
            ySpeed = -1 * speed;
          }
          direction = 0;
          nextYPos = yCam - side;
          blockWalk = 1;
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
        }
      }
      resetCol();
    }
  }

  void resetCol() {
    collideD = false;
    collideU = false;
    collideR = false;
    collideL = false;
  }

  void collision(Wall theWall) {
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

  void warping(Warp theWarp) {
    if (canWarp == 0) {
      if (x + side <= theWarp.x + theWarp.w && x >= theWarp.x && y == theWarp.y) {
        xSpeed = 0;
        canWarp = 1;
        if (room == 0) {
          room = 1;
        } else {
          if (room == 1) {
            if (yCam > -160) {
              room = 0;
            } else {
              room = 2; 
              yCam = -96;
              xCam = -128;
            }
          } else {
            if (room == 2) {
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
                }
              }
            } else {
              if (room == 3) {
                room = 2;
                xCam = -384;
                yCam = -96;
              } else {
                if (room == 4) {
                  room = 2;
                  xCam = -352;
                  yCam = -288;
                }
              }  
            }
          }
        }
      }
      createWalls();
    } else {
      if (x != theWarp.x || y != theWarp.y) {
        canWarp = 0;
      }
    }
  }

  void redRel() {
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
