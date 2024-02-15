class Items extends Sprite {
  int currentFrame = 0;
  
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
        if (timerRunning[12]) {
          int elapsedTime = millis() - startTime[12];
          if (elapsedTime >= doorOpeningDelay) {
            worldX = 23 * tileSize;
            worldY = 8 * tileSize;
            timerRunning[12] = false;
          }
        } else startTimer(12);
        break; 
      case 4:
        if (bombControls[1]) {
          bombExplosion[1]++;
          bombControls[1] = false;
        }
        break;
     case 6:
        doorOpening[1] = true;
        if (timerRunning[13]) {
          int elapsedTime = millis() - startTime[13];
          if (elapsedTime >= doorOpeningDelay) {
            backgroundMusic.stop();
            bossMusic.loop();
            worldX = 5 * tileSize;
            worldY = 15 * tileSize;
            timerRunning[13] = false;
          }
        } else startTimer(13);
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
        doorOpening[2] = true;
        if (timerRunning[14]) {
          int elapsedTime = millis() - startTime[14];
          if (elapsedTime >= doorOpeningDelay) {
            new WinGame();
            timerRunning[14] = false;
          }
        } else startTimer(14);
        break; 
      default:
        for (int j = 0; j < bombControls.length; j++) {
          bombControls[j] = false;
        }
        break;
    }
  }
}
