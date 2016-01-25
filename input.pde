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
  } else if (screen == 20 || screen >= 0 && screen <= 9) {

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
      gameMode = 2;
      screen = 12;
    } else if (mouseX >= 240 && mouseX <= 440 && mouseY >= 0 && mouseY <= 360) {
      println ("Rush Mode");
    } else if (mouseX >= 0 && mouseX <= 240 && mouseY >= 0 && mouseY <= 540) {
      println ("Stats");
      screen = 1;
    } else if (mouseX >= 240 && mouseX <= 440 && mouseY >= 0 && mouseY <= 540) {
      println ("Color");
      screen = 2;
    } else if (mouseX >= 0 && mouseX <= 240 && mouseY >= 0 && mouseY <= 720) {
      println ("Instrument");
      screen = 3;
    } else if (mouseX >= 240 && mouseX <= 440 && mouseY >= 0 && mouseY <= 720) {
      println ("Info");
      screen = 4;
    }
  }

  if (screen == 1) {

    if (mouseX >= 180 && mouseX <= 300 & mouseY >= 550 && mouseY <= 610) {
      println("reset"); 
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
}