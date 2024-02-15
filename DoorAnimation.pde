class DoorAnimation extends Sprite {
  DoorAnimation(PImage[] animation, int width, int height) {
    super(animation, width, height); 
  }
  
  void doorOpeningHandler(boolean isDoorOpening, int doorCounter, Items door, int index) {    
    if (!isDoorOpening) door.draw(true);
    else {
        doorAnimation.x = door.x - worldX + screenX;
        doorAnimation.y = door.y - worldY + screenY;
        doorAnimation.draw(doorOpeningAnimation, 150, false); 
        int doorOpeningDelay = 505;
        if (timerRunning[doorCounter]) {
        int elapsedTime = millis() - startTime[doorCounter];
          if (elapsedTime >= doorOpeningDelay) {
            currentLVL++;
            isDoorOpening = false;
            doorOpening[index] = false;
            timerRunning[doorCounter] = false;
          }
        } else startTimer(doorCounter);
    }
  }
}
