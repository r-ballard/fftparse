import com.hamoid.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.spi.*;

VideoExport videoExport;

String audioFilePath = "song_path";

String SEP = "|";
float movieFPS = 30;
float frameDuration = 1 / movieFPS;
BufferedReader reader;

float specLow = 0.03; // 3%
float specMid = 0.125;  // 12.5%
float specHigh = 0.20;   // 20%

float scoreLow = 0;
float scoreMid = 0;
float scoreHigh = 0;

void setup(){
reader = createReader(audioFilePath + ".txt");

}


void draw() {
  String line;
  try {
    line = reader.readLine();
  }
  catch (IOException e) {
    e.printStackTrace();
    line = null;
  }
  if (line == null) {
    // Done reading the file.
    // Close the video file.
    videoExport.endMovie();
    exit();
  } else {
    String[] p = split(line, SEP);
    // The first column indicates 
    // the sound time in seconds.
    float soundTime = float(p[0]);
    
    for (int i = 1; i < p.length; i+=2){
    //print((float(p[i]) + float(p[i+1]))/2,"\n");
    float p_value = (float(p[i]) + float(p[i+1])) / 2;
    //print(p_value,"\n");
    
    //Scores low, medium, and high frequency bands
    if ( (float) i/p.length <= specLow) {
        scoreLow += p_value;
      } else if ( (float) i/p.length <= specMid) {
        scoreMid += p_value;
      } else { scoreHigh += p_value;
    }
   
    print("scoreLow: ", scoreLow, "\n", "scoreMid: ", scoreMid, "\n", "scoreHigh: ", scoreHigh, "\n");
    
    //print((float) i/p.length,"\n");
  }
 }
}
