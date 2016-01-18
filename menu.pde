
int overClassicX, overClassicY;
int Classic;
int overArcadeX, overArcadeY;
int overZenX, overZenY;
int overRushX, overRushY;
int overRelayX, overRelayY;
int overArcadePlusX, overArcadePlusY;

boolean overClassic = false;
boolean overArcade = false;
boolean overZen = false;
boolean overRush = false;
boolean overRelay = false;
boolean overArcadePlus = false;


boolean overClassic() {
  if (mouseX >= 0 && mouseX <= 240 && mouseY >= 0 && mouseY <= 180) {
    println("Classic");
    return true;
  } else {
    return false;
  }
}
boolean overArcade() {
  if (mouseX >= 240 && mouseX <= 440 && mouseY >= 0 && mouseY <= 180) {
    return true;
  } else {
    return false;
  }
}
boolean overZen() {
  if (mouseX >= 0 && mouseX <= 240 && mouseY >= 180 && mouseY <= 360) {
    return true;
  } else {
    return false;
  }
}
boolean overRush() {
  if (mouseX >= 240 && mouseX <= 480 && mouseY >= 180 && mouseY <= 360) {
    return true;
  } else {
    return false;
  }
}
boolean overRelay() {
  if (mouseX >= 0 && mouseX <= 240 && mouseY >= 360 && mouseY <= 540) {
    return true;
  } else {
    return false;
  }
}
boolean overArcadePlus() {
  if (mouseX >= 240 && mouseX <= 480 && mouseY >= 360 && mouseY <= 540) {
    return true;
  } else {
    return false;
  }
}
boolean overSettings() {
  if (mouseX >= 0 && mouseX <= 240 && mouseY >= 540 && mouseY <= 720) {
    return true;
  } else {
    return false;
  }
}

void update() {
 overClassic(); 
}

void mousePressed() {
  if (screen == 0) {
    if (overClassic()) {
      println("Classic Mode");
    } else if (overArcade()) {
      println("Arcade Mode");
      screen = 11;
    } else if (overZen()) {
      println ("Zen Mode");
    } else if (overRush()) {
      println ("Rush Mode"); 
    } else if (overRelay()){
      println ("Relay Mode");
    } else if (overArcadePlus()){
      println("ArcadePlus Mode");
    } else if (overSettings()){
      println("Settings Mode");
    }
  }
}