class Music {
    double[] notes;
    double[] beats;
    
    Music(double[][] song) {
      for (int index = 0; index < notes.length; index++) {
       this.notes[index] = song[index][0];
       this.beats[index] = song[index][1];
      }
    }
    
    void randomPiece() {
      
    }
    
}