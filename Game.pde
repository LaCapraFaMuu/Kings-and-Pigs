/*
video #22 0:00
*/

import java.awt.Rectangle;


String rndPath() {
  return "assets/objects/windows/Window" + ((int) random(2) + 1) + ".png";
}

void startTimer(int i) {
  startTime[i] = millis();
  timerRunning[i] = true;
}

// Metodo per caricare immagini in un array
void loadAnimations() {
  for (int i = 0; i < idleFrameMax; i++) idle[i] = loadImage("assets/player/idle/" + i + ".png");
  for (int i = 0; i < runFrameMax; i++) run[i] = loadImage("assets/player/run/" + i + ".png");
  for (int i = 0; i < attackFrameMax; i++) attack[i] = loadImage("assets/player/attack/" + i + ".png");
  for (int i = 0; i < deadFrameMax; i++) dead[i] = loadImage("assets/player/dead/" + i + ".png"); 
  for (int i = 0; i < bombIgnitionFrames; i++) bombIgnitionAnimation[i] = loadImage("assets/objects/bomb/" + i + ".png");
  for (int i = 0; i < bombExplosionFrames; i++) bombExplosionAnimation[i] = loadImage("assets/objects/bomb/bombExplosion/" + i + ".png"); 
  for (int i = 0; i < doorOpeningFrames; i++) doorOpeningAnimation[i] = loadImage("assets/objects/door/" + i + ".png"); 
  for (int i = 0; i < kingIdleFrameMax; i++) kingIdle[i] = loadImage("assets/enemy/king/idle/" + i + ".png"); 
  for (int i = 0; i < kingRunFrameMax; i++) kingRun[i] = loadImage("assets/enemy/king/run/" + i + ".png"); 
  for (int i = 0; i < kingAttackFrameMax; i++) kingAttack[i] = loadImage("assets/enemy/king/attack/" + i + ".png"); 
  // Inizializzazzione per animazioni
  for (int i = 0; i < doorOpening.length; i++) doorOpening[i] = false; 
  for (int i = 0; i < bombExplosion.length; i++) bombExplosion[i] = 0;
  for (int i = 0; i < bombControls.length; i++) bombControls[i] = true;
  // Caricamento immagini singole
  heartTexture = loadImage(heartPath);
  heartBgTexture = loadImage(heartBgPath);
  gameOverTexture = loadImage(gameOverPath);
  winGameTexture = loadImage(winGamePath);
  titleTexture = loadImage(titlePath);
  kingDeadTexture = loadImage(kingDeadPath);
}

// Controlli per le azioni e i relativi draw del player
void playerMovment() {
  if (leftClickPressed) {
    int delayAttack = 250;
    player.draw(attack, 80, false);
    if (timerRunning[9]) {
      int elapsedTime = millis() - startTime[9];
      if (elapsedTime >= delayAttack) {
        attackSound.play();
        leftClickPressed = false;
        timerRunning[9] = false;
      }
    } else startTimer(9);
  }
  else if (keyUpPressed || keyDownPressed || keyLeftPressed || keyRightPressed) {
    int delaySound = 180;
    player.draw(run, 60, false);
    if (timerRunning[10]) {
      int elapsedTime = millis() - startTime[10];
      if (elapsedTime >= delaySound) {
        walkSound.play();
        timerRunning[10] = false;
      }
    } else startTimer(10);
  }
  else {
    player.draw(idle, 100, false);
  } 
}

