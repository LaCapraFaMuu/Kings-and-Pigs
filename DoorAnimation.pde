class DoorAnimation extends Sprite {
  Timer doorOpeningTimer = new Timer(505);
  
  DoorAnimation(PImage[] animation, int width, int height) {
    super(animation, width, height); 
  }
  
  // Metodo per gestire l'animazione della porta
  void doorOpeningHandler(boolean isDoorOpening, Items door, int index) {    
    if (!isDoorOpening) door.draw(true);
    else {
        doorAnimation.x = door.x - worldX + screenX;
        doorAnimation.y = door.y - worldY + screenY;
        doorAnimation.draw(doorOpeningAnimation, 150, false);
        doorOpeningTimer.update();
        if (doorOpeningTimer.tick()) {
          isDoorOpening = false;
          doorOpening[index] = false;
          doorOpeningTimer.reset();
        }
    }
  }
  
}
