class Tiles extends Sprite {
  int mapTileNum[][];
  
  Tiles(PImage[] tiles, int width, int height) {
    super(tiles, width, height);
    mapTileNum = new int[maxScreenCol][maxScreenRow];
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
          
          for (int col = 0; col < maxScreenCol && col < numbers.length; col++) {
            int num = Integer.parseInt(numbers[col]);
            mapTileNum[col][row] = num;
          }
          row++;
          
          if (row >= maxScreenRow) {
            break;
          }
        }
      } else {
        System.out.println("File mapData.txt non trovato.");
      }
  
    } catch (NumberFormatException e) {
      System.out.println("Errore nella conversione del numero.");
    }
  }


  void generateTiles() {
    for (int i = 1; i < 94; i++) {
      tiles[i] = loadImage("assets/tiles/" + i + ".png"); 
    }
  }

  void displayTiles() {
    int col = 0;
    int row = 0;
    int x = 0;
    int y = 0;
    while(col < maxScreenCol && row < maxScreenRow) {
      int tileNum = mapTileNum[col][row];
      image(tiles[tileNum], x, y, width, height);
      col++;
      x += tileSize;
      if (col == maxScreenCol) {
        col = 0;
        x = 0;
        row++;
        y += tileSize;
      }
    }
  }
}
