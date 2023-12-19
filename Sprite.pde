class Sprite {
  public int currentFrame = 0; // Globale in modo che il valore venga resettato quando schiaccio il tasto per il movimento
  PImage texture;
  PImage[] animation;
  int width, height;
  Vector position;
  Vector speed;

  // Costruttore per immagine singola
  Sprite(String path, int width, int height) {
    this.width = width;
    this.height = height;
    this.position = new Vector();
    this.speed = new Vector();
    this.texture = loadImage(path);
  }
  
  // Costruttore per animazioni di piu immagini
  Sprite (PImage[] animation, int width, int height) {
    this.width = width;
    this.height = height;
    this.position = new Vector();
    this.speed = new Vector();
    this.animation = animation;
  }

  // Draw per immagine singola
  void draw() {
    image(texture, position.x, position.y, width, height);
  }
  
  // Draw per animazioni
  void draw(PImage[] array, int delay) {
    if (currentFrame >= array.length) currentFrame = 0;
    image(array[currentFrame], position.x, position.y, width, height);
    delay(delay);
    currentFrame++;
    System.out.println(currentFrame); // DEBUG
  }
}
