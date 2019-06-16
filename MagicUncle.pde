final int A_GAME_RUN = 11, A_GAME_WIN = 12 , A_GAME_LOSE = 13 ;
int gameState ;

A_Uncle magicA_Uncle = new A_Uncle();
FattyUI A_fattyUI = new FattyUI();
Food A_foods = new Food();
CityBack cityBack = new CityBack();
CityFront cityFront = new CityFront();
SpecialFood specialFood = new SpecialFood();
Road road = new Road();

final int ROAD_POS_Y = 260; 
final int ROAD_HEIGHT = 80; 
final int FOOD_VALUE = 20; 

PImage cityBackImg, cityFrontImg , A_uncle , fatty , roadImg , head , win , lose , specialFoodImg ;
PImage foodImg[] = new PImage [2];

PImage fastFood , healthFood;

float bgX = 0 ;
final float INIT_BGSPEED = 5;
float bgSpeed = INIT_BGSPEED ;

boolean A_A_isHit = false;
boolean TranSpecialFood = false;


void setup() {
  
  size(960 ,540);
  noCursor();  //
    
  cityFrontImg = loadImage("img/A_cityFront.png"); 
  cityBackImg = loadImage("img/A_cityBack.png");
  A_uncle = loadImage("img/A_uncle.png"); 
  fatty = loadImage("img/A_fatty.png");
  head = loadImage("img/A_head.png");
  roadImg = loadImage("img/A_road.png");
  foodImg[0] = loadImage("img/A_fastFood1.png");
  foodImg[1] = loadImage("img/A_healthFood1.png");
  specialFoodImg = loadImage("img/A_specialFood.png");
  win = loadImage("img/A_win.png");
  lose = loadImage("img/A_lose.png");
  
  gameState = A_GAME_RUN;
  
}

void draw() {
    
    
  switch(gameState) {
    case A_GAME_RUN:
   
    // city Back
    
    cityBack.display();
    cityBack.update();
    
    //Road
    road.display();
    road.update();
    
    // A_foods
    
    A_foods.display();
    A_foods.checkCollision();
    
    specialFood.display();
    specialFood.checkCollision();
    specialFood.update();
    
    // city Front
    cityFront.display();
    cityFront.update();
    
    // fat UI
    A_fattyUI.display();
    A_fattyUI.update();
    
    
    // uncle
    magicA_Uncle.display();

    
    
    break;
    
    case A_GAME_WIN:
    image( win , 0 , 0 );
    if(mousePressed){
      gameState = A_GAME_RUN ;
      A_fattyUI.fattyValue = A_fattyUI.INIT_FATTY_VALUE;
    
  }
    break;
    
    case A_GAME_LOSE:
    image( lose , 0 , 0 );
    if(mousePressed){
      gameState = A_GAME_RUN ;
      A_fattyUI.fattyValue = A_fattyUI.INIT_FATTY_VALUE;
    
  }
    
    break;
    
}    
}
     void keyPressed() {
  
  // DO NOT REMOVE OR EDIT THE FOLLOWING SWITCH/CASES
  
    switch(keyCode) {
      
      case UP:
        magicA_Uncle.uncleY-= 80;
        magicA_Uncle.boundryLimit();
      break;
      
      case DOWN:
        magicA_Uncle.uncleY+= 80;
        magicA_Uncle.boundryLimit();
      break;
    }
  }

boolean A_isHit(float ax , float ay , float aw , float ah , float bx , float by , float bw , float bh ){
  
    if(ax + aw > bx &&
       ax < bx + bw &&
       ay + ah > by &&
       ay < by + bh){return true;}
    else{return false;}
}
