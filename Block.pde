class Block { 
  int x, y;
  int w, h;
  int side;

  Block() {
  }

  void run(Red theKid) {
    display();

    move(ash);
    
    npcText(ash); 
  }

  void display() {
    //fill(255, 255, 255);
    rect(x, y, w, h);
  }

  void move(Red theKid) {
    if (theKid.blockWalk == 1) {
      if (theKid.direction == 0 || theKid.direction == 1) {
        y += ySpeed;
      }
      if (theKid.direction == 2 || theKid.direction == 3) {
        x += xSpeed;
      }
    }
  }
  
  void npcText(Red theKid) {
    
  }
}
