int counter; //Current position in music 
int piece; //Song being played
int tilesTapped; // Number of tiles tapped
int screen; //Current screen
int gameMode; // Mode being played
int gameWL; // Whether game was won or loss
int[] tilePositions; //Array of randomly generated tile positions
int tilePositionIndex; //Current index in the tilePositions array
int startTime; // Time at which game started
int elapsedTime; // Difference between startTime and millis();
int endTime; // Time elapsed at the point where the game ended;
int score; // Score for game
String rushScore; // Score for Rush Mode
String[] highScores; // Array containing high score data
String[] settings ; // Array containing settings data
String[] stats; // Array containing stats data
float progressBarRedValue; // Red color value of progress bar
float progressBarGreenValue; // Green color value of progress bar
boolean statsUpdated; // Whether the stats for that game has been added to the total stats
String totalGamesPlayed; // The total number of games that has been played
String totalTilesTapped; // The total number of tiles that has been tapped 
String totalTimePlayed; // The total time that the game has been played
String highScoreFile = "data/highScores.txt"; // File where high scores are stored;
String statsFile = "data/stats.txt"; // File where game stats are stored
String settingsFile = "data/settings.txt"; // File where game settings are stored/
int colorSelectorXCor; // X-Coordinate of the selector in the color screen
int colorSelectorYCor; // Y-Coordinate of the selector in the color screen
int tileColorIndex; // Index of tile color selected from tileColors array
int instrumentSelectorXCor; // X-Coordinate of the selector in the instruments screen
int instrumentSelectorYCor; // Y-Coordinate of the selector in the instruments screen
int instrumentIndex; // Index of instrument selected from instruments array


SoundCipher sc = new SoundCipher(this);


void setup() {

  highScores = loadStrings(highScoreFile);
  stats = loadStrings(statsFile);
  size(480, 720);
  screen = 0;
  loadFiles();
  newGame();
  totalGamesPlayed = stats[0];
  totalTilesTapped = stats[1];
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
  sc.instrument(instruments[instrumentIndex]);
  progressBarRedValue = 0;
  progressBarGreenValue = 0;
  startTime = 0;
  elapsedTime = 0;
  endTime = 0;
  statsUpdated = false;
}


void screenTracker() {

  if (screen == 0) {
    menuScreen();
  } else if (screen == 1) {
    statsScreen();
  } else if (screen == 2) {
    colorScreen();
  } else if (screen == 3) {
    instrumentsScreen();
  } else if (screen == 4) {
    infoScreen();
  } else if (screen == 10) {
    classicScreen();
  } else if (screen == 11) {
    arcadeScreen();
  } else if (screen == 12) {
    zenScreen();
  } else if (screen == 13) {
    rushScreen();
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

String formatRushScore() {

  return "" + nf(tilesTapped / (elapsedTime / 1000.0 + 1), 1, 3) + "";
}


void setHighScore() {

  if (gameMode == 0 && gameWL == 1 && score < Integer.parseInt(highScores[gameMode])) {
    highScores[gameMode] = Integer.toString(score);
    saveStrings(highScoreFile, highScores);
  } else if (gameMode != 3 && score > Integer.parseInt(highScores[gameMode])) {
    highScores[gameMode] = Integer.toString(score);
    saveStrings(highScoreFile, highScores);
  } else if (gameMode == 3 && Double.parseDouble(rushScore) > Double.parseDouble(highScores[gameMode])) {
    highScores[gameMode] = rushScore;
    saveStrings(highScoreFile, highScores);
  }
}


void updateStats() {

  int newGamesPlayed = Integer.parseInt(stats[0]) + 1;
  int newTilesTapped = Integer.parseInt(stats[1]) + tilesTapped;
  int newTimePlayed = Integer.parseInt(stats[2]) + endTime;

  stats[0] = Integer.toString(newGamesPlayed);
  stats[1] = Integer.toString(newTilesTapped);
  stats[2] = Integer.toString(newTimePlayed);

  saveStrings(statsFile, stats);
}

void loadFiles() {

  highScores = loadStrings(highScoreFile);
  stats = loadStrings(statsFile);
  settings = loadStrings(settingsFile);

  totalTimePlayed = formatTime(Integer.parseInt(stats[2]));
  tileColorIndex = Integer.parseInt(settings[3]);
  colorSelectorXCor = Integer.parseInt(settings[4]);
  colorSelectorYCor = Integer.parseInt(settings[5]);
  instrumentIndex = Integer.parseInt(settings[0]);
  instrumentSelectorXCor = Integer.parseInt(settings[1]);
  instrumentSelectorYCor = Integer.parseInt(settings[2]);
}