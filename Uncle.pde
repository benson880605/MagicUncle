class A_Uncle{
  
  float uncleX, uncleY, uncleW, uncleH , baseUncleY , realUncleH ;
  int frameCountNow ;
  PImage img;
  
  A_Uncle(){
    uncleX = 160;
    uncleY = 320;
    uncleW = 60;
    uncleH = 80;
    realUncleH = 10 ;
    baseUncleY = 320 ;
    img = A_uncle;
  }
  
  void boundryLimit(){
    if(uncleY <= 240 ){ uncleY = 240 ; baseUncleY = 240 ;}
    if(uncleY >= 400 ){ uncleY = 400 ; baseUncleY = 320 ; }
  }

  void display(){
    image( A_uncle , uncleX , uncleY , uncleW , uncleH );
  }
  
  void update(){
    uncleY = baseUncleY + 6*sin(frameCount/5);
  }

}
