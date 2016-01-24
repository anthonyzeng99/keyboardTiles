final int black = 0;
final int white = 255;

void menuScreen() {

  background(255, 255, 255, 360); 
  textAlign(0);

  //Classic
  fill(black);
  textSize(42);
  text("Classic", 50, 105);  

  //Arcade Mode
  fill(black);
  rect(240, 0, 240, 180); 
  fill(white);
  textSize(42);
  text("Arcade", 290, 105);
  
  //Zen Mode
  fill(black);
  rect(0, 180, 240, 180);
  fill(white);
  text("Zen", 80, 285);
  
  //Rush Mode 
  fill(black);
  text("Rush", 310, 285);
  
  //Stats 
  fill(black);
  text("Stats", 70, 465);
  
  fill(black);
  rect(240, 360, 240, 180);
  rect(0, 540, 240, 180);
}