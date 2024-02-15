class WinGame {
  WinGame() {    
    // Teletrasporto il player alla schermata di vittoria
    worldX = 15 * tileSize;
    worldY = 26 * tileSize;
    playerSpeed = 0; // Per bloccare il player
    
    bossMusic.stop();
    backgroundMusic.stop();
    winMusic.loop();
  }
}
