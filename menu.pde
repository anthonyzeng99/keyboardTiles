class button
{
  
 int overClassicX, overClassicY;
 int Classic
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
    if (mouseX >= 0 && mouseX <= 240 && mouseY >= 0 && mouseY <= 180){
      return true;}
    } else {
      return false;
    }
  }
  boolean overArcade() {
  }
  boolean overZen() {
  }
  boolean overRush() {
  }
  boolean overRelay() {
  }
  boolean overArcadePlus() {
  }
}