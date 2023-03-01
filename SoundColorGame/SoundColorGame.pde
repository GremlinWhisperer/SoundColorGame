int s1x, s1y, s2y, nul, mx1, my1, d1;  //Tracks slider info
boolean s1p = false, s2p = false;  //slide#pressed

void setup(){
  size(800,800);
  background(255,255,255);

}

void draw(){
  background(255,255,255);
  checkMouse();
  
  slideOne();
  slideTwo();
}

void slideOne(){  //Draws and maintains Slider One
  if(s1y == nul) s1y = 160;
  noStroke();
  fill(165,165,165);
  rect(720, 40, 15, 240);  //Bar to slide on
  stroke(0);
  strokeWeight(3);
  fill(134,134,134);
  rect(707, s1y, 40, 20);
}
void slideTwo(){  //Draws and maintains Slider One
  if(s2y == nul) s2y = 160;
  noStroke();
  fill(165,165,165);
  rect(80, 40, 15, 240);  //Bar to slide on
  stroke(0);
  strokeWeight(3);
  fill(134,134,134);
  rect(67, s2y, 40, 20);
}

void checkMouse(){
  if(mouseY > s1y && mouseY < (s1y + 20) && mouseX > 707 && mouseX < 747){
    s1p = true;
    cursor(HAND);
  }
  if(mouseY > s2y && mouseY < (s2y + 20) && mouseX > 67 && mouseX < 107){
    s2p = true;
    cursor(HAND);
  }
}

void mouseDragged(){
  if(s1p){  //slider one
    s1y = mouseY;
    if(s1y > 270){
      s1y = 270;
    }
    if(s1y < 30){
      s1y = 30;
    }
  }
  if(s2p){
    s2y = mouseY;
    if(s2y > 270){
      s2y = 270;
    }
    if(s2y < 30){
      s2y = 30;
    }
  }
}

void mouseReleased(){
  cursor(ARROW);
  s1p = false;
  s2p = false;
}
