boolean singleAction = true; // Variabile fuori altrimenti ogni volta che creo la classe dentro il draw la variabile verrebbe re-inizializzata

class GameOver {
  GameOver() {
    PImage lastFrameImg = loadImage("assets/player/dead/3.png");
    SingleSprite lastFrame = new SingleSprite(lastFrameImg, screenX, screenY, 128, 128);
    
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
    if (timerRunning[15]) {
      int elapsedTime = millis() - startTime[15];
      if (elapsedTime >= 500) {
        singleAction = false;
        timerRunning[15] = false;
      }
    } else {
      startTimer(15);
    }
  }
}
