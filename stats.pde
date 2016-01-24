
void statsScreen() {
  
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

void resetStats() {
  
 for (int i = 0; i < stats.length; i++) {
   stats[i] = Integer.toString(0);
 }
 
 highScores[0] = "99999";
 highScores[1] = "0";
 highScores[2] = "0";
 highScores[3] = "0";
 
 totalGamesPlayed = stats[0];
 totalTilesTapped = stats[1];
 totalTimePlayed = formatTime(Integer.parseInt(stats[2])); saveStrings("highScores.txt", highScores);
 saveStrings("stats.txt", stats);
 
}