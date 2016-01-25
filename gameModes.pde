
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
    fill(tileColors[tileColorIndex]);
    int xCor = (tilePositions[tilePositionIndex + tileNum]) *120;
    int yCor = (3 - tileNum) * 180 + 1;
    rect(xCor, yCor, 120, 179);
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
    endTime = millis() - startTime;
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

void zenScreen() {
  
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

void rushScreen() {
  
  standardGameLayout();
  
  fill(235, 16, 16);
  textSize(42);
  textAlign(CENTER);
  rushScore = nf(tilesTapped / (elapsedTime / 1000.0 + 1), 1, 3);
  text(formatRushScore(), 240, 90);
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


void timeBar() {
  fill(#00FF00);
  rect(0, 0, 480, 5);
  fill(white);
  rect(480, 0, -.032 * elapsedTime, 5);
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


void generateScore() {
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