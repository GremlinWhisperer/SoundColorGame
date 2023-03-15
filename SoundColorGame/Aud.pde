class Aud{
//This class will store audio information
  float size, wet, damp, rate;
    
Aud(){  //basic constructor, randomizes info
  size = random(0.3, 0.7);  //0 - 1
  wet = random(0.3, 0.7);  //Maximum is 1, minimum is 0;
  damp = random(0.3, 0.7); // 0 - 1
  rate = random(0.5, 1.25);  //Maximum is technically infinity, but we won't scale above 3.
}  

void setRev(){  //uses class values to set the reverb

}





}
