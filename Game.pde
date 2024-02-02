/*
video #10 0:00
*/

// Variabili per oggetti
Player player;
Tiles tile;
BombAnimation bombAnimation;
BombExplosionAnimation bombExplosionAnimationFrames;
DoorAnimation doorAnimation;
Sound backgroundMusic, walkSound, attackSound, explosionSound, doorSound;
// Variabili per timer
int startTime;
boolean timerRunning = false;
// Variabili per delay esplosione bombe
int bombStartTime = 1000;
int bombExplosionTime = 200;
// Variabile per non far ripetere i sound nei loop
boolean[] repatSound = new boolean [4];

String rndPath() {
  int rnd = (int)random(2);
  String windowPath;
  if (rnd < 1) windowPath = "assets/objects/windows/Window1.png";
  else windowPath = "assets/objects/windows/Window2.png";
  return windowPath;
}

void startTimer() {
  startTime = millis();
  timerRunning = true;
}

// Metodo per caricare immagini in un array
void loadAnimations() {
  for (int i = 0; i < idleFrameMax; i++) {
    idle[i] = loadImage("assets/player/idle/" + i + ".png");
  }
  
  for (int i = 0; i < runFrameMax; i++) {
    run[i] = loadImage("assets/player/run/" + i + ".png");
  }
   
  for (int i = 0; i < attackFrameMax; i++) {
    attack[i] = loadImage("assets/player/attack/" + i + ".png");
  }
    
  for (int i = 0; i < bombIgnitionFrames; i++) {
    bombIgnitionAnimation[i] = loadImage("assets/objects/bomb/" + i + ".png");
  }
  
  for (int i = 0; i < bombExplosionFrames; i++) {
    bombExplosionAnimation[i] = loadImage("assets/objects/bomb/bombExplosion/" + i + ".png"); 
  }
  
  for (int i = 0; i < doorOpeningFrames; i++) {
    doorOpeningAnimation[i] = loadImage("assets/objects/door/" + i + ".png"); 
  }
}

void settings() {
  size(screenWidth,screenHeight);
}

void setup () {
  windowTitle(GAME_TITLE);
  windowResizable(false);
  frameRate(FRAME_RATE);
  background(0);
  // Caricamento immagini dentro gli array
  loadAnimations();
  
  // Creazione audio
  backgroundMusic = new Sound(this, bgMusicPath);
  walkSound = new Sound(this, walkPath);
  attackSound = new Sound(this, attackPath);
  explosionSound = new Sound(this, explosionPath);
  doorSound = new Sound(this, doorPath);
  backgroundMusic.loop();
   
  // Creazione sfondo
  tile = new Tiles(tiles, tileSize, tileSize);
  tile.loadTiles();
  // Creazione oggetti (true / false alla fine per dire se hanno hitbox o no)
  bomb = new Items(bombImg, bombX, bombY, 128, 128, false, true);
  box = new Items(boxImg, boxX, boxY, 48, 42, true, false);
  door = new Items(doorImg, doorX, doorY, 100, 110, false, true);
  window = new Items(rndPath(), windowX, windowY, 120, 120, false, false);
  // Oggetti livello 1
  LVL1bomb = new Items(bombImg, LVL1bombX, LVL1bombY, 128, 128, false, true);
  LVL1box = new Items(boxImg, LVL1boxX, LVL1boxY, 48, 42, true, false);
  LVL1door = new Items(doorImg, LVL1doorX, LVL1doorY, 100, 110, false, true); //<>// //<>//
  LVL1window = new Items(rndPath(), LVL1windowX, LVL1windowY, 120, 120, false, false);
  LVL1window2 = new Items(rndPath(), LVL1windowX2, LVL1windowY2, 120, 120, false, false);
  
  bombAnimation = new BombAnimation(bombIgnitionAnimation, 128, 128);
  bombExplosionAnimationFrames = new BombExplosionAnimation(bombExplosionAnimation, 128, 128);
  doorAnimation = new DoorAnimation(doorOpeningAnimation, 100, 110);
  
  // Caricamento array item
  items[0] = bomb; items[1] = box; items[2] = door; items[3] = window;
  items[4] = LVL1bomb; items[5] = LVL1box; items[6] = LVL1door; items[7] = LVL1window; items[8] = LVL1window2;
  // Caricamento array sound
  repatSound[0] = true; repatSound[1] = true; repatSound[2] = true; repatSound[3] = true; 
   
  // Creazione player
  player = new Player(idle, 128, 128, 'w', 's', 'a', 'd');
  player.x = screenX;
  player.y = screenY;
}

// Da lasciare in caso vengano aggiunte altre cose
void update() {
  player.update();
}

