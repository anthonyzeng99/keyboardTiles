int counter = 0;

SoundCipher sc = new SoundCipher(this);

void setup(){
  size(480, 720);
}


void draw() {
  if (counter % 2 == 0) {
   background(255,255,255); 
   rect(240,360,50,50);
  } else {
    background(255,255,255); 
  }
}

float[] pitches = {60,62,64};
double[] dynamics = {100,100,100};
double[] durations = {1,1,1};



void keyPressed()
{
  sc.playNote(furElise[counter][0], 100, furElise[counter][1]);
  counter++;
  if (counter == furElise.length) {
      counter = 0;
  }
}