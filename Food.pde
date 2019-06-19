class Food {
  
  int A_foods[] = new int [12];
  int foodX[] = new int [12];
  int foodCurrentY[] = new int [12];
  int foodSpeedY = 2;
  int foodY[] = new int [12];
  int foodValue[] = new int [12];
  int foodSize = 60;
  PImage img;

  
  Food(){
  
    for(int i = 0 ; i < A_foods.length ; i++ ){
      A_foods[i] = floor(random(2));
      foodX[i] = 960 + ( i * ROAD_HEIGHT*6 ) + ROAD_HEIGHT * floor(random(6));
      foodY[i] = ROAD_POS_Y + ROAD_HEIGHT * floor(random(3));
      foodCurrentY[i] = foodY[i];
    }
  }

  void display(){
  
    for(int i = 0 ; i < A_foods.length ; i ++ ){
    
      int foodType = A_foods[i];
      img = foodImg[foodType];
      if( TranSpecialFood == true ) img = foodImg[0];
      if(img == foodImg[1]){ foodValue[i] = (-40) ; }
      
      if(img == foodImg[0]){ foodValue[i] = 30 ; }
      foodCurrentY[i] = foodY[i];
      image( img , foodX[i] , foodY[i] , 80 , 80 );
      foodX[i] -= bgSpeed*2 ;
      
      if( foodX[i] <= -ROAD_HEIGHT ){
        foodX[i] = ( A_foods.length * ROAD_HEIGHT*6 ) + ROAD_HEIGHT * floor(random(6));
        foodY[i] = ROAD_POS_Y + ROAD_HEIGHT * floor(random(3));
      } 
    }
  }
  
  void checkCollision(){
  
    for(int i = 0 ; i < A_foods.length ; i ++ ){
    
      if(A_isHit( magicA_Uncle.uncleX , magicA_Uncle.uncleY + 40 , magicA_Uncle.uncleW , magicA_Uncle.realUncleH , foodX[i] , foodY[i] , ROAD_HEIGHT , ROAD_HEIGHT )){
        A_fattyUI.fattyValue += foodValue[i];
        foodY[i] = 1000 ;
      }
      
    }
  }
  
  void restart(){
    for(int i = 0 ; i < foodX.length ; i ++ ){
      foodX[i] += 1440 ;
    }
    
  }
}
