
int counter;
int[] tilePositions;
int tilePositionIndex; 
int score;
int piece; 


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
  piece = 0;
}


void draw() {
  background(255, 255, 255, 360); 
  // Vertical Grid Lines
  line(120, 0, 120, 720);
  line(240, 0, 240, 720);
  line(360, 0, 360, 720);
  // Horizontal Grid Lines
  line(0, 180, 480, 180);
  line(0, 360, 480, 360);
  line(0, 540, 480, 540);
  for (int tileNum = 0; tileNum < 4; tileNum++) {
    fill(#000000);
    int xCor = (tilePositions[tilePositionIndex + tileNum]) *120 - 1;
    int yCor = (3 - tileNum) * 180;
    rect(xCor, yCor, 120.75, 179);
    // Score 
    fill(235, 16, 16);
    textSize(42);
    text(Integer.toString(score), 215, 90);
  }
}


void keyPressed() {
  if (key == tileAKey || key == tileAKey - 32) {
    if (tilePositions[tilePositionIndex] == 0) {
      sc.playNote(maryLittleLamb[counter][0], 100, maryLittleLamb[counter][1]);
      counter++;
      tilePositionIndex++;
      score++;
    }
    if (counter == maryLittleLamb.length) {
      counter = 0;
    }
  }
  if (key == tileBKey || key == tileBKey - 32) {
    if (tilePositions[tilePositionIndex] == 1) {
      sc.playNote(maryLittleLamb[counter][0], 100, maryLittleLamb[counter][1]);
      counter++;
      tilePositionIndex++;
      score++;
    }
    if (counter == maryLittleLamb.length) {
      counter = 0;
    }
  }
  if (key == tileCKey || key == tileCKey - 32) {
    if (tilePositions[tilePositionIndex] == 2) {
      sc.playNote(maryLittleLamb[counter][0], 100, maryLittleLamb[counter][1]);
      counter++;
      tilePositionIndex++;
      score++;
    }
    if (counter == maryLittleLamb.length) {
      counter = 0;
    }
  }
  if (key == tileDKey || key == tileDKey - 32) {
    if (tilePositions[tilePositionIndex] == 3) {
      sc.playNote(maryLittleLamb[counter][0], 100, maryLittleLamb[counter][1]);
      counter++;
      tilePositionIndex++;
      score++;
    }
    if (counter == maryLittleLamb.length) {
      counter = 0;
    }
  }
}