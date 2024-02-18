class Timer {
  int delay; // tempo di attesa
  int elapsed; // tempo trascorso
  int incr; // ms da incrementare
  boolean paused; // indica se il timer è in pausa o meno
  int pausedTime; // tempo trascorso quando il timer è stato messo in pausa

  Timer(int delay) {
    this.delay = delay;
    elapsed = 0;
    incr = 1000 / FRAME_RATE;
    paused = false;
    pausedTime = 0;
  }

  void reset() {
    elapsed = 0;
  }

  void update() {
    if (!paused && elapsed < delay) {
      elapsed += incr;
    }
  }

  boolean tick() {
    if (!paused && elapsed >= delay) {
      elapsed = 0;
      return true;
    }
    else return false;
  }
}
