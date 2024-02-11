boolean gameWon = false;

class WinGame {
  WinGame() {    
    worldX = 15 * tileSize;
    worldY = 26 * tileSize;
    playerSpeed = 0; // Per bloccare il player
    gameWon = true;
    
    bossMusic.stop();
    backgroundMusic.stop();
    winMusic.loop();
  }
}
