
// Draws standard grid layout and tiles
void standardGameLayout() {

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
    fill(#000000);
    int xCor = (tilePositions[tilePositionIndex + tileNum]) *120 - 1;
    int yCor = (3 - tileNum) * 180;
    rect(xCor, yCor, 120.75, 179);
  }
}


void classicScreen() {
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
  }
}


void arcadeScreen() {

  standardGameLayout();

  // Score - Based on tiles tapped
  fill(235, 16, 16);
  textSize(42);
  textAlign(CENTER);
  text(Integer.toString(tilesTapped), 240, 90);
  textAlign(0);
}

void progressBar() {
  float barProgress;
  
  // Draws the progress bar
  barProgress = tilesTapped * 9.6;
  fill(progressBarRedValue, progressBarGreenValue, 0.0);
  noStroke();
  rect(0, 0, barProgress, 5); 
  stroke(0);
  
  // Updates progress bar
  if (tilesTapped <= 25) {
    progressBarGreenValue = 0.0 + (tilesTapped * 10.2);
    progressBarRedValue = 255.0;
  } else if (tilesTapped > 25 && tilesTapped <= 50) {
    progressBarRedValue = 255.0 - ( (tilesTapped - 25) * 10.2);
    progressBarGreenValue = 255.0;
  }
  
}

void endScreen(int gameNum) {
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
    fill(0, 0, 0);
  }
  generateScore();
  //Best Score
  //textSize(36);
  //text("BEST " + tilesTapped, 240, 410);
}


void generateScore() {
  if (gameMode == 0) {
    textSize(72);
    textAlign(CENTER);
    if (gameWL == 1) {
      text(formatTime(elapsedTime), 240, 360);
    } else if (gameWL == -1) {
      text("Failed !", 240, 360);
    }
  } else if (gameMode == 1) {
    textSize(72);
    textAlign(CENTER);
    text(Integer.toString(tilesTapped), 240, 360);
  } 
  
}