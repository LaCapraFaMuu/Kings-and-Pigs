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
  }
  
  // Controlli per le azioni e i relativi draw del player
  void movment() {
    if (leftClickPressed) {
      int delayAttack = 250;
      player.draw(attack, 80, false);
      if (timerRunning[9]) {
        int elapsedTime = millis() - startTime[9];
        if (elapsedTime >= delayAttack) {
          attackSound.play();
          leftClickPressed = false;
          timerRunning[9] = false;
        }
      } else startTimer(9);
    }
    else if (keyUpPressed || keyDownPressed || keyLeftPressed || keyRightPressed) {
      int delaySound = 180;
      player.draw(run, 60, false);
      if (timerRunning[10]) {
        int elapsedTime = millis() - startTime[10];
        if (elapsedTime >= delaySound) {
          walkSound.play();
          timerRunning[10] = false;
        }
      } else startTimer(10);
    }
    else {
      player.draw(idle, 100, false);
    } 
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
    cCheck.checkTile(true);
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
