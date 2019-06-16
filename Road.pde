<<<<<<< HEAD
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
=======
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
>>>>>>> 3fae460cb8d03c912d82ec16d31ac672b9c92bf1
