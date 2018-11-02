
class ColisionMgr {

void update() {

   // de disparos
  for (int j = 0; j < numEnemigos; j++) {
    Enemy e = enemigos[j];
    
    for (int i =0; i < numDisparo; i++) {
        Fire d = disparos[i];
        
    // de disparos
    if (!e.isDead) {
      if (( d.x > e.x) 
          && (d.x < (e.x+e.w))
          && (d.y > e.y)
          && (d.y< e.y+e.h)
      )
      { 
        e.isDead = false;
        e.fall = true;
        d.crashed = true;
        //sound2.play();
       // uchSnd.play();
        //uchSnd.stop();
      }
      // de pantalla
      if (e.y < CASTILLO_ARRIBA) {
        e.isDead = true;
        numEnemigos--;
      }
      if (e.y > Y_MARCADOR) {
        e.isDead = true;
        e.fall = false;
        marcador.score = marcador.score + 10;
        numEnemigos--;
      }
    }
  }}
  
}
}
