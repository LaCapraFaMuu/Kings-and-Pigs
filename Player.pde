import java.awt.Rectangle;

// Variabili per tasti
boolean keyUpPressed, keyDownPressed, keyLeftPressed, keyRightPressed, leftClickPressed;
char keyUp, keyDown, keyLeft, keyRight;

// Variabili per coordinate
int screenX = (screenWidth/2)-(78/2);
int screenY = (screenHeight/2)-(58/2);
int worldX = tileSize * 7;
int worldY = tileSize * 8;

// Variabili per collisioni
Rectangle solidArea;
CollisionCheck cCheck = new CollisionCheck();
String direction = "Up";

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
    solidArea = new Rectangle(solidAreaX,solidAreaY, solidAreaWidth, solidAreaHeight);
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
    
    if (leftClickPressed && currentFrame == attack.length) {
      currentFrame = 0;
    }
  }
 
  void update() {
    // Controllo collisione
    collisionOn = false;
    cCheck.checkTile();
    int objIndex = cCheck.checkObject(true);
    pickUpObject(objIndex);
    
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
  
  void pickUpObject(int i) {
    if (i != 999) {
      
    }
  }
}
