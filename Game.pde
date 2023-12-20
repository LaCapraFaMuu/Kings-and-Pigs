/*
video #7 0:0
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
  tile.position = new Vector();
  tile.loadTiles();
   
  // Creazione player
  player = new Player(idle, 128, 128, 'w', 's', 'a', 'd');
  player.position = new Vector(screenX,screenY);
  player.speed = new Vector(playerSpeed,playerSpeed);
}

void update() {
  player.update();
}

void draw() {
  background(0);
  update();
  tile.displayTiles();
   
  // Controlli per le azioni e i relativi draw
  if (leftClickPressed) {
    player.draw(attack, 50);
    leftClickPressed = false; // CAMBIARE PERCHE ANIMAZIONE MERDA
  }
  else if (keyUpPressed || keyDownPressed || keyLeftPressed || keyRightPressed) {
    player.draw(run, 10);
  }
  else {
    player.draw(idle, 50);
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
