import processing.sound.*;
import ddf.minim.*;


// ToDo
// - Sprite for climber https://forum.processing.org/one/topic/sprite-sheet.html
// - Sprite for Player
// - Game States Control - Main Menu - Star Button
// - Enemy arrival, from left/right to somewhere in the castle
// - Enemy top arrival, from its position to Player 
// - if Enemy and Player collides, then Player deads (fall) and lives -1
//

// Audio variables
Minim minim;
AudioPlayer snd_fire;
AudioPlayer snd_uch;
AudioPlayer snd_music;

int SCREEN_X = 600;
int SCREEN_Y = 600;
int GAME_STAT = 1;

// GENERAL JUEGO
int MAX_ENEMIGOS = 30;

// COLORES
int BLANCO = 255;
int NEGRO  = 0;
int FONDO_MARCADOR[] = {
  155, 145, 126};
int FONT_MARCADOR[] = {
  255, 255, 255};

// POSICIONES
int CASTILLO_DER = SCREEN_X-15;
int CASTILLO_IZQ = 10;
int CASTILLO_ABAJO = SCREEN_Y-15;
int CASTILLO_ARRIBA = height/5;
int Y_MARCADOR = SCREEN_Y-20;
int Y_PROTA = 10;

// Prota
Prota prota;
Marcador marcador;
ColisionMgr colisionMgr;

// Enemigos
Enemigo[] enemigos;
int numEnemigos = 0;

// Disparos
Disparo[] disparos;
int numDisparo = 0;

// Imagenes
PImage b;
PImage stone;

// Fonts
PFont font;

// We SETUP all objects, fonts, and sounds.
void setup() {

  // Main window size
  size(600, 600);
  
  // Init Sounds
  minim = new Minim(this);
  snd_fire = minim.loadFile("arco.mp3");
  snd_uch = minim.loadFile("uch.mp3");
  snd_music = minim.loadFile("sygma.mp3");
  
  // Start Music
  snd_music.loop();
 
  // we setup the castle background image
  //b = loadImage("castillo.jpg");
  loadBackground();
 

  // FrameRAte
  frameRate(25);

  // Init game objects
  enemigos = new Enemigo[MAX_ENEMIGOS+1];
  disparos = new Disparo[100];
  prota = new Prota();
  marcador = new Marcador();
  colisionMgr = new ColisionMgr();

  for (int i = 0; i < MAX_ENEMIGOS; i++) {
    enemigos[i] = new Enemigo();
  } 

  // Load Font for ScoreBoard

  font = loadFont("Ziggurat-HTF-Black-32.vlw"); 
  textFont(font, 16);

}

void loadBackground() {

  b = loadImage("castle_wall.png");
  b.resize(width, height );
  stone = loadImage("Stone-Sprite.png");
  stone.resize(72, 37);
  
}

void mueveEnemigos() {
  if (numEnemigos < MAX_ENEMIGOS) {
    // Crea nuevo enemigo
    if (random(20) >=8) {
      enemigos[numEnemigos].x = int(random(CASTILLO_DER));
      enemigos[numEnemigos].y = Y_MARCADOR;
      enemigos[numEnemigos].muerto = false;
      numEnemigos++;
    }
  }
  // Calcula nuevas posiciones
  for (int j = 0; j < numEnemigos; j++) {
    enemigos[j].update();
    enemigos[j].draw();
  }
}

// Click de disparo, creamos uno nuevo
void mouseClicked() {

  if (numDisparo<100) {
    disparos[numDisparo]  = new Disparo();
    numDisparo++;
    snd_fire.play(); snd_fire.rewind();
  }
}

void mueveDisparos() {

  for (int i=0; i<99; i++) {
    if (disparos[i]!=null)
      disparos[i].update();
  }
}

// main updating objects
void updateAll() {

  prota.update();
  mueveDisparos();
  mueveEnemigos();
  colisionMgr.update();
  marcador.update();
}

// main call draw objects
void drawAll() {
  prota.draw();
  //colisiones.draw();
  marcador.draw();
}


void pintaMenu() {
  background(102);
}

// Main loop
// Controls Game STate 
// 0 - Menu
// 1 - Playing
// 2 - Game Over

void draw() {
  if (GAME_STAT==0) {
    // Menu principal
    pintaMenu();
  } else if (GAME_STAT ==1) {

    image(b, 0, 0);
    updateAll();
    drawAll();
  }
}

void keyPressed() {
  
    print(keyCode);
    if (keyCode ==LEFT) prota.dx = -20;
    else if (keyCode ==RIGHT) prota.dx = +20;
}

void keyReleased()  {

  if (keyCode ==LEFT) prota.dx = 0;
  else if (keyCode ==RIGHT) prota.dx = 0;
  
  if (key == ' ')  {
    if (numDisparo<100) {
      disparos[numDisparo]  = new Disparo();
      numDisparo++;
      snd_fire.play(); snd_fire.rewind();
    }
  }
}