class A_Uncle{
  
  int uncleX, uncleY, uncleW, uncleH;
  int frameCountNow ;
  PImage img;
  
  A_Uncle(){
    uncleX = 160;
    uncleY = 320;
    uncleW = 60;
    uncleH = 80;
    img = A_uncle;
  }
  
  void boundryLimit(){
    if(uncleY <= 240 ){ uncleY = 240 ;}
    if(uncleY >= 400 ){ uncleY = 400 ;}
  }

  void display(){
    image( A_uncle , uncleX , uncleY , uncleW , uncleH );
  }
  
  //void update(){
  //  frameCountNow = frameCount ;
  //  uncleX += uncleSpeed ;
  //  if(frameCountNow % 60 = 0){
    
  //  };
    
    
  //}

}
