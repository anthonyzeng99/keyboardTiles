
void menuScreen() {
  background(255, 255, 255, 360);
  fill(#000000);
  //Arcade Mode
  rect(240,0,240,180); 
  fill(#FFFFFF);
  text("Arcade", 120, 90);
  //
  fill(#000000);
  rect(0,180,240,180);
  rect(240,360,240,180);
  rect(0,540,240,180);
}

void arcadeScreen() {
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

void endScreen(int gameNum) {
  String[] games = {"Classic Mode", "Arcade Mode", "Zen Mode", "Rush Mode"};
  //Title
  background(250,91,67);
  fill(255,255,255);
  textSize(48);
  textAlign(CENTER);
  text(games[gameNum], 240, 180);
  //Score
  fill(0,0,0);
  textSize(72);
  textAlign(CENTER);
  text(Integer.toString(score), 240, 360);
  //Best Score
  textSize(36);
  text("BEST " + score, 240, 410);
  
}