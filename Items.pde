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
      // Bomb
      case 0:
        if (ctrl) {
          bombExplosion++;
          ctrl = false;
        }
        break;
      // Door
      case 2:
        // Va messo controllo se fatto qulcosa di specifico (per prossimi livelli basta fare un altro switch che per ogni case aumenta il contatore)
        worldX = 23 * tileSize;
        worldY = 8 * tileSize;
        break;
        
      case 4:
        if (LVL1ctrl) {
          LVL1bombExplosion++;
          LVL1ctrl = false;
        }
        break;
        
      default:
        ctrl = false;
        LVL1ctrl = false;
        break;
    }
  }
}
