class CityFront{
  int bgX ;
  CityFront(){
  }
  
  void display(){
  
    image( cityFrontImg , bgX , 480 );
    
  }

  void update(){
  
    bgX -= bgSpeed*2;
    if( bgX <= -960 ){ bgX = 0 ;}
  
  }


}