void explosionHandler(int index, int bombCounter, Items bomb) {
    int bombStartTime = 1000;
    int bombExplosionTime = 200;
    int bombCollisionIndex = 0; // Variabile da passare per controllare la collisione
    switch(index) {
        case 0:
            switch(bombCounter) {
                case 0:
                  bomb.drawItem();
                  break;
                case 1:
                  LVL1bomb.drawItem();
                  break;
                case 2:
                  LVL2bomb.drawItem();
                  break;
                case 3:
                  LVL2bomb2.drawItem();
                  break;
                case 4:
                  LVL2bomb3.drawItem();
                  break;
                case 5:
                  LVL2bomb4.drawItem();
                  break;
            }
            break;
        case 1:
            bombAnimation.x = bomb.x - worldX + screenX;
            bombAnimation.y = bomb.y - worldY + screenY;
            bombAnimation.draw(bombIgnitionAnimation, bombIgniteDelay, false);
            if (timerRunning[bombCounter]) {
                int elapsedTime = millis() - startTime[bombCounter];
                if (elapsedTime >= bombStartTime) {
                bombExplosion[bombCounter]++;
                timerRunning[bombCounter] = false;
                }
            } else startTimer(bombCounter);
            break;
        case 2:
            bombExplosionAnimationFrames.x = bomb.x - worldX + screenX;
            bombExplosionAnimationFrames.y = bomb.y - worldY + screenY;
            bombExplosionAnimationFrames.draw(bombExplosionAnimation, bombExplosionDelay, false);
            switch(bombCounter) {
              case 0:
                bombCollisionIndex = 0;
                break;
              case 1:
                bombCollisionIndex = 4;
                break;
              case 2:
                bombCollisionIndex = 9;
                break;
              case 3:
                bombCollisionIndex = 10;
                break;
              case 4:
                bombCollisionIndex = 11;
                break;
              case 5:
                bombCollisionIndex = 12;
                break; 
            }
            if (timerRunning[bombCounter]) {
                int elapsedTime = millis() - startTime[bombCounter];
                if (elapsedTime >= bombExplosionTime) {
                  if (cCheck.checkAnimation(bombCollisionIndex)) life--;
                  explosionSound.play();
                  bombExplosion[bombCounter]++;
                  timerRunning[bombCounter] = false;
                }
            } else startTimer(bombCounter);
            break; 
        default:
            break;
    }
}

void doorOpeningHandler(boolean isDoorOpening, int doorCounter, Items door, int index) {    
  if (!isDoorOpening) door.drawItem();
  else {
      doorAnimation.x = door.x - worldX + screenX;
      doorAnimation.y = door.y - worldY + screenY;
      doorAnimation.draw(doorOpeningAnimation, 150, false); 
      int doorOpeningDelay = 505;
      if (timerRunning[doorCounter]) {
      int elapsedTime = millis() - startTime[doorCounter];
        if (elapsedTime >= doorOpeningDelay) {
          isDoorOpening = false;
          doorOpening[index] = false;
          timerRunning[doorCounter] = false;
        }
      } else startTimer(doorCounter);
  }
}

void settings() {
  size(screenWidth, screenHeight);
}

