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
    //Display a rectangle as visual representation
    rect(x, y, w, h); //UnComment it out to see the horrific sea of blocks. (Green = grass, white = wall, dark blue = fence, light blue = interactive blocks)
  }

  void move(Red theKid) {
    //Move the blocks to follow the scrolling
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
