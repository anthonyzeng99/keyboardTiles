final int black = 0;
final int white = 255;

void menuScreen() {

  background(255, 255, 255, 360); 
  textAlign(0);

  //Classic
  textSize(42);
  text("Classic", 50, 105);
  fill(black);  

  //Arcade Mode
  rect(240, 0, 240, 180); 
  fill(white);
  textSize(42);
  text("Arcade", 290, 105);

  fill(black);
  rect(0, 180, 240, 180);
  rect(240, 360, 240, 180);
  rect(0, 540, 240, 180);