int counter = 0;
int[] tilePositions;
int tileIndex;

SoundCipher sc = new SoundCipher(this);

void fillTiles() {
  for (int i = 0; i < 50000; i ++){
    tilePositions[i] = (int)(random(0,4));
  }
}


void setup(){
  size(480, 720);
  fillTiles();
}


void draw() {
  background(255,255,255,360); 
  // Vertical Grid Lines
  line(120,0,120,720);
  line(240,0,240,720);
  line(360,0,360,720);
  // Horizontal Grid Lines
  line(0,180,480,180);
  line(0,360,480,360);
  line(0,540,480,540);
}


void keyPressed() {
  if (key == tileAKey || key == tileAKey - 32) {
    sc.playNote(maryLittleLamb[counter][0], 100, maryLittleLamb[counter][1]);
    counter++;
    if (counter == maryLittleLamb.length) {
      counter = 0;
    }
  }
  if (key == tileBKey || key == tileBKey - 32) {
    sc.playNote(maryLittleLamb[counter][0], 100, maryLittleLamb[counter][1]);
    counter++;
    if (counter == maryLittleLamb.length) {
      counter = 0;
    }
  }
  if (key == tileCKey || key == tileCKey - 32) {
    sc.playNote(maryLittleLamb[counter][0], 100, maryLittleLamb[counter][1]);
    counter++;
    if (counter == maryLittleLamb.length) {
      counter = 0;
    }
  }
  if (key == tileDKey || key == tileDKey - 32) {
    sc.playNote(maryLittleLamb[counter][0], 100, maryLittleLamb[counter][1]);
    counter++;
    if (counter == maryLittleLamb.length) {
      counter = 0;
    }
  }
}