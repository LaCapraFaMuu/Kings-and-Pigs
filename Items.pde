import java.awt.Rectangle;

class Items {
  int x, y, width, height;
  PImage item;
  int currentFrame = 0;
  
  Items(String path, int x, int y, int width, int height, boolean collision, boolean interactableObj) {
    this.x = x;
    this.y = y;
    this.width = width;
    this.height = height;
    item = loadImage(path);
    // Assegnazione variabili per collisione oggetti
    collisionObj[ItemCreationCounter] = collision;
    interactable[ItemCreationCounter] = interactableObj;
    solidObjAreaX[ItemCreationCounter] = x - worldX + screenX;
    solidObjAreaY[ItemCreationCounter] = y - worldY + screenY;
    solidObjDefaultAreaX[ItemCreationCounter] = solidObjAreaX[ItemCreationCounter];
    solidObjDefaultAreaY[ItemCreationCounter] = solidObjAreaY[ItemCreationCounter];
    solidObjWidth[ItemCreationCounter] = width;
    solidObjHeight[ItemCreationCounter] = height;
    itemSolidArea[ItemCreationCounter] = new Rectangle(solidObjAreaX[ItemCreationCounter], solidObjAreaY[ItemCreationCounter], solidObjWidth[ItemCreationCounter],  solidObjHeight[ItemCreationCounter]);
    ItemCreationCounter++;
  }
  
  void drawItem() {
    int X = x - worldX + screenX;
    int Y = y - worldY + screenY;
    if (x + tileSize > worldX - screenX &&
        x - tileSize < worldX + screenX &&
        y + tileSize > worldY - screenY &&
        y - tileSize < worldY + screenY) {
        image(item, X, Y, width, height);
    }
  }
  
  // Metodo per logica delle interazioni con gli oggetti
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
        int doorOpeningDelay = 500;
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
        int LVL1doorOpeningDelay = 500;
        if (timerRunning[13]) {
          int elapsedTime = millis() - startTime[13];
          if (elapsedTime >= LVL1doorOpeningDelay) {
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
      default:
        for (int j = 0; j < bombControls.length; j++) {
          bombControls[j] = false;
        }
        break;
    }
  }
}
