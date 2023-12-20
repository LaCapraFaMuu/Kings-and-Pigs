class CollisionCheck {
  CollisionCheck() {
  }
  
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
}
