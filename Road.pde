class Road{
  int roadX ;
  Road(){
    roadX = 0 ;
  }
  
  void display(){  
   image( roadImg , roadX , ROAD_POS_Y);
  }
  
  void update(){
    roadX -= bgSpeed*2 ;
    if( roadX <= -960 ){ roadX = 0 ;}
  }

}
