// Variabili gioco
final String GAME_TITLE = "Kings and Pigs";
final int FRAME_RATE = 30;

// Variabili player
final int playerSpeed = 5;
final int playerX = 400;
final int playerY = 150;
boolean collisionOn = false;
int solidAreaX = 35;
int solidAreaY = 55;
int solidAreaWidth = 25;
int solidAreaHeight = 40;
final int solidAreaDefaultX = solidAreaX;
final int solidAreaDefaultY = solidAreaY;

// Variabili tiles
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
int mapTileNum[][];
boolean[] collision;

// Variabili oggetti
final int totObj = 9;
Items items[] = new Items[totObj];
Items bomb, box, door, window, LVL1bomb, LVL1box, LVL1door, LVL1window, LVL1window2;
// Variabili bomb
final String bombImg = "assets/objects/bomb/Bomb.png";
final int bombIgnitionFrames = 4;
final int bombExplosionFrames = 5;
final PImage[] bombIgnitionAnimation = new PImage[bombIgnitionFrames];
final PImage[] bombExplosionAnimation = new PImage[bombExplosionFrames];
final int bombX = 4 * tileSize + 8;
final int bombY = 8 * tileSize + 5;
final int LVL1bombX = 25 * tileSize;
final int LVL1bombY = 4 * tileSize + 5;

// Variabili box
final String boxImg = "assets/objects/box/Box.png";
final int boxX = 9 * tileSize;
final int boxY = 8 * tileSize + 5;
final int LVL1boxX = 30 * tileSize;
final int LVL1boxY = 8 * tileSize + 5;

// Variabili door
final String doorImg = "assets/objects/door/Door.png";
final int doorX = 11 * tileSize + 20;
final int doorY = 7 * tileSize - 12;
final int LVL1doorX = 27 * tileSize + 20;
final int LVL1doorY = 7 * tileSize - 12;

// Variabili window
String windowImg;
final int windowX = 5 * tileSize + 10;
final int windowY = 5 * tileSize;
final int LVL1windowX = 22 * tileSize + 10;
final int LVL1windowY = 5 * tileSize;
final int LVL1windowX2 = 29 * tileSize + 10;
final int LVL1windowY2 = 5 * tileSize;
