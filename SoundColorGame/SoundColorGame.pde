import processing.sound.*;

SoundFile songA;
Reverb reverb;
Slider[] slide;

String[] songList = new String[5];
int h, s, b, h1, s1, b1;
float size, wet, damp, rate;  //self explanitory
float sPer, wPer, dPer, rPer;
boolean s1p = false, s2p = false;  //slide#pressed
boolean match;

void setup(){
  slide = new Slider[4];
  setSlide();
  colorMode(HSB, 300, 300, 300);
  size(800,800);
  setList();
  setSong();
  reverb = new Reverb(this);
}

void draw(){        //////////////////////////////////////////////////////////  DRAW
  playSong();
  stopSong(); 
  if(songA.isPlaying()){
    getColor();
    background(h, s, b);
    update();
  }
  disSquare();

  //background(0, 0, 300);
  for(int i = 0; i < slide.length; i++){
    slide[i].display();
    slide[i].checkMouse();
  }
  checkColor();
  if(match){
    //print("YESYESYES");
    
  }

  

}              ////////////////////////////////////////////////////////////   DRAW  



//Functions in order to swap and set songs
void setSong(){  //loads songA (songArray) with the reference information
  songA = new SoundFile(this, songList[0]);
}

void setList(){  //manually loads the reference information
  songList[0] = "Nu Flute.mp3";
  songList[1] = "Piano Between.mp3";
  songList[2] = "Unpromised.mp3";
  songList[3] = "Ranz des Vaches.mp3";
  songList[4] = "Village Dawn.mp3";
}

void playSong(){  //Actually plays the song
  if(!songA.isPlaying()){
    songA.loop();
  }  
}

void stopSong(){  //stops current song playing, then plays another
  if(keyPressed || match){ //testing in final version, stopSong() will be triggered by matching the color. 
    
    randColor();
    songA.stop();
    reverb.stop();
    songA = new SoundFile(this, songList[int(random(0,5))]);
    //Both integers within random() MUST be manually set. Failure to do so will prevent any and all input.
    //Processing is a good program that has zero flaws.
    //I especially like how it always follows its own internal logic.
    
    randSong();
    songA.rate(rate);
    reverb.set(size, damp, wet);
    reverb.process(songA);
    
    delay(10);
    if(match){
      delay(400);
    }
    
    match = false;
  }
}

void randSong(){  //Randomizes audio settings
  size = random(0.1, 0.9);  //0 - 1
  wet = random(0.1, 0.9);  //Maximum is 1, minimum is 0;
  damp = random(0.1, 0.9); // 0 - 1
  rate = random(0.3, 2.5);  //Maximum is technically infinity, but we won't scale above 3.
}

void getAudPer(){  //calculates %s
  sPer = (size - 0.1)/0.8;
  wPer = (wet - 0.1)/0.8;
  dPer = (damp - 0.1)/0.8;
  rPer = (rate - 0.3)/2.2;
}

void getColor(){  //Uses size, wet, damp and rate to calculate a color within HSB 300
  getAudPer();
  h = int((300.0 - (280.0 * wPer) + (280.0 * dPer)) * (rPer));
  b = int((300.0 - (280.0 * sPer) + (280.0 * wPer)));
  s = int((300.0 - (280.0 * dPer) + (280.0 * sPer)));
}

void update(){  //sets size, wet, damp, rate based on sliders
  //reverb.stop();
  size = slide[0].getPer();
  wet = slide[1].getPer();
  damp = slide[2].getPer();
  rate = slide[3].getPer() * 3.0;
  //reverb.stop();
  reverb.set(size, damp, wet);
  songA.rate(rate);
  reverb.process(songA);
}

void disSquare(){  //creates a square in the middle that the player must match color too.
  noStroke();
  fill(h1,s1,b1);
  rect(300, 300, 200, 200);
}

void randColor(){  //randomizes inner square
  h1 = int(random(0,300));
  s1 = int(random(20,280));
  b1 = int(random(90,300));

}

void checkColor(){
  if(abs((h + s + b - h1 - s1 - b1)) < 100){
    match = true;
  }
  
  
}





//Everything past here is for sliders. //////////////////////////////////////////////////////
void mouseDragged(){
  for(int i = 0; i < slide.length; i++){
    if(slide[i].isPress()){
      slide[i].setY();
    }
  }
}


void mouseReleased(){
  cursor(ARROW);
  for(int i = 0; i < slide.length; i++){
    slide[i].release();
  }
}

void setSlide(){
  slide[0] = new Slider(720, 40);
  slide[1] = new Slider(80, 40);
  slide[2] = new Slider(720, 500);
  slide[3] = new Slider(80, 500);
}

//End of SLiders ///////////////////////////////////////////////////
