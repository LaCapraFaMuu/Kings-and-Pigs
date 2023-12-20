final String GAME_TITLE = "Kings and Pigs";
final int FRAME_RATE = 60;

final int playerSpeed = 5;
final int playerX = 400;
final int playerY = 150;

// Impostazioni per schermo
final int scale = 3;
final int originalTileSize = 16;
final int tileSize = originalTileSize * scale;
// Variabili schermo
final int maxScreenCol = 16;
final int maxScreenRow = 12;
final int screenWidth = tileSize * maxScreenCol;
final int screenHeight = tileSize * maxScreenRow;
// Variabili mondo
final int maxWorldCol = 35;
final int maxWorldRow = 25;
final int worldWidth = tileSize * maxWorldCol;
final int worldHeight = tileSize * maxWorldRow;
// Variabili per animazione player
final int idleFrame = 1;
final int idleFrameMax = 11;
final int runFrameMax = 8;
final int attackFrameMax = 3;
final PImage[] idle = new PImage[idleFrameMax];
final PImage[] run = new PImage[runFrameMax];
final PImage[] attack = new PImage[attackFrameMax];
// Variabili per tiles
final PImage[] tiles = new PImage[maxScreenCol*maxScreenRow];
