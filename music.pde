
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
 Index 2: note accidental (flat, natural, shrap)
 Index 3: note length
 Base note and octave required
 Note accidental defaults to natural
 Note length defaults to quarter
 Note accidental required if specifying note length
 */
int getMIDINum(String note) {
  String baseNote = note.substring(0, 1);
  int octave = (Integer.parseInt(note.substring(1, 2)) - 1) * 12;
  int modifier = 0;
  try {
    if (note.substring(2, 3) == "f") {
      modifier = -1;
    } else if (note.substring(2, 3) == "s") {
      modifier = 1;
    }
  } 
  catch(Exception e) {
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
  String noteLength;
  try {
    noteLength = note.substring(3, 4);
  } 
  catch (Exception e) {
    return 0.25;
  }
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
  return 0.25;
}

String[][] sheetMusic = {
  //Mary Had a Little Lamb
  {"e4", "d4", "c4", "d4", "e4", "e4", "e4", "d4", "d4", "d4", "e4", "g4", "g4", "e4", "d4", "c4", "d4", "e4", "e4", "e4", "d4", 
    "d4", "e4", "d4", "c4nw"
  }, 

  //Fur Elise
  {"e5", "d5s", "e5", "d5s", "e5", "b4", "d5", "c5", "a4", "a2", "e3", "a3", "c4", "e4", "a4", "b3", "e3", "g3", "b3", "e4", "g4s", "b4", "c5", "a2", "e3", "a3", "e4", "e5", "d5", //1st Stanza
    "e5", "d5s", "e5", "b4", "d5", "c5", "a4", "a2", "e3", "a3", "c4", "e4", "a4", "b4", "e3", "g3s", "b3", "e4", "e5", "b4", "a4nh", "a4", "e3", "a3", "e5", "d5s", "e5", "d5s", "e5", 
    "b4", "d5", "c5", //2nd Stanza
    "a2", "e3", "a3", "c4", "b4", "e3", "g3s", "b3", "e4", "g4s", "b4", "c5", "a2", "e3", "a3", "e4", "e5", "d5s", "e5n", "d5s", "e5", "b4", "d5", "c5", "a4", "a2", "e3", "a3", "c4", 
    "e4", "a4", // 3rd Stanza
    "b4", "e3", "g3s", "b3", "e4", "c5", "b4", "a4", "a2", "e3", "a3", "b4", "c5", "d5", "e5", "c3", "g3", "c4", "g4", "f5", "e5", "d5", "g3", "a3", "d4", "f4", "e5", "d5", "c5", "a2", 
    "e3", "a3", "f4", "d5", "c5", //4th Stanza
    "b4", "e3", "b3", "e4", "e4", "e5", "e3", "e4", "e4", "e5", "d5s", "e5", "d5s", "e5", "d5s", "e5", "d5s", "e5", "d5s", "e5", "d5s", "e5", "c5", "d5", "c5", //5th Stanza
    "a4", "a2", "e3", "a3", "c4", "e4", "a4", "b4", "e3", "g3s", "b3", "e4", "g4s", "b4", "c5", "a2", "e3", "a3", "e4", "e5", "d5s", //6th Stanza
    "e5", "d5s", "e5", "b4", "d5", "c5", "a2", "e3", "a3", "c4", "e4", "a4", "b4", "e3", "g5s", "b3", "e4", "c5", "b4", "a4" //7th S
  }  
};