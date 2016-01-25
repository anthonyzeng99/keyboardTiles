import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import arb.soundcipher.*; 
import arb.soundcipher.constants.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class keyboardTiles extends PApplet {

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


public void setup() {

  highScores = loadStrings(highScoreFile);
  stats = loadStrings(statsFile);
  
  screen = 0;
  loadFiles();
  newGame();
  totalGamesPlayed = stats[0];
  totalTilesTapped = stats[1];
}


public void draw() {

  screenTracker();
  timeKeeper();
  winLossTracker();
}


public void fillTilePositions() {

  for (int i = 0; i < tilePositions.length; i ++) {
    tilePositions[i] = (int)(random(0, 4));
  }
}


public void advanceGame() {

  sc.playNote(getMIDINum(sheetMusic[piece][counter]), 100, getNoteLength(sheetMusic[piece][counter]));
  counter++;
  tilePositionIndex++;
  tilesTapped++;
  if (counter == sheetMusic[piece].length) {
    counter = 0;
  }
}


public void newGame() {

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


public void screenTracker() {

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


public void timeKeeper() {

  if (tilesTapped == 0) {
    elapsedTime = 0;
  } else {
    elapsedTime = millis() - startTime;
  }
}


public void winLossTracker() {

  if (gameWL != 0) {
    screen = 20;
  }
}


public String formatTime(int time) {

  return "" + (time / 1000.0f) + '"';
}

public String formatRushScore() {

  return "" + nf(tilesTapped / (elapsedTime / 1000.0f + 1), 1, 3) + "";
}


public void setHighScore() {

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


public void updateStats() {

  int newGamesPlayed = Integer.parseInt(stats[0]) + 1;
  int newTilesTapped = Integer.parseInt(stats[1]) + tilesTapped;
  int newTimePlayed = Integer.parseInt(stats[2]) + endTime;

  stats[0] = Integer.toString(newGamesPlayed);
  stats[1] = Integer.toString(newTilesTapped);
  stats[2] = Integer.toString(newTimePlayed);

  saveStrings(statsFile, stats);
}

public void loadFiles() {

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

int[] tileColors = {0xffdc143c, 0xfffa0872, 0xffff1493, 0xff228b22, 0xff32cd32, 0xff7cfc00, 0xff00008b, 0xff00bfff, 0xff00ffff, 0xff9400d3, 0xffffff00, 0xff000000};

public void colorScreen() {
  
  background(white);
  
  fill(black);
  textAlign(CENTER);
  textSize(32);
  
  text("Tile Color",240,50);
  
  rectMode(CENTER);
  
  noStroke();
  
  //Color Selector
  fill(0xffffd700);
  rect(colorSelectorXCor,colorSelectorYCor,85,85,7);
  
  // Reds
  fill(0xffdc143c);
  rect(110,130,60,60,7);
  fill(0xfffa0872);
  rect(240,130,60,60,7);
  fill(0xffff1493);
  rect(370,130,60,60,7);
  
  // Greens
  fill(0xff228b22);
  rect(110,260,60,60,7);  
  fill(0xff32cd32);
  rect(240,260,60,60,7); 
  fill(0xff7cfc00);
  rect(370,260,60,60,7);
  
  // Blues
  fill(0xff00008b);
  rect(110,410,60,60,7);  
  fill(0xff00bfff);
  rect(240,410,60,60,7);  
  fill(0xff00ffff);
  rect(370,410,60,60,7);
  
  // Other Colors
  fill(0xff9400d3);
  rect(110,560,60,60,7);
  fill(0xffffff00);
  rect(240,560,60,60,7);
  fill(0xff000000);
  rect(370,560,60,60,7);
  
  text("Press Enter to return to menu", 240, 665);
  
  rectMode(0);
  stroke(0);
  
  settings[3] = Integer.toString(tileColorIndex);
  settings[4] = Integer.toString(colorSelectorXCor);
  settings[5] = Integer.toString(colorSelectorYCor);
  saveStrings(settingsFile, settings);
}

// Draws standard grid layout and tiles
public void standardGameLayout() {

  background(255, 255, 255, 360); 

  // Vertical Grid Lines
  line(120, 0, 120, 720);
  line(240, 0, 240, 720);
  line(360, 0, 360, 720);

  // Horizontal Grid Lines
  line(0, 180, 480, 180);
  line(0, 360, 480, 360);
  line(0, 540, 480, 540);

  // Black Tiles
  for (int tileNum = 0; tileNum < 4; tileNum++) {
    fill(tileColors[tileColorIndex]);
    int xCor = (tilePositions[tilePositionIndex + tileNum]) *120;
    int yCor = (3 - tileNum) * 180 + 1;
    rect(xCor, yCor, 120, 179);
  }
}


public void classicScreen() {

  standardGameLayout();
  progressBar();

  // Score - Based on time
  fill(235, 16, 16);
  textSize(42);
  textAlign(CENTER);
  text(formatTime(elapsedTime), 240, 90);
  textAlign(0);
  
  // End Game when 50 Tiles Tapped;
  if (tilesTapped == 50) {
    gameWL = 1;
    endTime = millis() - startTime;
  }
}


public void arcadeScreen() {

  standardGameLayout();

  // Score - Based on tiles tapped
  fill(235, 16, 16);
  textSize(42);
  textAlign(CENTER);
  text(Integer.toString(tilesTapped), 240, 90);
  textAlign(0);
}

public void zenScreen() {
  
  standardGameLayout();
  timeBar();
  
  // Score - Based on tiles tapped
  fill(235, 16, 16);
  textSize(42);
  textAlign(CENTER);
  text(Integer.toString(tilesTapped), 240, 90);
  textAlign(0);
  
  // End Game when Time runs out; 
  if (elapsedTime > 15000) {
    gameWL = 1;
  }
  
}

public void rushScreen() {
  
  standardGameLayout();
  
  fill(235, 16, 16);
  textSize(42);
  textAlign(CENTER);
  rushScore = nf(tilesTapped / (elapsedTime / 1000.0f + 1), 1, 3);
  text(formatRushScore(), 240, 90);
  textAlign(0);
}

public void progressBar() {
  float barProgress;

  // Draws the progress bar
  barProgress = tilesTapped * 9.6f;
  fill(progressBarRedValue, progressBarGreenValue, 0.0f);
  noStroke();
  rect(0, 0, barProgress, 5); 
  stroke(0);

  // Updates progress bar
  if (tilesTapped <= 25) {
    progressBarGreenValue = 0.0f + (tilesTapped * 10.2f);
    progressBarRedValue = 255.0f;
  } else if (tilesTapped > 25 && tilesTapped <= 50) {
    progressBarRedValue = 255.0f - ( (tilesTapped - 25) * 10.2f);
    progressBarGreenValue = 255.0f;
  }
}


public void timeBar() {
  noStroke();
  fill(0xff00FF00);
  rect(0, 0, 480, 5);
  fill(white);
  rect(480, 0, -.032f * elapsedTime, 5);
  stroke(0);
}


public void endScreen(int gameNum) {
  String[] games = {"Classic Mode", "Arcade Mode", "Zen Mode", "Rush Mode"};
  //Title
  if (gameWL == -1) {
    background(250, 91, 67);
  } else {
    background(0, 0, 0);
  }
  fill(255, 255, 255);
  textSize(48);
  textAlign(CENTER);
  text(games[gameNum], 240, 180);
  //Score
  if (gameWL == -1) {
    fill(black);
  }
  generateScore();
  setHighScore();
  while (!statsUpdated) {
    updateStats();
    statsUpdated = true;
  }
  //Best Score
  //textSize(36);
  //text("BEST " + tilesTapped, 240, 410);
  textSize(24);
  textAlign(CENTER);
  if (gameWL == 1) {
    fill(white);
  }
  text("Press 'ENTER' to continue", 240, 520);
}


public void generateScore() {
    textSize(72);
    textAlign(CENTER);
  if (gameMode == 0) {
    
    if (gameWL == 1) {
      text(formatTime(endTime), 240, 360);
      score = endTime;
    } else if (gameWL == -1) {
      text("Failed !", 240, 360);
    }
  } else if (gameMode == 1 || gameMode == 2) {
   
    text(Integer.toString(tilesTapped), 240, 360);
    score = tilesTapped;
  } else if (gameMode == 3) {
    
    text(rushScore, 240, 360);
  }
}

public void infoScreen() {
  
 background(white);
 
   fill(black);
  textAlign(CENTER);
  textSize(32);
  
  text("Keyboard Tiles",240,50);
  text("Info",240,85);
  
  textSize(18);
  text("Based on the popular mobile game Piano Tiles",240,135);
  text("Created by Anthony Zeng and Ming You",240,160);
  
  textSize(32);
  text("Modes:", 240, 240);
  
  textSize(24);
  text("Classic:", 240, 300);
  text("Arcade:", 240, 380);
  text("Zen:", 240, 460);
  text("Rush:", 240, 540);
  
  textSize(14);
  text("How long it takes you to tap 50 tiles", 240, 330);
  text("How many tiles you can tap before you make a mistake", 240, 410);
  text("How many tiles you can tap in 15 seconds.", 240, 490);
  text("How many tiles you can tap per second", 240, 570);
  
  textSize(32);
  text("Press Enter to return to menu", 240, 665);
  
}
public void keyPressed() { 

  if (tilesTapped == 0) {
    startTime = millis();
  }

  if (screen >= 10 && screen < 20) {

    if (tilePositions[tilePositionIndex] == 0 && Character.toLowerCase(key) == tileAKey) {
      advanceGame();
    } else if (tilePositions[tilePositionIndex] == 1 && Character.toLowerCase(key) == tileBKey) {

      advanceGame();
    } else if (tilePositions[tilePositionIndex] == 2 && Character.toLowerCase(key) == tileCKey) {

      advanceGame();
    } else if (tilePositions[tilePositionIndex] == 3 && Character.toLowerCase(key) == tileDKey) {
      advanceGame();
    } else {
      gameWL = -1;
      endTime = millis() - startTime;
    }
  } else if (screen == 20 || screen >= 0 && screen <= 9) {

    if (key == ENTER) {
      gameWL = 0;
      setup();
    }
  }
}


public void mousePressed() {

  if (screen == 0) {
    if (mouseX >= 0 && mouseX <= 240 && mouseY >= 0 && mouseY <= 180) {
      // Classic Mode
      gameMode = 0;
      screen = 10;
    } else if (mouseX >= 240 && mouseX <= 440 && mouseY >= 0 && mouseY <= 180) {
      // Arcade Mode
      gameMode = 1;
      screen = 11;
    } else if (mouseX >= 0 && mouseX <= 240 && mouseY >= 0 && mouseY <= 360) {
      gameMode = 2;
      screen = 12;
    } else if (mouseX >= 240 && mouseX <= 440 && mouseY >= 0 && mouseY <= 360) {
      gameMode = 3;
      screen = 13;
    } else if (mouseX >= 0 && mouseX <= 240 && mouseY >= 0 && mouseY <= 540) {
      screen = 1;
    } else if (mouseX >= 240 && mouseX <= 440 && mouseY >= 0 && mouseY <= 540) {
      screen = 2;
    } else if (mouseX >= 0 && mouseX <= 240 && mouseY >= 0 && mouseY <= 720) {
      screen = 3;
    } else if (mouseX >= 240 && mouseX <= 440 && mouseY >= 0 && mouseY <= 720) {
      screen = 4;
    }
  }

  if (screen == 1) {

    if (mouseX >= 180 && mouseX <= 300 & mouseY >= 550 && mouseY <= 610) {
      resetStats();
    }
  }

  if (screen == 2) {

    // Row 1
    if (mouseX >= 80 && mouseX <= 140 && mouseY >= 100 && mouseY <= 160) {
      colorSelectorXCor = 110;
      colorSelectorYCor = 130;
      tileColorIndex = 0;
    } else if (mouseX >= 210 && mouseX <= 270 && mouseY >= 100 && mouseY <= 160) {
      colorSelectorXCor = 240;
      colorSelectorYCor = 130;
      tileColorIndex = 1;
    } else if (mouseX >= 340 && mouseX <= 400 && mouseY >= 100 && mouseY <= 160) {
      colorSelectorXCor = 370;
      colorSelectorYCor = 130;
      tileColorIndex = 2;
    }
    // Row 2
    else if (mouseX >= 80 && mouseX <= 140 && mouseY >= 230 && mouseY <= 290) {
      colorSelectorXCor = 110;
      colorSelectorYCor = 260;
      tileColorIndex = 3;
    } else if (mouseX >= 210 && mouseX <= 270 && mouseY >= 230 && mouseY <= 290) {
      colorSelectorXCor = 240;
      colorSelectorYCor = 260;
      tileColorIndex = 4;
    } else if (mouseX >= 340 && mouseX <= 400 && mouseY >= 230 && mouseY <= 290) {
      colorSelectorXCor = 370;
      colorSelectorYCor = 260;
      tileColorIndex = 5;
    }
    // Row 3
    else if (mouseX >= 80 && mouseX <= 140 && mouseY >= 380 && mouseY <= 430) {
      colorSelectorXCor = 110;
      colorSelectorYCor = 410;
      tileColorIndex = 6;
    } else if (mouseX >= 210 && mouseX <= 270 && mouseY >= 380 && mouseY <= 430) {
      colorSelectorXCor = 240;
      colorSelectorYCor = 410;
      tileColorIndex = 7;
    } else if (mouseX >= 340 && mouseX <= 400 && mouseY >= 380 && mouseY <= 430) {
      colorSelectorXCor = 370;
      colorSelectorYCor = 410;
      tileColorIndex = 8;
    }
    // Row 4
    else if (mouseX >= 80 && mouseX <= 140 && mouseY >= 530 && mouseY <= 590) {
      colorSelectorXCor = 110;
      colorSelectorYCor = 560;
      tileColorIndex = 9;
    } else if (mouseX >= 210 && mouseX <= 270 && mouseY >= 530 && mouseY <= 590) {
      colorSelectorXCor = 240;
      colorSelectorYCor = 560;
      tileColorIndex = 10;
    } else if (mouseX >= 340 && mouseX <= 400 && mouseY >= 530 && mouseY <= 590) {
      colorSelectorXCor = 370;
      colorSelectorYCor = 560;
      tileColorIndex = 11;
    }
  }
  
  if (screen == 3) {
    // Column 1    
    if (mouseX >= 65 && mouseX <= 215 && mouseY >= 70 && mouseY <= 170) {
      instrumentSelectorXCor = 140;
      instrumentSelectorYCor = 120;
      instrumentIndex = 0;
    } else if (mouseX >= 65 && mouseX <= 215 && mouseY >= 190 && mouseY <= 290) {
      instrumentSelectorXCor = 140;
      instrumentSelectorYCor = 240;
      instrumentIndex = 1;
    } else if (mouseX >= 65 && mouseX <= 215 && mouseY >= 310 && mouseY <= 410) {
      instrumentSelectorXCor = 140;
      instrumentSelectorYCor = 360;
      instrumentIndex = 2;
    } else if (mouseX >= 65 && mouseX <= 215 && mouseY >= 430 && mouseY <= 530) {
      instrumentSelectorXCor = 140;
      instrumentSelectorYCor = 480;
      instrumentIndex = 3;
    } else if (mouseX >= 65 && mouseX <= 215 && mouseY >= 550 && mouseY <= 650) {
      instrumentSelectorXCor = 140;
      instrumentSelectorYCor = 600;
      instrumentIndex = 4;
    }
    
    // Column 2
    else if (mouseX >= 265 && mouseX <= 415 && mouseY >= 70 && mouseY <= 170) {
      instrumentSelectorXCor = 340;
      instrumentSelectorYCor = 120;
      instrumentIndex = 5;
    } else if (mouseX >= 265 && mouseX <= 415 && mouseY >= 190 && mouseY <= 290) {
      instrumentSelectorXCor = 340;
      instrumentSelectorYCor = 240;
      instrumentIndex = 6;
    } else if (mouseX >= 265 && mouseX <= 415 && mouseY >= 310 && mouseY <= 410) {
      instrumentSelectorXCor = 340;
      instrumentSelectorYCor = 360;
      instrumentIndex = 7;
    } else if (mouseX >= 265 && mouseX <= 415 && mouseY >= 430 && mouseY <= 530) {
      instrumentSelectorXCor = 340;
      instrumentSelectorYCor = 480;
      instrumentIndex = 8;
    } else if (mouseX >= 265 && mouseX <= 415 && mouseY >= 550 && mouseY <= 650) {
      instrumentSelectorXCor = 340;
      instrumentSelectorYCor = 600;
      instrumentIndex = 9;
    }
    
  }
}

int[] instruments = {1,5,14,23,25,41,115,65,74,80};

public void instrumentsScreen() {
  
  background(white);
  
  fill(black);
  textAlign(CENTER);
  textSize(32);
  
  text("Instruments",240,50);
  
  rectMode(CENTER);
  textSize(26);
  
  // InstrumentSelector
  noStroke();
  fill(0xffffd700);
  rect(instrumentSelectorXCor,instrumentSelectorYCor,170,120,7);
  stroke(0);
  
  
  fill(white);
  rect(140,120,150,100,7);
  fill(black);
  text("Grand", 140, 110);
  text("Piano", 140, 150);
  
  fill(white);
  rect(140,240,150,100,7);
  fill(black);
  text("Electric", 140, 230);
  text("Piano", 140, 270);
  
  fill(white);
  rect(140,360,150,100,7);
  fill(black);
  text("Xylophone", 140, 370);
  
  fill(white);
  rect(140,480,150,100,7);
  fill(black);
  text("Harmonica", 140, 490);
  
  fill(white);
  rect(140,600,150,100,7);
  fill(black);
  text("Guitar", 140, 610);
  
  fill(white);
  rect(340,120,150,100,7);
  fill(black);
  text("Violin", 340, 130);
  
  fill(white);
  rect(340,240,150,100,7);
  fill(black);
  text("Drums", 340, 250);
  
  fill(white);
  rect(340,360,150,100,7);
  fill(black);
  text("Saxophone", 340, 370);
  
  fill(white);
  rect(340,480,150,100,7);
  fill(black);
  text("Flute", 340, 490);
  
  fill(white);
  rect(340,600,150,100,7);
  fill(black);
  text("Ocarina", 340, 610);
  
  
  
  rectMode(0);
  
   text("Press Enter to return to menu", 240, 694);
  
  
  settings[0] = Integer.toString(instrumentIndex);
  settings[1] = Integer.toString(instrumentSelectorXCor);
  settings[2] = Integer.toString(instrumentSelectorYCor);
  saveStrings(settingsFile, settings);
}

















/*
 1.  Acoustic Grand Piano     65.  Soprano Sax
 2.  Bright Acoustic Piano    66.  Alto Sax
 3.  Electric Grand Piano     67.  Tenor Sax
 4.  Honky-tonk Piano         68.  Baritone Sax
 5.  Electric Piano 1         69.  Oboe
 6.  Electric Piano 2         70.  English Horn
 7.  Harpsichord              71.  Bassoon
 8.  Clavi                    72.  Clarinet
 9.  Celesta                  73.  Piccolo
 10.  Glockenspiel            74.  Flute
 11.  Music Box               75.  Recorder
 12.  Vibraphone              76.  Pan Flute
 13.  Marimba                 77.  Blown Bottle
 14.  Xylophone               78.  Shakuhachi
 15.  Tubular Bells           79.  Whistle
 16.  Dulcimer                80.  Ocarina
 17.  Drawbar Organ           81.  Lead 1 (square)
 18.  Percussive Organ        82.  Lead 2 (sawtooth)
 19.  Rock Organ              83.  Lead 3 (calliope)
 20.  Church Organ            84.  Lead 4 (chiff)
 21.  Reed Organ              85.  Lead 5 (charang)
 22.  Accordion               86.  Lead 6 (voice)
 23.  Harmonica               87.  Lead 7 (fifths)
 24.  Tango Accordion         88.  Lead 8 (bass + lead)
 25.  Acoustic Guitar (nylon) 89.  Pad 1 (new age)
 26.  Acoustic Guitar (steel) 90.  Pad 2 (warm)
 27.  Electric Guitar (jazz)  91.  Pad 3 (polysynth)
 28.  Electric Guitar (clean) 92.  Pad 4 (choir)
 29.  Electric Guitar (muted) 93.  Pad 5 (bowed)
 30.  Overdriven Guitar       94.  Pad 6 (metallic)
 31.  Distortion Guitar       95.  Pad 7 (halo)
 32.  Guitar harmonics        96.  Pad 8 (sweep)
 33.  Acoustic Bass           97.  FX 1 (rain)
 34.  Electric Bass (finger)  98.  FX 2 (soundtrack)
 35.  Electric Bass (pick)    99.  FX 3 (crystal)
 36.  Fretless Bass           100.  FX 4 (atmosphere)
 37.  Slap Bass 1             101.  FX 5 (brightness)
 38.  Slap Bass 2             102.  FX 6 (goblins)
 39.  Synth Bass 1            103.  FX 7 (echoes)
 40.  Synth Bass 2            104.  FX 8 (sci-fi)
 41.  Violin                  105.  Sitar
 42.  Viola                   106.  Banjo
 43.  Cello                   107.  Shamisen
 44.  Contrabass              108.  Koto
 45.  Tremolo Strings         109.  Kalimba
 46.  Pizzicato Strings       110.  Bag pipe
 47.  Orchestral Harp         111.  Fiddle
 48.  Timpani                 112.  Shanai
 49.  String Ensemble 1       113.  Tinkle Bell
 50.  String Ensemble 2       114.  Agogo
 51.  SynthStrings 1          115.  Steel Drums
 52.  SynthStrings 2          116.  Woodblock
 53.  Choir Aahs              117.  Taiko Drum
 54.  Voice Oohs              118.  Melodic Tom
 55.  Synth Voice             119.  Synth Drum
 56.  Orchestra Hit           120.  Reverse Cymbal
 57.  Trumpet                 121.  Guitar Fret Noise
 58.  Trombone                122.  Breath Noise
 59.  Tuba                    123.  Seashore
 60.  Muted Trumpet           124.  Bird Tweet
 61.  French Horn             125.  Telephone Ring
 62.  Brass Section           126.  Helicopter
 63.  SynthBrass 1            127.  Applause
 64.  SynthBrass 2            128.  Gunshot
*/

// key bindings
char tileAKey = 'a';
char tileBKey = 's';
char tileCKey = 'd';
char tileDKey = 'f';
char tileEKey = 'j';
char tileFKey = 'k';





final int black = 0;
final int white = 255;

public void menuScreen() {

  background(255, 255, 255, 360); 
  textAlign(0);

  // Classic
  fill(black);
  textSize(42);
  text("Classic", 50, 105);  

  // Arcade Mode
  fill(black);
  rect(240, 0, 240, 180); 
  fill(white);
  textSize(42);
  text("Arcade", 290, 105);
  
  // Zen Mode
  fill(black);
  rect(0, 180, 240, 180);
  fill(white);
  text("Zen", 80, 285);
  
  //Rush Mode 
  fill(black);
  text("Rush", 310, 285);
  
  // Stats 
  fill(black);
  text("Stats", 70, 465);
  
  // Tile Color
  fill(black);
  rect(240, 360, 240, 180);
  fill(white);
  text("Tile", 320, 440);
  text("Color", 305, 490);
  
  // Instrument
  fill(black);
  rect(0, 540, 240, 180);
  fill(white);
  text("Instrument", 10, 645);
  
  // Info Screen
  fill(black);
  text("Info", 320, 645);
  
}

// MIDI number for note in octave 1
final int baseC = 24;
final int baseD = 26;
final int baseE = 28;
final int baseF = 29;
final int baseG = 31;
final int baseA = 33;
final int baseB = 35;

/*
  Each note of a song is represented by a String
 Index 0: base note
 Index 1 octave 
 Index 2: note accidental (flat, natural, shrap)
 Index 3: note length
 Base note and octave required
 Note accidental defaults to natural
 Note length defaults to quarter
 Note accidental required if specifying note length
 */
public int getMIDINum(String note) { 
  
  String baseNote = note.substring(0, 1);
  int octave = (Integer.parseInt(note.substring(1, 2)) - 1) * 12;
  int modifier = 0;
  
  try {
    
    if (note.substring(2, 3).equals("f")) {
      modifier = -1;
    } else if (note.substring(2, 3).equals("s")) {
      modifier = 1;
    }
    
  } catch(Exception e) { }
  
  if (baseNote.equals("c")) {
    return (baseC + octave) + modifier;
  } else if (baseNote.equals("d")) {
    return (baseD + octave) + modifier;
  } else if (baseNote.equals("e")) {
    return (baseE + octave) + modifier;
  } else if (baseNote.equals("f")) {
    return (baseF + octave) + modifier;
  } else if (baseNote.equals("g")) {
    return (baseG + octave) + modifier;
  } else if (baseNote.equals("a")) {
    return (baseA + octave) + modifier;
  } else if (baseNote.equals("b")) {
    return (baseB + octave) + modifier;
  }
  
  return 0;
  
}


public double getNoteLength(String note) {
  
  String noteLength;
  
  try {
    noteLength = note.substring(3, 4);
  } catch (Exception e) {
    return 0.25f;
  }
  
  if (noteLength == "t") {
    return 0.03125f; // thirty-second note
  } else if (noteLength.equals("s")) {
    return 0.0625f; // sixteenth note;
  } else if (noteLength.equals("e")) {
    return 0.125f; // eigth note
  } else if (noteLength.equals("q")) {
    return 0.25f; // quarter note
  } else if (noteLength.equals("h")) {
    return 0.5f; // half note
  } else if (noteLength.equals("w")) {
    return 1; // whole note
  }
  
  return 0.25f;
  
}

String[][] sheetMusic = {
  
  //Mary Had a Little Lamb
  {"e4", "d4", "c4", "d4", "e4", "e4", "e4", "d4", "d4", "d4", "e4", "g4", "g4", "e4", "d4", "c4", "d4", "e4", "e4", "e4", "d4", 
    "d4", "e4", "d4", "c4nw"
  }, 

  //Fur Elise
  {"e5", "d5s", "e5", "d5s", "e5", "b4", "d5", "c5", "a4", "a2", "e3", "a3", "c4", "e4", "a4", "b3", "e3", "g3", "b3", "e4", "g4s", "b4", "c5", "a2", "e3", "a3", "e4", "e5", "d5", //1st Stanza
    "e5", "d5s", "e5", "b4", "d5", "c5", "a4", "a2", "e3", "a3", "c4", "e4", "a4", "b4", "e3", "g3s", "b3", "e4", "e5", "b4", "a4nh", "a4", "e3", "a3", "e5", "d5s", "e5", "d5s", "e5", 
    "b4", "d5", "c5", //2nd Stanza
    "a2", "e3", "a3", "c4", "b4", "e3", "g3s", "b3", "e4", "g4s", "b4", "c5", "a2", "e3", "a3", "e4", "e5", "d5s", "e5n", "d5s", "e5", "b4", "d5", "c5", "a4", "a2", "e3", "a3", "c4", 
    "e4", "a4", // 3rd Stanza
    "b4", "e3", "g3s", "b3", "e4", "c5", "b4", "a4", "a2", "e3", "a3", "b4", "c5", "d5", "e5", "c3", "g3", "c4", "g4", "f5", "e5", "d5", "g3", "a3", "d4", "f4", "e5", "d5", "c5", "a2", 
    "e3", "a3", "f4", "d5", "c5", //4th Stanza
    "b4", "e3", "b3", "e4", "e4", "e5", "e3", "e4", "e4", "e5", "d5s", "e5", "d5s", "e5", "d5s", "e5", "d5s", "e5", "d5s", "e5", "d5s", "e5", "c5", "d5", "c5", //5th Stanza
    "a4", "a2", "e3", "a3", "c4", "e4", "a4", "b4", "e3", "g3s", "b3", "e4", "g4s", "b4", "c5", "a2", "e3", "a3", "e4", "e5", "d5s", //6th Stanza
    "e5", "d5s", "e5", "b4", "d5", "c5", "a2", "e3", "a3", "c4", "e4", "a4", "b4", "e3", "g5s", "b3", "e4", "c5", "b4", "a4" //7th S
  },
  
  // Twinkle Twinkle Little Star
  {
    "c4", "c4", "g4", "g4", "a4", "a4", "g4nh", "f4", "f4", "e4", "e4", "d4", "d4", "c4nh", "g4", "g4", "f4", "f4", "e4", "e4", "d4nh", "g4", "g4", "f4", "f4", "e4", "e4", "d4",
    "c4", "c4", "g4", "g4", "a4", "a4", "g4", "f4", "f4", "e4", "e4", "d4", "d4", "c4nh"
  },
  
  // Ode to Joy
  {
   "e4", "e4", "f4", "g4", "g4", "f4", "e4", "d4", "c4", "c4", "d4", "e4", "e4", "d4", "d4nh", // 1st Stanza
   "e4", "e4", "f4", "g4", "g4", "f4", "e4", "d4", "c4", "c4", "d4", "e4", "d4", "c4", "c4ng", // 2nd Stanza
   "d4nh", "e4", "c4", "d4", "e4", "f4", "e4", "c4", "d4", "e4", "f4", "e4", "d4", "c4", "d4", "g4nh", // 3rd Stanza
   "e4", "e4", "f4", "g4", "g4", "f4", "e4", "d4", "c4", "c4", "d4", "e4", "d4", "c4", "c4ng" // 4th Stanza
  },
  
  // Good King Wenceslas
  {
   "g4", "g4", "g4", "a4", "g4", "g4", "d4nh", "e4", "d4", "e4", "f4sq", "g4nh", "g4nh", "g4", "g4", "g4", "a4", "g4", "g4", "d4ng", // 1st Stanza
   "e4", "d4", "e4", "f4sq", "g4ng", "g4nh", "d5", "c5", "b4", "a4", "b4", "a4", "g4nh", "e4", "d4", "e4", "f4sq", // 2nd Stanza
   "g4nh", "g4nh", "d4", "d4", "e4", "f4sq", "g4", "g4", "a4nh", "d5", "c5", "b4", "a4", "g4nh", "c5nh", "g4nw"
  }, 
  
  // We Wish You a Merry Christmas
  {
   "d4", "g4", "g4", "a4", "g4", "f4s", "e4", "e4", "e4", "a4", "a4", "b4", "a4", "g4", "f4s", "d4", "d4", //1st Stanza
   "b4", "b4", "c5", "b4", "a4", "g4", "e4", "d4", "d4", "e4", "a4", "f4s", "g4nh", "d4", //2nd Stanza
   "g4", "g4", "g4", "f4sh", "f4s", "g4", "f4s", "e4", "d4nh", "a4", // 3rd Stanza
   "b4", "a4", "g4", "d5", "d4", "d4", "d4", "e4", "a4", "f4s", "g4nh"
  }
  
};

public void statsScreen() {
  
  background(white);
  
  fill(black);
  textAlign(CENTER);
  textSize(32);
  
  //Stats
  text("Stats",240,50);
  text("Games Played: " + totalGamesPlayed,240,120);
  text("Tiles Tapped: " + totalTilesTapped,240,160);
  text("Time Played: " + totalTimePlayed,240,200);
  
  // High Scores
  text("High Scores",240,300);
  text("Classic Mode : " + formatTime(Integer.parseInt(highScores[0])),240,370);
  text("Arcade Mode : " + highScores[1],240,410);
  text("Zen Mode : " + highScores[2],240,450);
  text("Rush Mode : " + highScores[3],240,490);
  
  fill(white);
  rectMode(CENTER);
  rect(240,580,120,60,7);
  fill(black);
  textSize(28);
  text("Reset", 240, 590);
  text("Press Enter to return to menu", 240, 665);
  
  rectMode(0);
  
}

public void resetStats() {
  
 for (int i = 0; i < stats.length; i++) {
   stats[i] = Integer.toString(0);
 }
 
 highScores[0] = "99999";
 highScores[1] = "0";
 highScores[2] = "0";
 highScores[3] = "0";
 
 totalGamesPlayed = stats[0];
 totalTilesTapped = stats[1];
 totalTimePlayed = formatTime(Integer.parseInt(stats[2])); 
 saveStrings(highScoreFile, highScores);
 saveStrings(statsFile, stats);
 
}
  public void settings() {  size(480, 720); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "keyboardTiles" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
