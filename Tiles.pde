class Tiles extends Sprite {
  Tiles(PImage[] tiles, int width, int height) {
    super(tiles, width, height);
    mapTileNum = new int[maxWorldCol][maxWorldRow];
    collision = new boolean[94]; // 94 Immagini tot in tiles
    loadMap();
  }
  
  // Metodo per caricare la mappa da file di testo usando i nomi dei file
  void loadMap() {
    try {
      String[] lines = loadStrings("assets/mapData.txt");
      if (lines != null) {
        int row = 0;
        for (String line : lines) {
          String[] numbers = splitTokens(line);
          for (int col = 0; col < maxWorldCol && col < numbers.length; col++) {
            int num = Integer.parseInt(numbers[col]);
            mapTileNum[col][row] = num;
          }
          row++;
          if (row >= maxWorldRow) break;
        }
      } else System.out.println("File mapData.txt non trovato.");
    }
    catch (NumberFormatException e) {
      System.out.println("Errore nella conversione del numero.");
    }
  }

  // Metodo per caricare immagini dentro l'array
  void loadTiles() {
    for (int i = 1; i < 94; i++) { // 94 Immagini tot in tiles
      tiles[i] = loadImage("assets/tiles/" + i + ".png"); 
      if (i <= 47) { // 47 perche num delle tile che devono avere collisioni
        collision[i] = true;  
      }
      else {
        collision[i] = false; 
      }
    }
  }

  // Draw delle tiles di sfondo
  void displayTiles() {
    int worldCol = 0;
    int worldRow = 0;
    while(worldCol < maxWorldCol && worldRow < maxWorldRow) {
      int tileNum = mapTileNum[worldCol][worldRow];
      int wldX = worldCol * tileSize;
      int wldY = worldRow * tileSize;
      int x = wldX - worldX + screenX;
      int y = wldY - worldY + screenY;
      
      // If per ottimizzazione, non genera tiles che il player non vede
      if (wldX + tileSize > worldX - screenX &&
          wldX - tileSize * 1.5 < worldX + screenX &&
          wldY + tileSize > worldY - screenY &&
          wldY - tileSize < worldY + screenY) {
         image(tiles[tileNum], x, y, width, height);
      }
      worldCol++;

      if (worldCol == maxWorldCol) {
        worldCol = 0;
        worldRow++;
      }
    }
  }
}
