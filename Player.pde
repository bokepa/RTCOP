
class Player {
  int x = 0;
  int y = 40;
  int dx = 0;
  
  int lifes = 3;

  // Calc player positions, lifes and so on...
  
  void update() {
    // calcula posiciones del prota
    //if (mouseX > x) x= x+dx;
    //if (mouseX < x) x = x - dx;
    x = x + dx;
  //  x = mouseX;
    if (x> width) x = width-20;
    if (x < 0) x = 0;
    //if (mouseX > width ) x = width;
    //if (mouseX < 0 ) x = 0;
   
  }
  
  void draw() {
    rect(x, y, 10, 20);
  }

}
