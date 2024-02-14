class CollisionCheck {
  // Metodo per controllare collisioni con la mappa
  void checkTile(boolean isPlayer) {
    int entityLeftWorldX;
    int entityRightWorldX;
    int entityTopWorldY;
    int entityBottomWorldY; 
    int tileNum1, tileNum2;
    int speed;
    String entityDirection;
    
    if (isPlayer) {
      entityLeftWorldX = worldX + solidArea.x;
      entityRightWorldX = worldX + solidArea.x + solidArea.width;
      entityTopWorldY = worldY + solidArea.y;
      entityBottomWorldY = worldY + solidArea.y + solidArea.height; 
      speed = playerSpeed;
      entityDirection = direction;
    }
    else {
      entityLeftWorldX = kingPig.x + kingSolidArea.x;
      entityRightWorldX =  kingPig.x + kingSolidArea.x + kingSolidArea.width;
      entityTopWorldY =  kingPig.y + kingSolidArea.y;
      entityBottomWorldY =  kingPig.y + kingSolidArea.y + kingSolidArea.height;
      speed = kingSpeed;
      entityDirection = kingDirection;
    }
    
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
  boolean checkCoordinates(int i) {
    boolean control = false;
    if (items[i] != null) {
      switch(i) {
        case 0:
          if (bombX < solidAreaX + solidAreaWidth &&
              bombX + solidObjWidth[i] > solidAreaX && 
              bombY  < solidAreaY + solidAreaHeight &&
              bombY + solidObjHeight[i] > solidAreaY)
              control = true;
          break;
        case 1:
          if (boxX < solidAreaX + solidAreaWidth &&
              boxX + solidObjWidth[i] > solidAreaX && 
              boxY  < solidAreaY + solidAreaHeight && 
              boxY + solidObjHeight[i] > solidAreaY)
              control = true;
          break;
        case 2:
          if (doorX < solidAreaX + solidAreaWidth &&
              doorX + solidObjWidth[i] > solidAreaX && 
              doorY  < solidAreaY + solidAreaHeight && 
              doorY + solidObjHeight[i] > solidAreaY)
              control = true;
          break;
        case 3:
          if (windowX < solidAreaX + solidAreaWidth &&
              windowX + solidObjWidth[i] > solidAreaX && 
              windowY  < solidAreaY + solidAreaHeight && 
              windowY + solidObjHeight[i] > solidAreaY)
              control = true;
          break;
        case 4:
          if (LVL1bombX < solidAreaX + solidAreaWidth &&
              LVL1bombX + solidObjWidth[i] > solidAreaX && 
              LVL1bombY  < solidAreaY + solidAreaHeight && 
              LVL1bombY + solidObjHeight[i] > solidAreaY)
              control = true;
          break;
        case 5:
          if (LVL1boxX < solidAreaX + solidAreaWidth &&
              LVL1boxX + solidObjWidth[i] > solidAreaX && 
              LVL1boxY  < solidAreaY + solidAreaHeight && 
              LVL1boxY + solidObjHeight[i] > solidAreaY)
              control = true;
          break;
        case 6:
          if (LVL1doorX < solidAreaX + solidAreaWidth &&
              LVL1doorX + solidObjWidth[i] > solidAreaX && 
              LVL1doorY  < solidAreaY + solidAreaHeight && 
              LVL1doorY + solidObjHeight[i] > solidAreaY)
              control = true;
          break;
        case 9:
          if (LVL2bombX < solidAreaX + solidAreaWidth &&
              LVL2bombX + solidObjWidth[i] > solidAreaX && 
              LVL2bombY  < solidAreaY + solidAreaHeight && 
              LVL2bombY + solidObjHeight[i] > solidAreaY)
              control = true;
          break;
        case 10:
          if (LVL2bombX2 < solidAreaX + solidAreaWidth &&
              LVL2bombX2 + solidObjWidth[i] > solidAreaX && 
              LVL2bombY2  < solidAreaY + solidAreaHeight && 
              LVL2bombY2 + solidObjHeight[i] > solidAreaY)
              control = true;
          break;
        case 11:
          if (LVL2bombX3 < solidAreaX + solidAreaWidth &&
              LVL2bombX3 + solidObjWidth[i] > solidAreaX && 
              LVL2bombY3  < solidAreaY + solidAreaHeight && 
              LVL2bombY3 + solidObjHeight[i] > solidAreaY)
              control = true;
          break;
        case 12:
          if (LVL2bombX4 < solidAreaX + solidAreaWidth &&
              LVL2bombX4 + solidObjWidth[i] > solidAreaX && 
              LVL2bombY4  < solidAreaY + solidAreaHeight && 
              LVL2bombY4 + solidObjHeight[i] > solidAreaY)
              control = true;
          break;
        case 13:
          if (LVL2boxX < solidAreaX + solidAreaWidth &&
              LVL2boxX + solidObjWidth[i] > solidAreaX && 
              LVL2boxY  < solidAreaY + solidAreaHeight && 
              LVL2boxY + solidObjHeight[i] > solidAreaY)
              control = true;
          break;
        case 14:
          if (LVL2doorX < solidAreaX + solidAreaWidth &&
              LVL2doorX + solidObjWidth[i] > solidAreaX && 
              LVL2doorY  < solidAreaY + solidAreaHeight && 
              LVL2doorY + solidObjHeight[i] > solidAreaY)
              control = true;
          break;
      }
    }
    return control;
  }
  
  // Metodo per controllare eventi con gli oggetti
  void checkObject() {
    for (int i = 0; i < totObj; i++) {
      solidAreaX = worldX + solidAreaX;
      solidAreaY = worldY + solidAreaY;
      
      switch (direction) {
        case "Up":
          solidAreaY -= playerSpeed;
          if (checkCoordinates(i)) {
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
          if (checkCoordinates(i)) {
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
          if (checkCoordinates(i)) {
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
          if (checkCoordinates(i)) {
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
  
  boolean checkAnimation(int i) {
    boolean control = false;
    if(i == 0 || i == 4 || i == 9 || i == 10 || i == 11 || i == 12) {
      Rectangle explosionArea = new Rectangle(bombExplosionAnimationFrames.x, bombExplosionAnimationFrames.y, 170, 170);
      Rectangle playerHitbox = new Rectangle(screenX, screenY, solidAreaWidth, solidAreaHeight);
      if (playerHitbox.intersects(explosionArea))
          control = true;
    }
    return control;
  }
}
