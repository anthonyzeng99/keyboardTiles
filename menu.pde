class menu
{
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
//draw:
//if overclassic{
//code to do if its inside 
//the classic option and so on

//in draw void update(){
//if(overClassic()){make the mode into zen}

boolean overClassic() {
    if (mousePressed == true && mouseX >= 0 && mouseX <= 240 && mouseY >= 0 && mouseY <= 180){
      return true;}
     else {
      return false;
    }
  }
  boolean overArcade() {
    if (mousePressed == true && mouseX >= 240 && mouseX <= 440 && mouseY >= 0 && mouseY <= 180){
      return true;}
     else {
      return false;
    }
  }
  boolean overZen() {
    if (mousePressed == true && mouseX >= 0 && mouseX <= 240 && mouseY >= 0 && mouseY <= 360){
      return true;}
     else {
      return false;
    }
  }
  boolean overRush() {
    if (mousePressed == true && mouseX >= 240 && mouseX <= 480 && mouseY >= 0 && mouseY <= 360){
      return true;}
     else {
      return false;
    }
  }
  boolean overRelay() {
    if (mousePressed == true && mouseX >= 0 && mouseX <= 240 && mouseY >= 0 && mouseY <= 540){
      return true;}
     else {
      return false;
    }
  }
  boolean overArcadePlus() {
    if (mousePressed == true && mouseX >= 240 && mouseX <= 480 && mouseY >= 0 && mouseY <= 540){
      return true;}
     else {
      return false;
    }
  }
}