class Scoreboard {

  String textScore = "SCORE: ";
  int score;
  
  Scoreboard() {
    score = 0;
   
  }
  void update() {
    // Fondo del marcador
    fill(FONDO_MARCADOR[0],FONDO_MARCADOR[1], FONDO_MARCADOR[2]);
    rect(0, height, width, -20);
    
    // Letras del marcador
    fill(BLANCO, BLANCO, BLANCO);
    // Score Points
    text("SCORE: "+ score, 5, height-5);
    
    // Num Fired
    text("STONES: "+ numDisparo, width*2/5,  height-5);
    
    // Lives
    text("LIVES: " + prota.lifes, width*3/5, height-5);
    
    text("LEVEL: " + "1", width*4/5, height-5);
    
    image(stone, 10, height-60);
    
    
    // 
  }

  void draw() {
    
  }
}
