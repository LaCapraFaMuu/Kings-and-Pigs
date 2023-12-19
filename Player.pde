public boolean keyUpPressed, keyDownPressed, keyLeftPressed, keyRightPressed, leftClickPressed;
char keyUp, keyDown, keyLeft, keyRight;

class Player extends Sprite {
 public Player(PImage[] animation, int width, int height, char up, char down, char left, char right) {
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
  
 public void keyPressed(char key) {
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
  
 public void keyReleased(char key) {
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
 
 public void update() {
    if (keyUpPressed) {
      position.y -= speed.y;
    }
    if (keyDownPressed) {
     position.y += speed.y;
    }
    if (keyLeftPressed) {
      position.x -= speed.x;
    }
    if (keyRightPressed) {
      position.x += speed.x;
    }
 }
 
 // Metodi per caricare immagini in un array
 public void loadIdleAnimation() {
   for (int i = 0; i < idleFrameMax; i++) {
     idle[i] = loadImage("assets/player/idle/" + i + ".png");
   }
 }
 
 public void loadRunAnimation() {
   for (int i = 0; i < runFrameMax; i++) {
     run[i] = loadImage("assets/player/run/" + i + ".png");
   }
 }
 
 public void loadAttackAnimation() {
   for (int i = 0; i < attackFrameMax; i++) {
     attack[i] = loadImage("assets/player/attack/" + i + ".png");
   }
 }
}
