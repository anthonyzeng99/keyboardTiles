int counter = 0;
int[] tilePositions;

SoundCipher sc = new SoundCipher(this);

void setup(){
  size(480, 720);
}


void draw() {
  if (counter % 2 == 0) {
   background(255,255,255,360); 
   tileRow hello = new tileRow();
  } else {
    background(255,255,255); 
  }
}

void filltiles() {
  for (int i = 0; i < 50000; i ++){
    tilePositions[i] = random(0,4);
  }
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