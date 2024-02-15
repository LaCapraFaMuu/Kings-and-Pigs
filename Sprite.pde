class Sprite {
  int currentFrame = 0;
  int lastFrameTime = 0;
  PImage texture;
  PImage[] animation;
  int width, height, x, y;
  // Costruttore per immagine singola
  Sprite(PImage texture, int x, int y, int width, int height) {
    this.width = width;
    this.height = height;
    this.x = x;
    this.y = y;
    this.texture = texture;
  }
  
  // Costruttore per animazioni di piu immagini
  Sprite (PImage[] animation, int width, int height) {
    this.width = width;
    this.height = height;
    this.animation = animation;
  }

  // Draw per immagine singola
  void draw(boolean isStatic) {
    if (isStatic) image(texture, x - worldX + screenX, y - worldY + screenY, width, height);
    else image(texture, x, y, width, height);
  }
  
  void draw(PImage[] array, int delay, boolean isStatic) {
    if (array.length > 0) {
      if (millis() - lastFrameTime > delay) {
        currentFrame = (currentFrame + 1) % array.length;
        lastFrameTime = millis();
      }
      if (currentFrame >= 0 && currentFrame < array.length) {
        if (isStatic) image(array[currentFrame], x - worldX + screenX, y - worldY + screenY, width, height);
        else image(array[currentFrame], x, y, width, height);
      }
    }
  }
}
