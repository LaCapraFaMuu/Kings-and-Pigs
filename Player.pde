boolean keyUpPressed, keyDownPressed, keyLeftPressed, keyRightPressed, leftClickPressed;
int screenX = (screenWidth/2)-(78/2);
int screenY = (screenHeight/2)-(58/2);
int worldX = tileSize * 7;
int worldY = tileSize * 6;
char keyUp, keyDown, keyLeft, keyRight;

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
  }
  
  void keyPressed(char key) {
    if (key == keyUp) {
      keyUpPressed = true; 
    }
    if (key == keyDown) {
      keyDownPressed = true;
    }
    if (key == keyLeft) {
      keyLeftPressed = true;
    }
    if (key == keyRight) {
      keyRightPressed = true;
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
       
    if (keyUpPressed || keyDownPressed || keyLeftPressed || keyRightPressed && currentFrame == run.length) { // Reset del frame per evitare che si blocchi
      currentFrame = 0;
    }
  }
 
  void mousePressed() {
    if (mouseButton == LEFT) {
      leftClickPressed = true;
    }
  }

  void mouseReleased() {
    if (mouseButton == LEFT) {
      leftClickPressed = false;
    }
    if (leftClickPressed && currentFrame == attack.length) { // Reset del frame per evitare che si blocchi
       currentFrame = 0;
    }
  }
 
  void update() {
    if (keyUpPressed) {
      worldY -= speed.y;
    }
    if (keyDownPressed) {
      worldY += speed.y;
    }
    if (keyLeftPressed) {
      worldX -= speed.x;
    }
    if (keyRightPressed) {
      worldX += speed.x;
    }
  }
 
  // Metodi per caricare immagini in un array
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