void setup () {
  windowTitle(GAME_TITLE);
  windowResizable(false);
  frameRate(FRAME_RATE);
  background(63,56,81);
  
  // Caricamento array per animazioni
  loadAnimations();
  
  // Creazione audio
  backgroundMusic = new Sound(this, bgMusicPath);
  bossMusic = new Sound(this, bossMusicPath);
  endMusic = new Sound(this, endMusicPath);
  winMusic = new Sound(this, winMusicPath);
  walkSound = new Sound(this, walkPath);
  attackSound = new Sound(this, attackPath);
  explosionSound = new Sound(this, explosionPath);
  backgroundMusic.loop();
   
  // Creazione sfondo
  tile = new Tiles(tiles, tileSize, tileSize);
  tile.loadTiles();
  
  // Creazione oggetti (Primo true/false per dire se hanno hitbox o no | Secondo true/false per dire se hanno interazioni o no)
  bomb = new Items(bombImg, bombX, bombY, 128, 128, false, true);
  box = new Items(boxImg, boxX, boxY, 48, 42, true, false);
  door = new Items(doorImg, doorX, doorY, 100, 110, false, true);
  window = new Items(rndPath(), windowX, windowY, 120, 120, false, false);
  // Oggetti livello 1
  LVL1bomb = new Items(bombImg, LVL1bombX, LVL1bombY, 128, 128, false, true);
  LVL1box = new Items(boxImg, LVL1boxX, LVL1boxY, 48, 42, true, false);
  LVL1door = new Items(doorImg, LVL1doorX, LVL1doorY, 100, 110, false, true); //<>//
  LVL1window = new Items(rndPath(), LVL1windowX, LVL1windowY, 120, 120, false, false);
  LVL1window2 = new Items(rndPath(), LVL1windowX2, LVL1windowY2, 120, 120, false, false);
  // Oggetti livello 2
  LVL2bomb = new Items(bombImg, LVL2bombX, LVL2bombY, 128, 128, false, true);
  LVL2bomb2 = new Items(bombImg, LVL2bombX2, LVL2bombY2, 128, 128, false, true);
  LVL2bomb3 = new Items(bombImg, LVL2bombX3, LVL2bombY3, 128, 128, false, true);
  LVL2bomb4 = new Items(bombImg, LVL2bombX4, LVL2bombY4, 128, 128, false, true);
  LVL2box = new Items(boxImg, LVL2boxX, LVL2boxY, 48, 42, true, false);
  LVL2door = new Items(doorImg, LVL2doorX, LVL2doorY, 100, 110, false, true);
  LVL2window = new Items(rndPath(), LVL2windowX, LVL2windowY, 120, 120, false, false);
  LVL2window2 = new Items(rndPath(), LVL2windowX2, LVL2windowY2, 120, 120, false, false);
  LVL2window3 = new Items(rndPath(), LVL2windowX3, LVL2windowY3, 120, 120, false, false);
  
  // Caricamento array item
  items[0] = bomb; items[1] = box; items[2] = door; items[3] = window;
  items[4] = LVL1bomb; items[5] = LVL1box; items[6] = LVL1door; items[7] = LVL1window; items[8] = LVL1window2;
  items[9] = LVL2bomb; items[10] = LVL2bomb2; items[11] = LVL2bomb3; items[12] = LVL2bomb4; items[13] = LVL2box; items[14] = LVL2door;
  
  // Creazione animazioni
  bombAnimation = new BombAnimation(bombIgnitionAnimation, 128, 128);
  bombExplosionAnimationFrames = new BombExplosionAnimation(bombExplosionAnimation, 128, 128);
  doorAnimation = new DoorAnimation(doorOpeningAnimation, 100, 110); 

  // Creazione player
  player = new Player(idle, 128, 128, 'w', 's', 'a', 'd');
  player.x = screenX;
  player.y = screenY;
  
  // Creazione enemy
  kingPig = new KingPig(kingIdle, 70, 70);
  kingPig.x = 11 * tileSize;
  kingPig.y = 17 * tileSize;
  
  // Creazione HUD
  heart = new SingleSprite(heartTexture, heartX, heartY, 20, 20);
  heart2 = new SingleSprite(heartTexture, heartX + 22, heartY, 20, 20);
  heart3 = new SingleSprite(heartTexture, heartX + 22 * 2, heartY, 20, 20);
  heartBg = new SingleSprite(heartBgTexture, heartBgX, heartBgY, 132, 68);
  gameOverImg = new SingleSprite(gameOverTexture, screenX - 150, screenY - 150, 300, 300);
  winGameImg = new SingleSprite(winGameTexture, screenX - 50, screenY - 200, 300, 300);
  titleImg = new SingleSprite(titleTexture, titleX, titleY, 234, 24);
  kingDeadImg = new SingleSprite(kingDeadTexture, kingDeadX, kingDeadY, 84, 64);
}

void draw() {  
  background(63,56,81);
  // Movimento player e controllo collisioni
  player.update();
  
  // Draw mappa
  tile.displayTiles();
  // Animazioni bomb
  explosionHandler(bombExplosion[0], 0, bomb);
  explosionHandler(bombExplosion[1], 1, LVL1bomb);
  explosionHandler(bombExplosion[2], 2, LVL2bomb);
  explosionHandler(bombExplosion[3], 3, LVL2bomb2);
  explosionHandler(bombExplosion[4], 4, LVL2bomb3);
  explosionHandler(bombExplosion[5], 5, LVL2bomb4);
  
  // Animazioni door
  doorOpeningHandler(doorOpening[0], 6, door, 0);
  doorOpeningHandler(doorOpening[1], 7, LVL1door, 1);
  doorOpeningHandler(doorOpening[2], 8, LVL2door, 2);
  
  // Draw Oggetti
  box.drawItem();
  window.drawItem();
  LVL1box.drawItem();
  LVL1window.drawItem();
  LVL1window2.drawItem();
  LVL2box.drawItem();
  LVL2window.drawItem();
  LVL2window2.drawItem();
  LVL2window3.drawItem();
  
  // Update enemy
  kingPig.update();
  
  // Draw elementi HUD e controlli se il player è vivo
  titleImg.draw(true);
  kingDeadImg.draw(true);
  heartBg.draw(false);
  switch(life) {
    case 1:
      playerMovment();
      heart.draw(false);
      break;
    case 2:
      playerMovment();
      heart.draw(false);
      heart2.draw(false);
      break;
    case 3:
      playerMovment();
      heart.draw(false);
      heart2.draw(false);
      heart3.draw(false);
      break;
    default:
      new GameOver();
      break;
  }
  
  if (gameWon) {
    winGameImg.draw(false);
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
