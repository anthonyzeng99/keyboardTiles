
// MIDI number for note in octave 1
final int baseC = 24;
final int baseD = 26;
final int baseE = 28;
final int baseF = 29;
final int baseG = 31;
final int baseA = 33;
final int baseB = 35;

/*
  Each note of a song is represented by a String
  Index 0: base note
  Index 1 octave 
  Index 2: note accidental (flat, natural, flat)
  Index 3: note length
*/
int getMIDINum(String note) {
  String baseNote = note.substring(0, 1);
  int octave = (Integer.parseInt(note.substring(1, 2)) - 1) * 12;
  int modifier = 0;
  if (note.substring(2, 3) == "f") {
    modifier = -1;
  } else if (note.substring(2, 3) == "s") {
    modifier = 1;
  }
  if (baseNote.equals("c")) {
    return (baseC + octave) + modifier;
  } else if (baseNote.equals("d")) {
    return (baseD + octave) + modifier;
  } else if (baseNote.equals("e")) {
    return (baseE + octave) + modifier;
  } else if (baseNote.equals("f")) {
    return (baseF + octave) + modifier;
  } else if (baseNote.equals("g")) {
    return (baseG + octave) + modifier;
  } else if (baseNote.equals("a")) {
    return (baseA + octave) + modifier;
  } else if (baseNote.equals("b")) {
    return (baseB + octave) + modifier;
  }
  return 0;
}

double getNoteLength(String note) {
 String noteLength = note.substring(3,4); 
 if (noteLength == "t") {
   return 0.03125; // thirty-second note
 } else if (noteLength.equals("s")) {
   return 0.0625; // sixteenth note; 
 } else if (noteLength.equals("e")) {
    return 0.125; // eigth note
 } else if (noteLength.equals("q")) {
   return 0.25; // quarter note 
 } else if (noteLength.equals("h")) {
   return 0.5; // half note
 } else if (noteLength.equals("w")) {
  return 1; // whole note 
 }
 return 0;
}

String[][] sheetMusic = {
 {"e4nq", "d4nq", "c4nq", "d4nq", "e4nq", "e4nq", "e4nq", "d4nq", "d4nq", "d4nq", "e4nq", "g4nq", "g4nq", "e4nq", "d4nq", "c4nq", "d4nq", "e4nq", "e4nq", "e4nq", "d4nq", 
  "d4nq", "e4nq", "d4nq", "c4nw",} // Mary Had a Little Lamb
};

double[][] furElise = {
  {76, 0.25}, 
  {75, 0.25}, 
  {76, 0.25}, 
  {75, 0.25}, 
  {76, 0.25}, 
  {71, 0.25}, 
  {73, 0.25}, 
  {72, 0.25}, 
  {69, 0.25}, 
};