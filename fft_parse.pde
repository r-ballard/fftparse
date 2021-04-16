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
    //print((float(p[i]) + float(p[i+1]))/2,'\n');
    float p_value = (float(p[i]) + float(p[i+1])) / 2;
    print(p_value,'\n');
    }
  }
}
