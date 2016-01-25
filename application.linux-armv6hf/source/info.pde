
void infoScreen() {
  
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