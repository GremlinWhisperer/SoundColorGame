int s1x, s1y, s2y, nul, mx1, my1, d1;  //Tracks slider info
boolean s1p = false, s2p = false;  //slide#pressed
int r;
int b;
int g;
int x;
int y;
int z;
int v=0;
boolean o=false;

void setup(){
  size(800,800);
  r=int(random(0,255));
  g=int(random(0,255));
  b=int(random(0,255));
}

void draw(){
  background(r,g,b);
  checkMouse();
  
  slideOne();
  slideTwo();
  
  start();
  
  COMP();

  fill(x,y,z);//Comparison box colors
  
  square(750,750,50);
  square(650,750,50);
  square(550,750,50);
  square(450,750,50);
  square(350,750,50);
  square(250,750,50);
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

void COMP(){//checks for matches
    if (x<=r+30 && x>=r-30 && z<=b+30 && z>=b-30 && y<=g+20 && y>=g-20){
    v=3;
    }
    if (v==3){
      r=int(random(0,255));
      g=int(random(0,255));
      b=int(random(0,255));
      while (x<=r+20 && x>=r-20 && z<=b+20 && z>=b-20 && y<=g+20 && y>=g-20){
      r=int(random(0,255));
      g=int(random(0,255));
      b=int(random(0,255));
      }//tries to prevent double colors
      x=0;
      y=0;
      z=0;//sets boxes to black
      o=false;//makes colors stop changing until mousepressed
  background(r,g,b);
  v=0;
  text("Yay!", width/2, height/2);//visual indicator
    }      
  }

  void start(){
  if(mousePressed && mouseButton==LEFT){
   o=true;
 }
  if(o){  
  if (mouseX<=800 && mouseX>=750 && mouseY>=750){
    z++;
  }
  if (mouseX<=700 && mouseX>=650 && mouseY>=750){
    y++;
  }
  if (mouseX<=600 && mouseX>=550 && mouseY>=750){
    x++;
  }
  if (mouseX <=500 && mouseX>=450){
    x--;
  }
   if (mouseX<=400 && mouseX>=350 && mouseY>=750){
     y--;
   }
   if (mouseX<=300 && mouseX>=250 && mouseY>=750){
     z--;
   }
}

if (x>=255){
  x=255;
}
if (x<=0){
  x=0;
}
if (y>=255){
  y=255;
}
if (y<=0){
  y=0;
}
if (z>=255){
  z=255;
}
if (z<=0){
  z=0;
}
  }//general failsafes so you don't get "x=20000" or "y=-1000"

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
  o=false;
}

void mousePressed(){
 if(mousePressed && mouseButton==LEFT){
   o=true;
 }
}
void keyPressed(){
  if (key=='y'){
    print(r,g,b);//prints background color values
  }
  if (key=='p'){
    print(x,y,z);//prints comparison color values
  }
  if (key=='g'){//resets box color
    x=0;
    y=0;
    z=0;
  }
  if (key=='i'){
    r=int(random(0,255));
    g=int(random(0,255));
    b=int(random(0,255));
  }//gets a new color
}
