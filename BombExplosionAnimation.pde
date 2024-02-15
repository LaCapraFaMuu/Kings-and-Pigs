class BombExplosionAnimation extends Sprite {
  BombExplosionAnimation(PImage[] animation, int width, int height) {
    super(animation, width, height); 
  }
  
  void explosionHandler(int index, int bombCounter, Items bomb) {
    int bombStartTime = 1000;
    int bombExplosionTime = 200;
    int bombCollisionIndex = 0; // Variabile da passare per controllare la collisione
    switch(index) {
        case 0:
            bomb.draw(true);
            break;
        case 1:
            bombAnimation.x = bomb.x - worldX + screenX;
            bombAnimation.y = bomb.y - worldY + screenY;
            bombAnimation.draw(bombIgnitionAnimation, bombIgniteDelay, false);
            if (timerRunning[bombCounter]) {
                int elapsedTime = millis() - startTime[bombCounter];
                if (elapsedTime >= bombStartTime) {
                bombExplosion[bombCounter]++;
                timerRunning[bombCounter] = false;
                }
            } else startTimer(bombCounter);
            break;
        case 2:
            bombExplosionAnimationObj.x = bomb.x - worldX + screenX;
            bombExplosionAnimationObj.y = bomb.y - worldY + screenY;
            bombExplosionAnimationObj.draw(bombExplosionAnimation, bombExplosionDelay, false);
            switch(bombCounter) {
              case 0:
                bombCollisionIndex = 0;
                break;
              case 1:
                bombCollisionIndex = 4;
                break;
              case 2:
                bombCollisionIndex = 9;
                break;
              case 3:
                bombCollisionIndex = 10;
                break;
              case 4:
                bombCollisionIndex = 11;
                break;
              case 5:
                bombCollisionIndex = 12;
                break; 
            }
            if (timerRunning[bombCounter]) {
                int elapsedTime = millis() - startTime[bombCounter];
                if (elapsedTime >= bombExplosionTime) {
                  if (cCheck.checkAnimation(bombCollisionIndex)) life--;
                  explosionSound.play();
                  bombExplosion[bombCounter]++;
                  timerRunning[bombCounter] = false;
                }
            } else startTimer(bombCounter);
            break; 
        default:
            break;
    }
}
}
