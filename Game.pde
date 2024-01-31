/*
video #8 19:00
trovare modo per rallentare animazioni senza delay
*/

Player player;
Tiles tile;
BombAnimation bombAnimation;
BombExplosionAnimation bombExplosionAnimationFrames;

String rndPath() {
  int rnd = (int)random(2);
  String windowPath;
  if (rnd < 1) windowPath = "assets/objects/windows/Window1.png";
  else windowPath = "assets/objects/windows/Window2.png";
  return windowPath;
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
  LVL1door = new Items(doorImg, LVL1doorX, LVL1doorY, 100, 110, false, true); //<>//
  LVL1window = new Items(rndPath(), LVL1windowX, LVL1windowY, 120, 120, false, false);
  LVL1window2 = new Items(rndPath(), LVL1windowX2, LVL1windowY2, 120, 120, false, false);
  
  bombAnimation = new BombAnimation(bombIgnitionAnimation, 128, 128);
  bombExplosionAnimationFrames = new BombExplosionAnimation(bombExplosionAnimation, 128, 128);
  
  items[0] = bomb; items[1] = box; items[2] = door; items[3] = window;
  items[4] = LVL1bomb; items[5] = LVL1box; items[6] = LVL1door; items[7] = LVL1window; items[8] = LVL1window2;
   
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
      bombAnimation.draw(bombIgnitionAnimation, 10);
      bombExplosion++;
      break;
    case 2:
      bombExplosionAnimationFrames.x = bomb.x - worldX + screenX;
      bombExplosionAnimationFrames.y = bomb.y - worldY + screenY;
      bombExplosionAnimationFrames.draw(bombExplosionAnimation, 10);
      break;   
  }
  
  switch (LVL1bombExplosion) {
    case 0:
      LVL1bomb.drawItem();
      break;
    case 1:
      bombAnimation.x = LVL1bomb.x - worldX + screenX;
      bombAnimation.y = LVL1bomb.y - worldY + screenY;
      bombAnimation.draw(bombIgnitionAnimation, 10);
      LVL1bombExplosion++; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! RITARDARE QUESTA CAZZO DI OPERAZIONE DI MERDA
      break;
    case 2:
      bombExplosionAnimationFrames.x = LVL1bomb.x - worldX + screenX;
      bombExplosionAnimationFrames.y = LVL1bomb.y - worldY + screenY;
      bombExplosionAnimationFrames.draw(bombExplosionAnimation, 10);
      break;   
  }
  
  
  // Draw items primo livello
  box.drawItem();
  door.drawItem();
  window.drawItem();
  // Draw items secondo livello
  LVL1box.drawItem();
  LVL1door.drawItem();
  LVL1window.drawItem();
  LVL1window2.drawItem();
   
  // Controlli per le azioni e i relativi draw del player
  if (leftClickPressed) {
    player.draw(attack, 80);
    leftClickPressed = false;
  }
  else if (keyUpPressed || keyDownPressed || keyLeftPressed || keyRightPressed) {
    player.draw(run, 20);
  }
  else {
    player.draw(idle, 70);
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