void draw() {  
  background(0);
  update();
  // Draw tiles
  tile.displayTiles();
  
  // Draw Oggetti
  switch (bombExplosion) {
    case 0:
      bomb.drawItem();
      break;
    case 1:
      bombAnimation.x = bomb.x - worldX + screenX;
      bombAnimation.y = bomb.y - worldY + screenY;
      bombAnimation.draw(bombIgnitionAnimation, bombIgniteDelay);
      if (timerRunning) {
        int elapsedTime = millis() - startTime;
        if (elapsedTime >= bombStartTime) {
          bombExplosion++;
          timerRunning = false;
        }
      } else startTimer();
      break;
    case 2:
      if (repatSound[0]) {
        explosionSound.play();
        repatSound[0] = false;
      }
      bombExplosionAnimationFrames.x = bomb.x - worldX + screenX;
      bombExplosionAnimationFrames.y = bomb.y - worldY + screenY;
      bombExplosionAnimationFrames.draw(bombExplosionAnimation, bombExplosionDelay);
      if (timerRunning) {
        int elapsedTime = millis() - startTime;
        if (elapsedTime >= bombExplosionTime) {
          bombExplosion++;
          timerRunning = false;
        }
      } else startTimer();
      break;
    case 3:
      break;
  }
  
  switch (LVL1bombExplosion) {
    case 0:
      LVL1bomb.drawItem();
      break;
    case 1:
      bombAnimation.x = LVL1bomb.x - worldX + screenX;
      bombAnimation.y = LVL1bomb.y - worldY + screenY;
      bombAnimation.draw(bombIgnitionAnimation, bombIgniteDelay);
      if (timerRunning) {
        int elapsedTime = millis() - startTime;
        if (elapsedTime >= bombStartTime) {
          LVL1bombExplosion++;
          timerRunning = false;
        }
      } else startTimer();
      break;
    case 2:
      if (repatSound[1]) {
        explosionSound.play();
        repatSound[1] = false;
      }
      bombExplosionAnimationFrames.x = LVL1bomb.x - worldX + screenX;
      bombExplosionAnimationFrames.y = LVL1bomb.y - worldY + screenY;
      bombExplosionAnimationFrames.draw(bombExplosionAnimation, bombExplosionDelay);
      if (timerRunning) {
        int elapsedTime = millis() - startTime;
        if (elapsedTime >= bombExplosionTime) {
          LVL1bombExplosion++;
          timerRunning = false;
        }
      } else startTimer();
      break;   
     case 3:
       break;
  }
  
  // Draw items primo livello
  if (!doorOpening[0]) door.drawItem();
  else {
    doorAnimation.x = door.x - worldX + screenX;
    doorAnimation.y = door.y - worldY + screenY;
    doorAnimation.draw(doorOpeningAnimation, 150); 
    int doorOpeningDelay = 505;
    if (timerRunning) {
    int elapsedTime = millis() - startTime;
      if (elapsedTime >= doorOpeningDelay) {
        doorOpening[0] = false;
        repatSound[2] = true;
        timerRunning = false;
      }
    } else startTimer();
  }
  
  if (!doorOpening[1]) LVL1door.drawItem();
  else {
    doorAnimation.x = LVL1door.x - worldX + screenX;
    doorAnimation.y = LVL1door.y - worldY + screenY;
    doorAnimation.draw(doorOpeningAnimation, 150); 
    int LVL1doorOpeningDelay = 505;
    if (timerRunning) {
    int elapsedTime = millis() - startTime;
      if (elapsedTime >= LVL1doorOpeningDelay) {
        doorOpening[1] = false;
        repatSound[3] = true;
        timerRunning = false;
      }
    } else startTimer();
  }
  
  box.drawItem();
  window.drawItem();
  LVL1box.drawItem();
  LVL1window.drawItem();
  LVL1window2.drawItem();
   
  // Controlli per le azioni e i relativi draw del player
  if (leftClickPressed) {
    int delayAttack = 150;
    player.draw(attack, 80);
    if (timerRunning) {
      int elapsedTime = millis() - startTime;
      if (elapsedTime >= delayAttack) {
        attackSound.play();
        leftClickPressed = false;
        timerRunning = false;
      }
    } else startTimer();
  }
  else if (keyUpPressed || keyDownPressed || keyLeftPressed || keyRightPressed) {
    int delaySound = 180;
    player.draw(run, 60);
    if (timerRunning) {
      int elapsedTime = millis() - startTime;
      if (elapsedTime >= delaySound) {
        walkSound.play();
        timerRunning = false;
      }
    } else startTimer();
  }
  else {
    player.draw(idle, 100);
  }
}

void keyPressed() {
  player.keyPressed(key);
}

void keyReleased() {
  player.keyReleased(key);
}

void mouseClicked(){
  player.mouseClicked();
}
