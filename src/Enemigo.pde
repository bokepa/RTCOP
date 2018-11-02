class Enemigo {
  // position and speed
  int x = 0;
  int y = 0;
  int speed;
  
  // type of 
  int type;
  int w = 60;
  int h = 60;

  int state = 0; // 0 - dead; 1 - Entring ; 2 - Climbing; 3 - Falling; 4 - On Top; 
  boolean muerto = true;
  boolean fall = false;

  AniSprite aniEnemigo;

  Enemigo() {
    
    type = (int) random(3);
    aniEnemigo = new AniSprite("malonuevo", 2);
    speed = type;
    
  }


  void update() {

    if (!muerto) {
      // Move to right or left
      if (random(2) > 1) y = y - speed;
      if (random(6) > 5) x = x - speed;
      else { 
        if (random(6)>5) {
          x++;
        }
      }
      
      //rect(enemigos[j].x, enemigos[j].y, enemigos[j].w, enemigos[j].h);
    } else {
      if (random(20)>19) {// Resucita muertos
        x = int(random(CASTILLO_DER));
        y = Y_MARCADOR;
        muerto = false;
        // numEnemigos++;
      }
    }
    if (fall) {
      y = y+20;
    }
  }
  
  void draw() {
    if (!muerto) aniEnemigo.display(x, y);

  }
}