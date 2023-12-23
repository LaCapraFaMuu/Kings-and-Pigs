class Sprite {
  int currentFrame = 0;
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
  void draw() {
    image(texture, x, y, width, height);
  }
  
  // Draw per animazioni
  void draw(PImage[] array, int delay) {
    if (currentFrame >= array.length) currentFrame = 0;
    image(array[currentFrame], x, y, width, height);
    delay(delay);
    currentFrame++;
  }
}
