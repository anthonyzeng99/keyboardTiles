
int counter; //Current index in music
int piece = 0; //Song being played
int score;
int screen; //Current screen
int[] tilePositions; //Array of randomly generated tile positions
int tilePositionIndex; //Current index in the tilePositions array


SoundCipher sc = new SoundCipher(this);


void fillTilePositions() {
  for (int i = 0; i < tilePositions.length; i ++) {
    tilePositions[i] = (int)(random(0, 4));
  }
}


void setup() {
  size(480, 720);
  tilePositions = new int[50000];
  fillTilePositions();
  tilePositionIndex = 0;
  score = 0;
  counter = 0;
  screen = 2;
  sc.instrument(instrument - 1);
}


void draw() {
  if (screen == 2) {
    arcadeScreen();
  }
}


void keyPressed() {
  if (screen == 2) {
    if (tilePositions[tilePositionIndex] == 0 && Character.toLowerCase(key) == tileAKey) {
      advanceGame();
    } else if (tilePositions[tilePositionIndex] == 1 && Character.toLowerCase(key) == tileBKey) {

      advanceGame();
    } else if (tilePositions[tilePositionIndex] == 2 && Character.toLowerCase(key) == tileCKey) {

      advanceGame();
    } else if (tilePositions[tilePositionIndex] == 3 && Character.toLowerCase(key) == tileDKey) {
      advanceGame();
    } else {
     //setup(); 
    }
  }
}


void advanceGame() {
  sc.playNote(getMIDINum(sheetMusic[piece][counter]), 100, getNoteLength(sheetMusic[piece][counter]));
  counter++;
  tilePositionIndex++;
  score++;
  if (counter == sheetMusic[piece].length) {
    counter = 0;
    println("End of Song");
  }
}