
class NPC extends Block {

  int textX, textY;
  String rival;
  int placeX, placeY;
  int direction;

  NPC(int _x, int _y, int _w, int _h) {
    super();
    side = 32; //Dimensions of one block
    x = xCam + (side * _x) + (3 * side);
    y = yCam + (side * _y) + (6 * side);
    w = 32 * _w;
    h = 32 * _h;
    textX = 20;
    textY = 225;
    rival = "Blue";
    placeX = _x;
    placeY = _y;
    direction = 3;
  }

  void display() {
    //displayChar();
    //println(direction);
    fill(0, 255, 225);
    super.display();
  }

  void displayChar() {
    if (room == 1) {
      if (placeX == 6 && placeY == 2) {
        if (direction == 0) {
          image(Mom_D, x, y);
        }
        if (direction == 1) {
          image(Mom_U, x, y);
        }
        if (direction == 2) {
          image(Mom_R, x, y);
        }
        if (direction == 3) {
          image(Mom_L, x, y);
        }
      }
    }
    if (room == 3) {
      if (placeX == -1 & placeY == -2) {
        image(Blue_Sis_R[0], x, y);
      }
    }
    if (room == 4) {
      if (placeX == 1 & placeY == -4) {
        image(Oak_D[0], x, y);
      }
    }
    if (room == 5) {
      if (placeX == 0 & placeY == -5) {
        image(Nurse_D[0], x, y);
      }
    }
    if (room == 6) {
      if (placeX == -3 & placeY == -1) {
        image(Salesman_R, x, y);
      }
    }
  }

  void npcText(Red theKid) {
    if (theKid.talk == 1) {
      image(ArrowText, 280, 250); //Display arrow at the end of text
      //      if (keyPressed) {
      //        if (key == 'z') {
      //          if (theKid.talk == 1) {
      //            if (theKid.textBox == theKid.amountOfBox) {
      //              theKid.talk = 0;
      //              theKid.textBox = 1;
      //            }
      //          }
      //        }
      //      }
      textFont(font, 15);
      fill(0);
      if (room == 0) { //Text Changes according to room and position
        theKid.amountOfBox = 2; //Set amount of text boxes
        if (theKid.textBox == 1) { //Box 1
          text(theKid.name + " is playing the", 20, 225); //Line 1
          text("SNES !", 20, 250); //Line 2
        } else {
          text("...Okay!", 20, 225);
          text("It's time to go!", 20, 250);
        }
      }
      if (room == 1) {
        if (yCam <= -96) {
          theKid.amountOfBox = 2;
          text("Prof Oak wants", 20, 225);
          text("to talk to you.", 20, 250);
        } else {
          if (xCam <= -96) {
            theKid.amountOfBox = 3;
            if (theKid.textBox == 1) {
              text("There's a movie on", 20, 225);
              text("TV.", 20, 250);
            }  
            if (theKid.textBox == 2) {
              text("It's the awesome", 20, 225);
              text("Teenage mutant", 20, 250);
            }  
            if (theKid.textBox == 3) {
              text("ninja turtles show.", 20, 225);
            }
          }  
          if (xCam >= -32) {
            theKid.amountOfBox = 2;
            //if (theKid.textBox == 1) {
            text("Books!?", 20, 225);
            text("Who reads those?", 20, 250);
            //}
          }
        }
      }
      if (room == 2) {
        theKid.amountOfBox = 2;  
        if (yCam <= 128) {
          if (xCam >= -128) { 
            text(theKid.name +"'s House", 20, 225);
          } else { 
            if (yCam >= -160) {
              text(rival +"'s House", 20, 225);
            } else {
              if (xCam >= -256) {
                text("Pallet Town", 20, 225);
                text("Smallest Town ever!", 20, 250);
              } else {
                text("Oak Pokemon", 20, 225);
                text("Reasearch Lab", 20, 250);
              }
            }
          }
        } else {
          if (yCam < 1312) {
            text("Route 01", 20, 225);
          } else {
            if (yCam < 1696) {
              text("Viridian City", 20, 225);
            } else {
              if (yCam < 1984) {
                text("Random sign...", 20, 225);
              } else {
                if (yCam <= 2432) {
                  text("This is the ", 20, 225); 
                  text("end of the world!!! ", 20, 250);
                } else {
                  text("Route 03", 20, 225);
                }
              }
            }
          }
        }
      }
      if (room == 3) {
        theKid.amountOfBox = 2; 
        if (yCam <= 32) {
          text("No maps for scrubs", 20, 225);
        } else {
          text("More books...", 20, 225);
        }
      }
      if (room == 4) {
        theKid.amountOfBox = 2; 
        if (yCam >= 0 && xCam >= -32) {
          text("I don't have time", 20, 225);
          text("for your crap", 20, 250);
        } else {
          text("Professor Oak", 20, 225);
          text("is such a nerd", 20, 250);
        }
      }
      if (room == 5) { 
        if (yCam >= 32) { 
          theKid.amountOfBox = 2;
          if (theKid.textBox == 1) {
            text("How did you get", 20, 225);
            text("here", 20, 250);
          } else {
            text("without pokemon?", 20, 225);
          }
        } else {
          theKid.amountOfBox = 2; 
          text("ZZZZZZZZZZZ", 20, 225);
          text("ZZZZZZZZZ...", 20, 250);
        }
      }
      if (room == 6) {
        theKid.amountOfBox = 2; 
        text("Nothing's", 20, 225);
        text("for free.", 20, 250);
      }
      if (room == 11) {
        theKid.amountOfBox = 2; 
        if (yCam <= -1280) {
          text("Viridian Forest.", 20, 225);
        } else {
          if (yCam <= -896) {
            text("Bug types suck.", 20, 225);
          } else {
            if (yCam <= -608) {
              text("I don't know.", 20, 225);
            } else {
              if (yCam <= -384) {
                text("Random.", 20, 225);  
              } else {
                text("You're done.", 20, 225);  
              }
            }
          }
        }
      }
    }
  }
}

