class CollisionCheck {
  // Metodo per controllare collisioni con la mappa
  void checkTile(boolean isPlayer) {
    // If nella definizione delle variabili
    int entityLeftWorldX = isPlayer ? worldX + solidAreaX : kingPig.x + kingSolidAreaX;
    int entityRightWorldX = isPlayer ? worldX + solidAreaX + solidAreaWidth : kingPig.x + kingSolidAreaX + kingSolidAreaWidth;
    int entityTopWorldY = isPlayer ? worldY + solidAreaY : kingPig.y + kingSolidAreaY;
    int entityBottomWorldY = isPlayer ? worldY + solidAreaY + solidAreaHeight : kingPig.y + kingSolidAreaY + kingSolidAreaHeight;
    int speed = isPlayer ? playerSpeed : kingSpeed;
    String entityDirection = isPlayer ? direction : kingDirection;
    
    int tileNum1, tileNum2;
    int entityLeftCol = entityLeftWorldX / tileSize;
    int entityRightCol = entityRightWorldX / tileSize;
    int entityTopRow = entityTopWorldY / tileSize;
    int entityBottomRow = entityBottomWorldY / tileSize;
    
    switch(entityDirection) {
      case "Up":
        entityTopRow = (entityTopWorldY - speed) / tileSize;
        tileNum1 = mapTileNum[entityLeftCol][entityTopRow];
        tileNum2 = mapTileNum[entityRightCol][entityTopRow];
        if (collision[tileNum1] || collision[tileNum2]) {
          if (isPlayer) collisionOn = true;
          else kingCollisionOn = true;
        }
        break;
      case "Down":
        entityBottomRow = (entityBottomWorldY + speed) / tileSize;
        tileNum1 = mapTileNum[entityLeftCol][entityBottomRow];
        tileNum2 = mapTileNum[entityRightCol][entityBottomRow];
        if (collision[tileNum1] || collision[tileNum2]) {
          if (isPlayer) collisionOn = true;
          else kingCollisionOn = true;
        }
        break;
      case "Left":
        entityLeftCol = (entityLeftWorldX - speed) / tileSize;
        tileNum1 = mapTileNum[entityLeftCol][entityTopRow];
        tileNum2 = mapTileNum[entityLeftCol][entityBottomRow];
        if (collision[tileNum1] || collision[tileNum2]) {
          if (isPlayer) collisionOn = true;
          else kingCollisionOn = true;
        }
        break;
      case "Right":
        entityRightCol = (entityRightWorldX + speed) / tileSize;
        tileNum1 = mapTileNum[entityRightCol][entityTopRow];
        tileNum2 = mapTileNum[entityRightCol][entityBottomRow];
        if (collision[tileNum1] || collision[tileNum2]) {
          if (isPlayer) collisionOn = true;
          else kingCollisionOn = true;
        }
        break;
      case "Stop":
        kingCollisionOn = true;
        break;
    }
  }
  
  // Metodo per controllare le collisioni degli oggetti
  boolean checkCoordinates(int i, int x, int y) {
    boolean control = false;
    if (items[i] != null)
      if (x < solidAreaX + solidAreaWidth &&
          x + solidObjWidth[i] > solidAreaX && 
          y  < solidAreaY + solidAreaHeight && 
          y + solidObjHeight[i] > solidAreaY)
          control = true;
      return control;
  }
  
  // Metodo per controllare eventi con gli oggetti
  void checkObject() {
    int itemX = 0;
    int itemY = 0;
    for (int i = 0; i < totObj; i++) {
      solidAreaX = worldX + solidAreaX;
      solidAreaY = worldY + solidAreaY;
      switch (i) {
        case 0:
          itemX = bombX;
          itemY = bombY;
          break;
        case 1:
          itemX = boxX;
          itemY = boxY;
          break;
       case 2:
         itemX = doorX;
         itemY = doorY;
         break;
       case 4:
         itemX = LVL1bombX;
         itemY = LVL1bombY;
         break;
       case 5:
         itemX = LVL1boxX;
         itemY = LVL1boxY;
         break;
       case 6:
         itemX = LVL1doorX;
         itemY = LVL1doorY;
         break;
       case 9:
         itemX = LVL2bombX;
         itemY = LVL2bombY;
         break;
       case 10:
         itemX = LVL2bombX2;
         itemY = LVL2bombY2;
         break;
       case 11:
         itemX = LVL2bombX3;
         itemY = LVL2bombY3;
         break;
       case 12:
         itemX = LVL2bombX4;
         itemY = LVL2bombY4;
         break;
       case 13:
         itemX = LVL2boxX;
         itemY = LVL2boxY;
         break;
       case 14:
         itemX = LVL2doorX;
         itemY = LVL2doorY;
         break;
      }
      
      switch (direction) {
        case "Up":
          solidAreaY -= playerSpeed;
          if (checkCoordinates(i, itemX, itemY)) {
            if (interactable[i]) {
              items[i].objInteraction(i);
            }
            else if (collisionObj[i]) {
              collisionOn = true; 
            }
          }
          break;
        case "Down":
          solidAreaY += playerSpeed;
          if (checkCoordinates(i, itemX, itemY)) {
            if (interactable[i]) {
              items[i].objInteraction(i);
            }
            else if (collisionObj[i]) {
              collisionOn = true; 
            }
          }
          break;
        case "Left":
          solidAreaX -= playerSpeed;
          if (checkCoordinates(i, itemX, itemY)) {
            if (interactable[i]) {
              items[i].objInteraction(i);
            }
            else if (collisionObj[i]) {
              collisionOn = true; 
            }
          }
          break;
        case "Right":
          solidAreaX += playerSpeed;
          if (checkCoordinates(i, itemX, itemY)) {
            if (interactable[i]) {
              items[i].objInteraction(i);
            }
            else if (collisionObj[i]) {
              collisionOn = true; 
            }
          }
          break;
      }
      solidAreaX = solidAreaDefaultX;
      solidAreaY = solidAreaDefaultY;
    }
  }
  
  // Metodo per controllare la collisione di un Item durante un'animazione
  boolean checkAnimation(int i) {
    boolean control = false;
    Rectangle playerHitbox = new Rectangle(screenX, screenY, solidAreaWidth, solidAreaHeight);
    if(i == 0 || i == 4 || i == 9 || i == 10 || i == 11 || i == 12) {
      Rectangle explosionArea = new Rectangle(bombExplosionAnimationObj.x - 50, bombExplosionAnimationObj.y - 50, 150, 150);
      if (playerHitbox.intersects(explosionArea)) control = true;
    }
    return control;
  }
  
  boolean checkEnemy() {
   boolean control = false;
   Rectangle playerHitbox = new Rectangle(worldX + 40, worldY, solidAreaWidth, solidAreaHeight);
   Rectangle kingPigHitbox = new Rectangle(kingPig.x - 40, kingPig.y - 30, 70, 30);
   if (playerHitbox.intersects(kingPigHitbox))  control = true;
   return control;
  }
}
