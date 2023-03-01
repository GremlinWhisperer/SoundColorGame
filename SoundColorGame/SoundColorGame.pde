int r;
int b;
int g;
int x;
int y;
int z;
int v=0;
boolean t=false;

void setup(){
  size(800,800);
  r=int(random(0,255));
  g=int(random(0,255));
  b=int(random(0,255));
  background(r,g,b);
}

void draw(){
  start();
  
  COMP();

  fill(x,y,z);
  
  square(750,750,50);
  square(650,750,50);
  square(550,750,50);
  square(450,750,50);
  square(350,750,50);
  square(250,750,50);
  
}
  
  void COMP(){
    if (x<=r+30 && x>=r-30 && z<=b+30 && z>=b-30 && y<=g+20 && y>=g-20){
    v=3;
    }
    if (v==3){
      r=int(random(0,255));
      g=int(random(0,255));
      b=int(random(0,255));
      while (x<=r+20 && x>=r-20 && z<=b+20 && z>=b-20 && y<=g+20 && y>=g-20){
      r=int(random(0,255));
      }
      x=0;
      y=0;
      z=0;
      t=false;
  background(r,g,b);
  v=0;
  text("Yay!", width/2, height/2);
    }
      
  }
  void start(){
  if(mousePressed && mouseButton==LEFT){
   t=true;
 }
  if(t){  
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
  }
  
void mousePressed(){
 if(mousePressed && mouseButton==RIGHT){
   t=false;
 }
}
void keyPressed(){
  if (key=='y'){
    print(r,g,b);
  }
  if (key=='p'){
    print(x,y,z);
  }
  if (key=='g'){
    x=0;
    y=0;
    z=0;
  }
}
