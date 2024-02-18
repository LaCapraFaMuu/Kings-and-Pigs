class KingPig extends Sprite {
  Timer directionTimer = new Timer(1500);
  boolean isMoving = false;
  int invincibleCounter = 0;
  int deathCounter = 0;
  
  KingPig(PImage[] animation, int width, int height) {
    super(animation, width, height);
  }
  
  // Metodo che decide una direzione a caso
  void randomDirection() {
    directionTimer.update();
    if (directionTimer.tick()) {
      int i = int(random(125));
      if (i <= 25) kingDirection = "Up";
      else if (i > 25 && i <= 50) kingDirection = "Down";
      else if (i > 50 && i <= 75) kingDirection = "Left";
      else if (i > 75 && i <= 100) kingDirection = "Right";
      else kingDirection = "Stop";
      directionTimer.reset();
    }
  }
  
  void update() {
    if (kingLife > 0) {
      randomDirection();
      // Controllo collisione
      kingCollisionOn = false;
      cCheck.checkTile(false);
      // Controllo se sono a contatto con il nemico
      
      if (cCheck.checkEnemy() && leftClickPressed && life > 0) { 
        if (!isKingPigInvincible) {
          hitSound.play();
          kingLife--;
          isKingPigInvincible = true;
        }
      }
      // Tempo di immunita
      if (isKingPigInvincible) {
        invincibleCounter++;
        if (invincibleCounter > 30) {
          isKingPigInvincible = false;
          invincibleCounter = 0;
        }
      }
  
      // Movimento enemy    
      switch (kingDirection) {
        case "Up":
          if (kingDirection.equals("Up") && !kingCollisionOn) {
            kingPig.y -= kingSpeed;
            isMoving = true;
          }
          break;
        case "Down":
          if (!kingCollisionOn) {
            kingPig.y += kingSpeed;
            isMoving = true;
          }
          break;
        case "Left" :
          if (!kingCollisionOn) {
            kingPig.x -= kingSpeed;
            isMoving = true;
          }
          break;
        case "Right" :
          if (!kingCollisionOn) {
            kingPig.x += kingSpeed;
            isMoving = true;
          }
          break;
        case "Stop" :
          if (!kingCollisionOn) {
            isMoving = false;
          }
          break;
      }
    }
    // Draw enemy
    if (kingLife <= 0) {
      deathCounter++;
      if (deathCounter < 15) kingPig.draw(kingDead, 200, true);
    }
    else if (cCheck.checkEnemy()) {
      kingPig.draw(kingAttack, 150, true);
    }
    else if (isMoving && !kingCollisionOn) {
      kingPig.draw(kingRun, 100, true);
    }
    else kingPig.draw(kingIdle, 100, true);
  }
}
