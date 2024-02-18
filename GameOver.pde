// Variabili fuori altrimenti ogni volta che creo la classe dentro il draw la variabile verrebbe re-inizializzata
boolean singleAction = true;
Timer singleActionTimer = new Timer(400);

class GameOver {
  GameOver() {
    PImage lastFrameImg = loadImage("assets/player/dead/3.png");
    Sprite lastFrame = new Sprite(lastFrameImg, screenX, screenY, 128, 128);
    
    playerSpeed = 0; // Per bloccare il player
    bossMusic.stop();
    backgroundMusic.stop();
    gameOverImg.draw(false); 
    
    // If per eseguire le cose solo 1 volta
    if (singleAction) {
      endMusic.loop();
      player.draw(dead, 200, false);
    }
    else lastFrame.draw(false);
    // Avvio timer per far finire l'animazione del player
    singleActionTimer.update();
    if (singleActionTimer.tick()) {
      singleAction = false;
      singleActionTimer.reset();
    }
  }
}
