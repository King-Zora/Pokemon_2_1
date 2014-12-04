
class NPC extends Block {

  int textX, textY;
  String rival;

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
  }

  void display() {
    fill(0, 255, 225);
    super.display();
  }

  void npcText(Red theKid) {
    if (theKid.talk == 1) {
      image(ArrowText, 280, 250);
      if (keyPressed) {
        if (key == 'z') {
          if (theKid.talk == 1) {
            if (theKid.textBox == theKid.amountOfBox) {
              theKid.talk = 0;
              theKid.textBox = 1;
            }
          }
        }
      }
      textFont(font, 15);
      fill(0);
      if (room == 0) {
        theKid.amountOfBox = 2;
        if (theKid.textBox == 1) {
          text(theKid.name + " is playing the", 20, 225);
          text("SNES !", 20, 250);
        } else {
          text("...Okay!", 20, 225);
          text("It's time to go!", 20, 250);
        }
      }
      if (room == 1) {
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
      if (room == 2) {
        theKid.amountOfBox = 2;  
        if (xCam >= -128) { 
          text(theKid.name +"'s House", 20, 225);
        } else { 
          if (yCam >= -160) {
            text(rival +"'s House", 20, 225);
          } else {
            if (xCam >= -256) {
              text("Pallet Town", 20, 225);
              text("Smallest Town ever", 20, 250);
            } else {
              text("Oak Pokemon", 20, 225);
              text("Reasearch Lab", 20, 250);
            }
          }
        }
      }
    }
  }
}
