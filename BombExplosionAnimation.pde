class BombExplosionAnimation extends Sprite {
  Timer ignitionTimer = new Timer(1000);
  Timer explosionTimer = new Timer(200);
  
  BombExplosionAnimation(PImage[] animation, int width, int height) {
    super(animation, width, height); 
  }
  
  // Metodo per gestire l'animazione della bomb
  void explosionHandler(int index, int bombCounter, Items bomb) {
    int bombCollisionIndex = 0; // Variabile da passare per controllare la collisione
    switch(index) {
        case 0:
            bomb.draw(true);
            break;
        case 1:
            bombAnimation.x = bomb.x - worldX + screenX;
            bombAnimation.y = bomb.y - worldY + screenY;
            bombAnimation.draw(bombIgnitionAnimation, 50, false);
            ignitionTimer.update();
            if (ignitionTimer.tick()) {
              bombExplosion[bombCounter]++;
              ignitionTimer.reset();
            }
            break;
        case 2:
            bombExplosionAnimationObj.x = bomb.x - worldX + screenX;
            bombExplosionAnimationObj.y = bomb.y - worldY + screenY;
            bombExplosionAnimationObj.draw(bombExplosionAnimation, 65, false);
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
            explosionTimer.update();
            if (explosionTimer.tick()) {
              if (cCheck.checkAnimation(bombCollisionIndex)) {
                hitSound.play();
                life--;
              }
              explosionSound.play();
              bombExplosion[bombCounter]++;
              explosionTimer.reset();
            }
            break; 
    }
  }
  
}
