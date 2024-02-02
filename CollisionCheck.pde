class CollisionCheck {
  void checkTile() {
    int entityLeftWorldX = worldX + solidArea.x;
    int entityRightWorldX = worldX + solidArea.x + solidArea.width;
    int entityTopWorldY = worldY + solidArea.y;
    int entityBottomWorldY = worldY + solidArea.y + solidArea.height;
    
    int entityLeftCol = entityLeftWorldX / tileSize;
    int entityRightCol = entityRightWorldX / tileSize;
    int entityTopRow = entityTopWorldY / tileSize;
    int entityBottomRow = entityBottomWorldY / tileSize;
    
    int tileNum1, tileNum2;
    
    switch(direction) {
      case "Up":
        entityTopRow = (entityTopWorldY - playerSpeed) / tileSize;
        tileNum1 = mapTileNum[entityLeftCol][entityTopRow];
        tileNum2 = mapTileNum[entityRightCol][entityTopRow];
        if (collision[tileNum1] || collision[tileNum2]) {
          collisionOn = true;
        }
        break;
      case "Down":
        entityBottomRow = (entityBottomWorldY + playerSpeed) / tileSize;
        tileNum1 = mapTileNum[entityLeftCol][entityBottomRow];
        tileNum2 = mapTileNum[entityRightCol][entityBottomRow];
        if (collision[tileNum1] || collision[tileNum2]) {
          collisionOn = true;
        }
        break;
      case "Left":
        entityLeftCol = (entityLeftWorldX - playerSpeed) / tileSize;
        tileNum1 = mapTileNum[entityLeftCol][entityTopRow];
        tileNum2 = mapTileNum[entityLeftCol][entityBottomRow];
        if (collision[tileNum1] || collision[tileNum2]) {
          collisionOn = true;
        }
        break;
      case "Right":
        entityRightCol = (entityRightWorldX + playerSpeed) / tileSize;
        tileNum1 = mapTileNum[entityRightCol][entityTopRow];
        tileNum2 = mapTileNum[entityRightCol][entityBottomRow];
        if (collision[tileNum1] || collision[tileNum2]) {
          collisionOn = true;
        }
        break;
    }
  }
  
  boolean checkCoordinates(int i) {
    boolean control = false;
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
    }
    return control;
  }
  
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
      solidObjAreaX[i] = solidObjDefaultAreaX[i];
      solidObjAreaY[i] = solidObjDefaultAreaY[i];
    }
  }
}
