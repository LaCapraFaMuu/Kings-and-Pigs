/*
video #8 0:0
fixare animazione attacco + trovare modo per rallentare animazioni senza delay
*/

Player player;
Tiles tile;

void settings() {
  size(screenWidth,screenHeight);
}

void setup () {
  windowTitle(GAME_TITLE);
  windowResizable(false);
  frameRate(FRAME_RATE);
  background(0);
   
  // Creazione sfondo
  tile = new Tiles(tiles, tileSize, tileSize);
  tile.loadTiles();
  // Creazione oggetti
  bomb = new Items(bombImg, bombX, bombY, 128, 128);
  box = new Items(boxImg, boxX, boxY, 48, 42);
  door = new Items(doorImg, doorX, doorY, 100, 110);
  
   
  // Creazione player
  player = new Player(idle, 128, 128, 'w', 's', 'a', 'd');
  player.x = screenX;
  player.y = screenY;
}

void update() {
  player.update();
}

void draw() {
  background(0);
  update();
  
  // Draw tiles
  tile.displayTiles();
  // Draw Oggetti
  bomb.drawItem();
  box.drawItem();
  door.drawItem();
   
  // Controlli per le azioni e i relativi draw del player
  if (leftClickPressed) {
    player.draw(attack, 100);
    leftClickPressed = false; // CAMBIARE PERCHE ANIMAZIONE MERDA
  }
  else if (keyUpPressed || keyDownPressed || keyLeftPressed || keyRightPressed) {
    player.draw(run, 10);
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
