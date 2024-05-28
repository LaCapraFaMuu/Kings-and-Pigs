class Player extends Sprite {
  Timer attackTimer = new Timer(250);
  Timer runTimer = new Timer(200);
  int invincibleCounter = 0;
  
  Player(PImage[] animation, int width, int height, char up, char down, char left, char right) {
    super(animation, width, height);
    keyUp = up;
    keyDown = down;
    keyLeft = left;
    keyRight = right;
  }
  
  // Controlli per le azioni e i relativi draw del player
  void movment() {
    if (leftClickPressed) {
      player.draw(attack, 80, false);
      attackTimer.update();
      if (attackTimer.tick()) {
        attackSound.play();
        leftClickPressed = false;
        attackTimer.reset();
      }
    }
    else if (keyUpPressed || keyDownPressed || keyLeftPressed || keyRightPressed) {
      player.draw(run, 60, false);
      runTimer.update();
      if (runTimer.tick()) {
        walkSound.play();
        runTimer.reset();
      }
    }
    else {
      player.draw(idle, 100, false);
    } 
  }
  
  void keyPressed(char key) {
    if (key == keyUp) {
      keyUpPressed = true;
      keyDownPressed = false;
      keyLeftPressed = false;
      keyRightPressed = false;
      direction = "Up";
    }
    if (key == keyDown) {
      keyDownPressed = true;
      keyUpPressed = false;
      keyLeftPressed = false;
      keyRightPressed = false;
      direction = "Down";
    }
    if (key == keyLeft) {
      keyLeftPressed = true;
      keyUpPressed = false;
      keyDownPressed = false;
      keyRightPressed = false;
      direction = "Left";
    }
    if (key == keyRight) {
      keyRightPressed = true;
      keyUpPressed = false;
      keyDownPressed = false;
      keyLeftPressed = false;
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
    // Controllo se sono a contatto con il nemico
    if (kingLife > 0) {
      if (cCheck.checkEnemy() && life > 0) { 
        if (!isPlayerInvincible) {
          hitSound.play();
          life--;
          attackSound.play();
          isPlayerInvincible = true;
        }
      }
      // Tempo di immunita
      if (isPlayerInvincible) {
        invincibleCounter++;
        if (invincibleCounter > 60) {
          isPlayerInvincible = false;
          invincibleCounter = 0;
        }
      }
    }
    
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
