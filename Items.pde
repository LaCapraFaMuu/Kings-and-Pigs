class Items {
  int x, y, width, height;
  PImage item;
  Items(String path, int x, int y, int width, int height) {
    this.x = x;
    this.y = y;
    this.width = width;
    this.height = height;
    item = loadImage(path);
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
}
