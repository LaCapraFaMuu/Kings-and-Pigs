class Items extends Sprite {
  Timer doorOpeningTimer = new Timer(505);
  
  Items(PImage texture, int x, int y, int width, int height, boolean collision, boolean interactableObj) {
    super(texture, x, y, width, height);
    // Assegnazione variabili per collisione oggetti
    collisionObj[ItemCreationCounter] = collision;
    interactable[ItemCreationCounter] = interactableObj;
    solidObjAreaX[ItemCreationCounter] = x - worldX + screenX;
    solidObjAreaY[ItemCreationCounter] = y - worldY + screenY;
    solidObjWidth[ItemCreationCounter] = width;
    solidObjHeight[ItemCreationCounter] = height;
    ItemCreationCounter++;
  }
  
  // Metodo per logica delle interazioni tra player e oggetti
  void objInteraction(int i) {
    switch(i) {
      case 0:
        if (bombControls[0]) {
          bombExplosion[0]++;
          bombControls[0] = false;
        }
        break;
      case 2:
        doorOpening[0] = true;
        doorOpeningTimer.update();
        if (doorOpeningTimer.tick()) {
          currentLVL++;
          worldX = 23 * tileSize;
          worldY = 8 * tileSize;
          doorOpeningTimer.reset();
        }
        break; 
      case 4:
        if (bombControls[1]) {
          bombExplosion[1]++;
          bombControls[1] = false;
        }
        break;
     case 6:
        doorOpening[1] = true;
        doorOpeningTimer.update();
        if (doorOpeningTimer.tick()) {
          currentLVL++;
          backgroundMusic.stop();
          bossMusic.loop();
          worldX = 5 * tileSize;
          worldY = 15 * tileSize;
          doorOpeningTimer.reset();
        }
        break; 
      case 9:
        if (bombControls[2]) {
          bombExplosion[2]++;
          bombControls[2] = false;
        }
        break;
      case 10:
        if (bombControls[3]) {
          bombExplosion[3]++;
          bombControls[3] = false;
        }
        break;
      case 11:
        if (bombControls[4]) {
          bombExplosion[4]++;
          bombControls[4] = false;
        }
        break;
      case 12:
        if (bombControls[5]) {
          bombExplosion[5]++;
          bombControls[5] = false;
        }
        break;
      case 14:
        if (kingLife <= 0) {
          doorOpening[2] = true;
          doorOpeningTimer.update();
          if (doorOpeningTimer.tick()) {
            currentLVL++;
            new WinGame();
            doorOpeningTimer.reset();
          }
        }
        break;
    }
  }
}
