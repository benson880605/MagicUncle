class SpecialFood{

  int specialFoodX ;
  int specialFoodY ;
  int foodSize = 60;
  int frameCountNow ;
  PImage img;
  SpecialFood(){
    specialFoodX = 5000 + ROAD_HEIGHT * floor(random(12)); 
    specialFoodY = ROAD_POS_Y + ROAD_HEIGHT * floor(random(3));
    img = specialFoodImg;
  }
  
  void display(){
    image(specialFoodImg , specialFoodX , specialFoodY , foodSize , foodSize );
  }
  
  void update(){
    specialFoodX -= bgSpeed*2 ;
    if( specialFoodX < 0 && bgSpeed < 10 ) { 
    specialFoodX = 1440 + 960 + ROAD_HEIGHT * floor(random(12)); 
    specialFoodY = ROAD_POS_Y + ROAD_HEIGHT * floor(random(3));
    }
  }

  void checkCollision(){
      if(A_isHit( magicA_Uncle.uncleX , magicA_Uncle.uncleY+20 , magicA_Uncle.uncleW , magicA_Uncle.uncleH , specialFoodX , specialFoodY , foodSize , foodSize )){
        specialFoodY = 1000 ;
        bgSpeed *= 3;
        frameCountNow = frameCount ;
        TranSpecialFood = true;
        
      } 
      
      if( frameCount >= frameCountNow + 60 * 7 ){
        bgSpeed = INIT_BGSPEED ;
        TranSpecialFood = false;
      }
      
  }
  
}
