
class ColisionMgr {

void update() {

   // de disparos
  for (int j = 0; j < numEnemigos; j++) {
    Enemigo e = enemigos[j];
    
    for (int i =0; i < numDisparo; i++) {
        Disparo d = disparos[i];
        
    // de disparos
    if (!e.muerto) {
      if (( d.x > e.x) 
          && (d.x < (e.x+e.w))
          && (d.y > e.y)
          && (d.y< e.y+e.h)
      )
      { 
        e.muerto = false;
        e.fall = true;
        d.crashed = true;
        //sound2.play();
       // uchSnd.play();
        //uchSnd.stop();
      }
      // de pantalla
      if (e.y < CASTILLO_ARRIBA) {
        e.muerto = true;
        numEnemigos--;
      }
      if (e.y > Y_MARCADOR) {
        e.muerto = true;
        e.fall = false;
        marcador.puntuacion = marcador.puntuacion + 10;
        numEnemigos--;
      }
    }
  }}
  
}
}