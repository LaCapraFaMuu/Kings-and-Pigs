// Variabili gioco
final String GAME_TITLE = "Kings and Pigs";
final int FRAME_RATE = 30;

// Variabili sounds
final String bgMusicPath = "assets/sounds/music/Goblins_Den_(Regular).wav";
final String walkPath = "assets/sounds/effects/walk.wav";
final String attackPath = "assets/sounds/effects/attack.wav";
final String explosionPath = "assets/sounds/effects/explosion.wav";

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
boolean keyUpPressed, keyDownPressed, keyLeftPressed, keyRightPressed, leftClickPressed;
char keyUp, keyDown, keyLeft, keyRight;

// Variabili per collisioni
Rectangle solidArea;
CollisionCheck cCheck = new CollisionCheck();
String direction = "Up";

// Variabili tiles
final int scale = 3;
final int originalTileSize = 16;
final int tileSize = originalTileSize * scale;

// Variabili schermo
final int maxScreenCol = 16;
final int maxScreenRow = 12;
final int screenWidth = tileSize * maxScreenCol;
final int screenHeight = tileSize * maxScreenRow;
int screenX = (screenWidth/2)-(78/2);
int screenY = (screenHeight/2)-(58/2);

// Variabili mondo
int worldX = tileSize * 7;
int worldY = tileSize * 8;
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

// Variabili per timer
final int totTimers = 14; // 11 Timer in questo file dall'ordine dall'alto al basso e altri 2 in items
final int[] startTime = new int[totTimers];
final boolean[] timerRunning = new boolean[totTimers];

// Variabili per animazioni
int[] bombExplosion = new int[6];
boolean[] bombControls = new boolean[6];
boolean[] doorOpening = new boolean[3];

// Variabili oggetti
final int totObj = 18;
Rectangle[] itemSolidArea = new Rectangle[totObj];
boolean[] collisionObj = new boolean[totObj];
boolean[] interactable = new boolean[totObj];
int[] solidObjAreaX = new int[totObj];
int[] solidObjAreaY = new int[totObj];
int[] solidObjDefaultAreaX = new int[totObj];
int[] solidObjDefaultAreaY = new int[totObj];
int[] solidObjWidth = new int[totObj];
int[] solidObjHeight = new int[totObj];
int ItemCreationCounter = 0;
Items items[] = new Items[totObj];
Items bomb, box, door, window, LVL1bomb, LVL1box, LVL1door, LVL1window, LVL1window2, LVL2bomb, LVL2bomb2, LVL2bomb3, LVL2bomb4, LVL2box, LVL2door, LVL2window, LVL2window2, LVL2window3;
// Variabili bomb
final String bombImg = "assets/objects/bomb/Bomb.png";
final int bombIgnitionFrames = 4;
final int bombExplosionFrames = 5;
final int bombIgniteDelay = 50;
final int bombExplosionDelay = 60;
final PImage[] bombIgnitionAnimation = new PImage[bombIgnitionFrames];
final PImage[] bombExplosionAnimation = new PImage[bombExplosionFrames];
final int bombX = 4 * tileSize + 8;
final int bombY = 8 * tileSize + 5;
final int LVL1bombX = 25 * tileSize;
final int LVL1bombY = 4 * tileSize + 5;
final int LVL2bombX = 17 * tileSize + 5;
final int LVL2bombY = 17 * tileSize;
final int LVL2bombX2 = 19 * tileSize + 5;
final int LVL2bombY2 = 17 * tileSize;
final int LVL2bombX3 = 18 * tileSize + 5;
final int LVL2bombY3 = 15 * tileSize;
final int LVL2bombX4 = 18 * tileSize + 5;
final int LVL2bombY4 = 19 * tileSize;
// Variabili box
final String boxImg = "assets/objects/box/Box.png";
final int boxX = 9 * tileSize;
final int boxY = 8 * tileSize + 5;
final int LVL1boxX = 30 * tileSize;
final int LVL1boxY = 8 * tileSize + 5;
final int LVL2boxX = 5 * tileSize;
final int LVL2boxY = 21 * tileSize + 5;

// Variabili door
final String doorImg = "assets/objects/door/Door.png";
final int doorOpeningFrames = 5;
final PImage[] doorOpeningAnimation = new PImage[doorOpeningFrames];
final int doorX = 11 * tileSize + 20;
final int doorY = 7 * tileSize - 12;
final int LVL1doorX = 27 * tileSize + 20;
final int LVL1doorY = 7 * tileSize - 12;
final int LVL2doorX = 24 * tileSize + 20;
final int LVL2doorY = 17 * tileSize - 12;

// Variabili window
String windowImg;
final int windowX = 5 * tileSize + 10;
final int windowY = 5 * tileSize;
final int LVL1windowX = 22 * tileSize + 10;
final int LVL1windowY = 5 * tileSize;
final int LVL1windowX2 = 29 * tileSize + 10;
final int LVL1windowY2 = 5 * tileSize;
final int LVL2windowX = 6 * tileSize - 15;
final int LVL2windowY = 16 * tileSize;
final int LVL2windowX2 = 9 * tileSize + 20;
final int LVL2windowY2 = 16 * tileSize;
final int LVL2windowX3 = 13 * tileSize;
final int LVL2windowY3 = 16 * tileSize;
