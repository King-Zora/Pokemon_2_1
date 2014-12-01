class Grass extends Block {

  Grass(int _x, int _y, int _w, int _h) {
    super();
    side = 32; //Dimensions of one block
    x = xCam + (side * _x) + (3 * side);
    y = yCam + (side * _y) + (6 * side);
    w = 32 * _w;
    h = 32 * _h;
  }

  void display() {
    fill(0, 255, 0);
    super.display();
  }
}
