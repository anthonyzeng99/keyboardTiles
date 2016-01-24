void keyPressed() {
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
  } else if (screen == 20 || screen == 1) {
    if (key == ENTER) {
      gameWL = 0;
      setup();
    }
  }
}

void mousePressed() {
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
      println ("Zen Mode");
    } else if (mouseX >= 240 && mouseX <= 480 && mouseY >= 0 && mouseY <= 360) {
      println ("Rush Mode");
    } else if (mouseX >= 0 && mouseX <= 240 && mouseY >= 0 && mouseY <= 540) {
      println ("Stats");
      screen = 1;
    } 
  } 
  
  if (screen == 1) {
   if (mouseX >= 180 && mouseX <= 300 & mouseY >= 550 && mouseY <= 610) {
    println("reset"); 
    resetStats();
   }
  }
}