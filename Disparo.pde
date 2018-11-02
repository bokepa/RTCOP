class Disparo {
 
  //position
  int x = 0;
  int y = 0;
  // big
  int r = 15;
  int speed = 20;
  boolean activo = false;
  boolean crashed = false;
  PImage[] ston;
  int ston_i;

  Disparo () {
    activo = true;
    x = prota.x;
    ston = new PImage[7];
    ston[0] = loadImage("stone.png");
    ston[1] = loadImage("stone2.png");
    ston[2] = loadImage("stone3.png");
    ston[3] = loadImage("stone4.png");
    ston[4] = loadImage("stone5.png");
    ston[5] = loadImage("stone6.png");
    ston[6] = loadImage("stone7.png");
    ston_i=0;
  
  }
  void update() {
    if (activo) {
      y = y + speed;
      draw();
    }
    if (y > height) {
      y=15;
      activo = false;
      numDisparo--;
    }
    
  }

  void draw() {
    image(ston[ ston_i], x,y);
    ston_i++;
    if (ston_i==6) ston_i=0;
  }
}