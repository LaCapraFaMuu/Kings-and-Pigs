import java.awt.Rectangle; //<>//

// Metodo per iniziare un nuovo timer
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
  bombTexture = loadImage(bombPath);
  boxTexture = loadImage(boxPath);
  doorTexture = loadImage(doorPath);
  windowTexture = loadImage("assets/objects/windows/Window" + ((int) random(2) + 1) + ".png");
  heartTexture = loadImage(heartPath);
  heartBgTexture = loadImage(heartBgPath);
  gameOverTexture = loadImage(gameOverPath);
  winGameTexture = loadImage(winGamePath);
  titleTexture = loadImage(titlePath);
  kingDeadTexture = loadImage(kingDeadPath);
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
  bomb = new Items(bombTexture, bombX, bombY, 128, 128, false, true);
  box = new Items(boxTexture, boxX, boxY, 48, 42, true, false);
  door = new Items(doorTexture, doorX, doorY, 100, 110, false, true);
  window = new Items(windowTexture, windowX, windowY, 120, 120, false, false);
  // Oggetti livello 1
  LVL1bomb = new Items(bombTexture, LVL1bombX, LVL1bombY, 128, 128, false, true);
  LVL1box = new Items(boxTexture, LVL1boxX, LVL1boxY, 48, 42, true, false);
  LVL1door = new Items(doorTexture, LVL1doorX, LVL1doorY, 100, 110, false, true); //<>//
  LVL1window = new Items(windowTexture, LVL1windowX, LVL1windowY, 120, 120, false, false);
  LVL1window2 = new Items(windowTexture, LVL1windowX2, LVL1windowY2, 120, 120, false, false);
  // Oggetti livello 2
  LVL2bomb = new Items(bombTexture, LVL2bombX, LVL2bombY, 128, 128, false, true);
  LVL2bomb2 = new Items(bombTexture, LVL2bombX2, LVL2bombY2, 128, 128, false, true);
  LVL2bomb3 = new Items(bombTexture, LVL2bombX3, LVL2bombY3, 128, 128, false, true);
  LVL2bomb4 = new Items(bombTexture, LVL2bombX4, LVL2bombY4, 128, 128, false, true);
  LVL2box = new Items(boxTexture, LVL2boxX, LVL2boxY, 48, 42, true, false);
  LVL2door = new Items(doorTexture, LVL2doorX, LVL2doorY, 100, 110, false, true);
  LVL2window = new Items(windowTexture, LVL2windowX, LVL2windowY, 120, 120, false, false);
  LVL2window2 = new Items(windowTexture, LVL2windowX2, LVL2windowY2, 120, 120, false, false);
  LVL2window3 = new Items(windowTexture, LVL2windowX3, LVL2windowY3, 120, 120, false, false);
  
  // Caricamento array item
  items[0] = bomb; items[1] = box; items[2] = door; items[3] = window;
  items[4] = LVL1bomb; items[5] = LVL1box; items[6] = LVL1door; items[7] = LVL1window; items[8] = LVL1window2;
  items[9] = LVL2bomb; items[10] = LVL2bomb2; items[11] = LVL2bomb3; items[12] = LVL2bomb4; items[13] = LVL2box; items[14] = LVL2door;
  
  // Creazione animazioni
  bombAnimation = new BombAnimation(bombIgnitionAnimation, 128, 128);
  bombExplosionAnimationObj = new BombExplosionAnimation(bombExplosionAnimation, 128, 128);
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
  // Update del player
  player.update();
  // Draw mappa
  tile.displayTiles();
  
  switch(currentLVL) {
    case 0:
      box.draw(true);
      window.draw(true);
      bombExplosionAnimationObj.explosionHandler(bombExplosion[0], 0, bomb);
      doorAnimation.doorOpeningHandler(doorOpening[0], 6, door, 0);
      break;
    case 1:
      LVL1box.draw(true);
      LVL1window.draw(true);
      LVL1window2.draw(true);
      bombExplosionAnimationObj.explosionHandler(bombExplosion[1], 1, LVL1bomb);
      doorAnimation.doorOpeningHandler(doorOpening[1], 7, LVL1door, 1);
      break;
    case 2:
      LVL2box.draw(true);
      LVL2window.draw(true);
      LVL2window2.draw(true);
      LVL2window3.draw(true);
      bombExplosionAnimationObj.explosionHandler(bombExplosion[2], 2, LVL2bomb);
      bombExplosionAnimationObj.explosionHandler(bombExplosion[3], 3, LVL2bomb2);
      bombExplosionAnimationObj.explosionHandler(bombExplosion[4], 4, LVL2bomb3);
      bombExplosionAnimationObj.explosionHandler(bombExplosion[5], 5, LVL2bomb4);
      doorAnimation.doorOpeningHandler(doorOpening[2], 8, LVL2door, 2);
      kingPig.update(); // Update dell'enemy
      break;
    case 3:
      winGameImg.draw(false);
      break;
  }
  
  // Draw elementi HUD e controlli se il player è vivo
  titleImg.draw(true);
  kingDeadImg.draw(true);
  heartBg.draw(false);
  switch(life) {
    case 1:
      player.movment();
      heart.draw(false);
      break;
    case 2:
      player.movment();
      heart.draw(false);
      heart2.draw(false);
      break;
    case 3:
      player.movment();
      heart.draw(false);
      heart2.draw(false);
      heart3.draw(false);
      break;
    default:
      new GameOver();
      break;
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
