class CityFront{

  CityFront(){
  }
  
  void display(){
  
    image( cityFrontImg , bgX , 480 );
    
  }

  void update(){
  
    bgX -= bgSpeed/10;
    if( bgX <= -960 ){ bgX = 0 ;}
  
  }


}
