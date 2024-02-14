class KingPig extends Sprite {
  boolean isMoving = false;
  
  KingPig(PImage[] animation, int width, int height) {
    super(animation, width, height);
    kingSolidArea = new Rectangle(kingSolidAreaX, kingSolidAreaY, kingSolidAreaWidth, kingSolidAreaHeight);
  }
  
  void randomDirection() {
    int delay = 2000;
    if (timerRunning[16]) {
      int elapsedTime = millis() - startTime[16];
      if (elapsedTime >= delay) {
        int i = int(random(130));
        if (i <= 25) kingDirection = "Up";
        else if (i > 25 && i <= 50) kingDirection = "Down";
        else if (i > 50 && i <= 75) kingDirection = "Left";
        else if (i > 75 && i <= 100) kingDirection = "Right";
        else kingDirection = "Stop";
        timerRunning[16] = false;
      }
    } else startTimer(16); 
  }
  
  void update() {
    randomDirection();
    // Controllo collisione
    kingCollisionOn = false;
    cCheck.checkTile(false);

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
    
    // Draw enemy
    if (isMoving && !kingCollisionOn) {
      kingPig.draw(kingRun, 100, true);
    }
    else kingPig.draw(kingIdle, 100, true);
  }
}
