class DoorAnimation extends Sprite {
  DoorAnimation(PImage[] animation, int width, int height) {
    super(animation, width, height); 
  }
  
  // Metodo per gestire l'animazione della porta
  void doorOpeningHandler(boolean isDoorOpening, int doorCounter, Items door, int index) {    
    if (!isDoorOpening) door.draw(true);
    else {
        doorAnimation.x = door.x - worldX + screenX;
        doorAnimation.y = door.y - worldY + screenY;
        doorAnimation.draw(doorOpeningAnimation, 150, false);
        if (timerRunning[doorCounter]) {
        int elapsedTime = millis() - startTime[doorCounter];
          if (elapsedTime >= doorOpeningDelay) {
            isDoorOpening = false;
            doorOpening[index] = false;
            timerRunning[doorCounter] = false;
          }
        } else startTimer(doorCounter);
    }
  }
}
