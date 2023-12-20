import java.awt.Rectangle;

boolean keyUpPressed, keyDownPressed, keyLeftPressed, keyRightPressed, leftClickPressed;
int screenX = (screenWidth/2)-(78/2);
int screenY = (screenHeight/2)-(58/2);
int worldX = tileSize * 7;
int worldY = tileSize * 6;
char keyUp, keyDown, keyLeft, keyRight;
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
    // Inizializzazione variabili click a false
    keyUpPressed = false;
    keyDownPressed = false;
    keyLeftPressed = false;
    keyRightPressed = false;
    leftClickPressed = false;
    // Caricamento immagini dentro gli array
    loadRunAnimation();
    loadIdleAnimation();
    loadAttackAnimation();
    // Creazione hitbox player
    solidArea = new Rectangle(35,25,25,70);
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
    
    if (keyUpPressed && !collisionOn) {
      worldY -= speed.y;
    }
    if (keyDownPressed && !collisionOn) {
      worldY += speed.y;
    }
    if (keyLeftPressed && !collisionOn) {
      worldX -= speed.x;
    }
    if (keyRightPressed && !collisionOn) {
      worldX += speed.x;
    }
  }
 
  // --------- Metodi per caricare immagini in un array ---------
  void loadIdleAnimation() {
    for (int i = 0; i < idleFrameMax; i++) {
      idle[i] = loadImage("assets/player/idle/" + i + ".png");
    }
  }
 
  void loadRunAnimation() {
    for (int i = 0; i < runFrameMax; i++) {
      run[i] = loadImage("assets/player/run/" + i + ".png");
    }
  }
 
  void loadAttackAnimation() {
    for (int i = 0; i < attackFrameMax; i++) {
      attack[i] = loadImage("assets/player/attack/" + i + ".png");
    }
  }
}
