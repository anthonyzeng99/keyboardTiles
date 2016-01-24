int counter; //Current position in music 
int piece; //Song being played
int tilesTapped; 
int screen; //Current screen
int gameMode; // Mode being played
int gameWL; // Whether game was won or loss
int[] tilePositions; //Array of randomly generated tile positions
int tilePositionIndex; //Current index in the tilePositions array
int startTime; // Time at which game started
int elapsedTime; // Difference between startTime and millis();
int endTime; // Time elapsed at the point where the game ended;
int score;
String[] highScores;
String[] settings ;
String[] stats;
float progressBarRedValue; // Red color value of progress bar
float progressBarGreenValue; // Green color value of progress bar
boolean statsUpdated;
String totalGamesPlayed;
String totalTilesTapped;
String totalTimePlayed;


SoundCipher sc = new SoundCipher(this);



void setup() {
  highScores = loadStrings("highScores.txt");
  stats = loadStrings("stats.txt");
  size(480, 720);
  screen = 0;
  newGame();
  totalGamesPlayed = stats[0];
  totalTilesTapped = stats[1];
  totalTimePlayed = formatTime(Integer.parseInt(stats[2]));
}


void draw() {
  screenTracker();
  timeKeeper();
  winLossTracker();
}


void fillTilePositions() {
  for (int i = 0; i < tilePositions.length; i ++) {
    tilePositions[i] = (int)(random(0, 4));
  }
}


void advanceGame() {
  sc.playNote(getMIDINum(sheetMusic[piece][counter]), 100, getNoteLength(sheetMusic[piece][counter]));
  counter++;
  tilePositionIndex++;
  tilesTapped++;
  if (counter == sheetMusic[piece].length) {
    counter = 0;
  }
}


void newGame() {
  piece = (int)(random(0, sheetMusic.length));
  tilePositions = new int[10000];
  fillTilePositions();
  tilePositionIndex = 0;
  tilesTapped = 0;
  counter = 0;
  sc.instrument(instrument - 1);
  progressBarRedValue = 0;
  progressBarGreenValue = 0;
  startTime = 0;
  elapsedTime = 0;
  endTime = 0;
  statsUpdated = false;
  highScores = loadStrings("highScores.txt");
  stats = loadStrings("stats.txt");
}

void screenTracker() {
  if (screen == 0) {
    menuScreen();
  } else if (screen == 1) {
    statsScreen();
  } else if (screen == 10) {
    classicScreen();
  } else if (screen == 11) {
    arcadeScreen();
  } else if (screen == 12) {
    zenScreen();
  } else if (screen == 20) {
    endScreen(gameMode);
  }
}

void timeKeeper() {
  if (tilesTapped == 0) {
    elapsedTime = 0;
  } else {
    elapsedTime = millis() - startTime;
  }
}

void winLossTracker() {
  if (gameWL != 0) {
    screen = 20;
  }
}


String formatTime(int time) {
  return "" + (time / 1000.0) + '"';
}