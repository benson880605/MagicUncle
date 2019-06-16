class CityBack{
  
  CityBack(){
  }
  
  void display(){
    image( cityBackImg , bgX , 0 );
  }
  
  void update(){
  
    bgX -= bgSpeed/10;
    if( bgX <= -960 ){ bgX = 0 ;}
    
  }



}
