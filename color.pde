
int[] tileColors = {#dc143c, #fa0872, #ff1493, #228b22, #32cd32, #7cfc00, #00008b, #00bfff, #00ffff, #9400d3, #ffff00, #000000};

void colorScreen() {
  
  background(white);
  
  fill(black);
  textAlign(CENTER);
  textSize(32);
  
  text("Tile Color",240,50);
  
  rectMode(CENTER);
  
  noStroke();
  
  //Color Selector
  fill(#ffd700);
  rect(colorSelectorXCor,colorSelectorYCor,85,85,7);
  
  // Reds
  fill(#dc143c);
  rect(110,130,60,60,7);
  fill(#fa0872);
  rect(240,130,60,60,7);
  fill(#ff1493);
  rect(370,130,60,60,7);
  
  // Greens
  fill(#228b22);
  rect(110,260,60,60,7);  
  fill(#32cd32);
  rect(240,260,60,60,7); 
  fill(#7cfc00);
  rect(370,260,60,60,7);
  
  // Blues
  fill(#00008b);
  rect(110,410,60,60,7);  
  fill(#00bfff);
  rect(240,410,60,60,7);  
  fill(#00ffff);
  rect(370,410,60,60,7);
  
  // Other Colors
  fill(#9400d3);
  rect(110,560,60,60,7);
  fill(#ffff00);
  rect(240,560,60,60,7);
  fill(#000000);
  rect(370,560,60,60,7);
  
  text("Press Enter to return to menu", 240, 665);
  
  rectMode(0);
  stroke(0);
  
  settings[3] = Integer.toString(tileColorIndex);
  settings[4] = Integer.toString(colorSelectorXCor);
  settings[5] = Integer.toString(colorSelectorYCor);
  saveStrings(settingsFile, settings);
}