class Player extends Sprite {
  Player(PImage[] animation, int width, int height, char up, char down, char left, char right) {
    super(animation, width, height);
    keyUp = up;
    keyDown = down;
    keyLeft = left;
    keyRight = right;
    // Inizializzazione variabili movimento a false
    keyUpPressed = false;
    keyDownPressed = false;
    keyLeftPressed = false;
    keyRightPressed = false;
    leftClickPressed = false;
    // Creazione hitbox player
    solidArea = new Rectangle(solidAreaX, solidAreaY, solidAreaWidth, solidAreaHeight);
  }
  
  void keyPressed(char key) {
    if (key == keyUp) {
      keyUpPressed = true; 
      direction = "Up";
    }
    if (key == keyDown) {
      keyDownPressed = true;
      direction = "Down";
    }
    if (key == keyLeft) {
      keyLeftPressed = true;
      direction = "Left";
    }
    if (key == keyRight) {
      keyRightPressed = true;
      direction = "Right";
    }
  }
  
 void keyReleased(char key) {
    if (key == keyUp) {
      keyUpPressed = false; 
    }
    if (key == keyDown) {
      keyDownPressed = false;
    }
    if (key == keyLeft) {
      keyLeftPressed = false;
    }
    if (key == keyRight) {
      keyRightPressed = false;
    }
    // Reset del frame per evitare che si blocchi l'animazione
    if (keyUpPressed || keyDownPressed || keyLeftPressed || keyRightPressed && currentFrame == run.length) {
      currentFrame = 0;
    }
  }
 
  void mouseClicked() {
    if (mouseButton == LEFT) {
      leftClickPressed = true;
    }
  }
 
  void update() {
    // Controllo collisione
    collisionOn = false;
    cCheck.checkTile();
    cCheck.checkObject();
    
    // Movimento player
    if (keyUpPressed && !collisionOn) {
      worldY -= playerSpeed;
    }
    if (keyDownPressed && !collisionOn) {
      worldY += playerSpeed;
    }
    if (keyLeftPressed && !collisionOn) {
      worldX -= playerSpeed;
    }
    if (keyRightPressed && !collisionOn) {
      worldX += playerSpeed;
    }
  }
}
