class Enemy {
  
  // position and speed
  int x = 0;
  int y = 0;
  int speed;
  
  // type of enemy and size
  int type;  
  int w = 60;
  int h = 60;

  int state = 0; // 0 - dead; 1 - Walking to wall ; 2 - Climbing; 3 - Falling; 4 - On Top; 
  boolean isDead = true;
  boolean fall = false;

  AniSprite enemyAnimation;

  Enemy() {
    
    type = (int) random(3);
    enemyAnimation = new AniSprite("malonuevo", 2);
    speed = type;
    
  }


  void update() {

    if (!isDead) {
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
        isDead = false;
        // numEnemigos++;
      }
    }
    if (fall) {
      y = y+20;
    }
  }
  
  // draw function on x,y always if not dead
  void draw() {
    if (!isDead) enemyAnimation.display(x, y);

  }
}
