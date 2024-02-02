import java.awt.Rectangle;

Rectangle[] itemSolidArea = new Rectangle[totObj];
boolean[] collisionObj = new boolean[totObj];
boolean[] interactable = new boolean[totObj];
int[] solidObjAreaX = new int[totObj];
int[] solidObjAreaY = new int[totObj];
int[] solidObjDefaultAreaX = new int[totObj];
int[] solidObjDefaultAreaY = new int[totObj];
int[] solidObjWidth = new int[totObj];
int[] solidObjHeight = new int[totObj];
int ItemCreationCounter = 0;
// Variabili per controllo dei draw degli item se distrutti
int bombExplosion = 0;
int LVL1bombExplosion = 0;

boolean[] doorOpening = new boolean[2];

class Items {
  int x, y, width, height;
  PImage item;
  int currentFrame = 0;
  boolean ctrl = true;
  boolean LVL1ctrl = true;
  
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
    // Inizializzazzione variabili per animazione porta
    doorOpening[0] = false; doorOpening[1] = false;
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
  
  void objInteraction(int i) {
    switch(i) {
      case 0:
        if (ctrl) {
          bombExplosion++;
          ctrl = false;
        }
        break;
      case 2:
        doorOpening[0] = true;
        if (repatSound[2]) {
          doorSound.play();
          repatSound[2] = false;
        }
        int doorOpeningDelay = 500;
        if (timerRunning) {
          int elapsedTime = millis() - startTime;
          if (elapsedTime >= doorOpeningDelay) {
            worldX = 23 * tileSize;
            worldY = 8 * tileSize;
            timerRunning = false;
          }
        } else startTimer();
        break; 
      case 4:
        if (LVL1ctrl) {
          LVL1bombExplosion++;
          LVL1ctrl = false;
        }
        break;
     case 6:
        doorOpening[1] = true;
        if (repatSound[3]) {
          doorSound.play();
          repatSound[3] = false;
        }
        int LVL1doorOpeningDelay = 500;
        if (timerRunning) {
          int elapsedTime = millis() - startTime;
          if (elapsedTime >= LVL1doorOpeningDelay) {
            worldX = 7 * tileSize;
            worldY = 18 * tileSize;
            timerRunning = false;
          }
        } else startTimer();
        break;
      default:
        ctrl = false;
        LVL1ctrl = false;
        break;
    }
  }
}
