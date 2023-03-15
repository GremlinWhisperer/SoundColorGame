class Slider {
  
  boolean locked = false;
  boolean pressed = false;
  int xPos, yPos, sx, sy;  //slider x & slider y
  float per;
  
  Slider(){}
  Slider(int x, int y){
    xPos = x;
    yPos = y; 
    sx = xPos - 13;
    sy = yPos + 120;
  }
  
  void display(){
    noStroke();
    fill(0,0,195);
    rect(xPos, yPos, 15, 240);  //Bar to slide on
    stroke(0);
    strokeWeight(3);
    fill(0,0,124);
    rect(sx, sy, 40, 20);
    
  }
  
  void checkMouse(){
    if(mouseX >= sx && mouseX <= sx + 40 && mouseY >= sy && mouseY <= sy + 20 && mousePressed){
      cursor(HAND);
      pressed = true;
    } 
  }
  
  void setY(){
    sy = mouseY;
    if(sy > (yPos + 230)){
      sy = (yPos + 230);
    }
    if(sy < (yPos + -5)){
      sy = (yPos + -5);
    }
  }
  
  void release(){
    pressed = false;
  }
  
  boolean isPress(){
    return pressed;
  }
  
  float getPer(){
    per = (sy - yPos + 5)/235.0;
    return per;
  }

}
