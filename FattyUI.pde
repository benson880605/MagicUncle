class FattyUI{
  
  final int INIT_FATTY_VALUE = 550;
  float fattyValue;
  float fattyValueX , fattyValueY , fattyValueH;
  float fattyUpdateValue = 0.5 ;
  float fattyValueWin = 800 ;
  
  FattyUI(){
    fattyValueX = 100;
    fattyValueY = 75;
    fattyValueH = 40;
    fattyValue = INIT_FATTY_VALUE;
    
  }
  
  void display(){
    noStroke();
    fill(255,199,74);
    rect(fattyValueX , fattyValueY , fattyValue , fattyValueH );
  }
  
  void update(){
    fattyValue -= fattyUpdateValue ;
    if(fattyValue <= 0) {
      for(int i = 0 ; i < A_foods.A_foods.length ; i ++){
        A_foods.A_foods[i] = floor(random(2));
        A_foods.foodX[i] = 960 + ( i * ROAD_HEIGHT*6 ) + ROAD_HEIGHT * floor(random(6));
        A_foods.foodY[i] = ROAD_POS_Y + ROAD_HEIGHT * floor(random(3));
      }
      gameState = A_GAME_LOSE ;
    }
    if(fattyValue >= fattyValueWin) gameState = A_GAME_WIN ;
  }
  

}
