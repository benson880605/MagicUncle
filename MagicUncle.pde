//bubbleVariable//
final int A_GAME_RUN = 11, A_GAME_WIN = 12 , A_GAME_LOSE = 13 , A_GAME_START = 10 , A_GAME_CONV2 = 14 , A_GAME_RUNAWAY = 15 ;
int gameState ;

A_Uncle magicA_Uncle = new A_Uncle();
FattyUI A_fattyUI = new FattyUI();
Food A_foods = new Food();
CityBack cityBack = new CityBack();
CityFront cityFront = new CityFront();
SpecialFood specialFood = new SpecialFood();
Road road = new Road();
Head headImg = new Head();

final int ROAD_POS_Y = 260; 
final int ROAD_HEIGHT = 80; 
final int FOOD_VALUE = 20; 

PImage headUI , A_conv01 , A_conv02 , cityBackImg, cityFrontImg , A_uncle , fatty , roadImg , head , head2 , head3 , head4 , win , lose , specialFoodImg , A_intro01 ;
PImage foodImg[] = new PImage [4];
PImage convImg = A_conv01;

PImage fastFood , healthFood;

float bgX = 0 ;
final float INIT_BGSPEED = 5;
float bgSpeed = INIT_BGSPEED ;

boolean A_A_isHit = false;
boolean TranSpecialFood = false;
//bubbleGameState
final int BUBBLE_GAME_START = 20;
final int BUBBLE_GAME_RUN = 21;
final int BUBBLE_GAME_WIN = 22;
final int BUBBLE_GAME_LOSE = 23;
//int gameState = BUBBLE_GAME_START;
//image
PImage B_background;
PImage B_uncleLeft, B_uncleRight;
PImage bubbleSmall, bubbleLarge;
PImage bubbleDisplay;
PImage B_vegetable;
boolean B_leftState = false;
boolean B_rightState = false;
boolean B_upState = false;
boolean B_accelerate = false;
int B_tableLine=430;
float deadVegetableX1=190,deadVegetableX2=120,deadVegetableX3=50;
float deadVegetableY1=50,deadVegetableY2=50,deadVegetableY3=50;
float deadVegetableS1=50,deadVegetableS2=50,deadVegetableS3=50;
int deadVegetableCount=0;
int B_dropTimer=0;
int B_dropInterval=180;
int B_maxVegetableCount = 5;
float accMana = 100;
int accManaMax = 100;

float B_gameTimer = 1.5*60*60;

Player player;
Vegetable vegetables[];

//cookingGameState
final int COOKING_GAME_START = 30;
final int COOKING_GAME_RUN = 31;
final int COOKING_GAME_WIN = 32;
final int COOKING_GAME_LOSE = 33;

PImage cbackground;
PImage bread, cheese, tomato, onion, ccabbage;
PImage[][]eggImages, steakImages, baconImages;

int itemSize = 132;

//shoot gamestate & variable
PImage D_background6,D_gameover,  D_gamewin;
PImage D_girlImg, D_girlhurtImg,D_uncleImg;
PImage D_carrotImg,D_cabbageImg;
PImage D_hamburgerImg;
PImage D_startImg,D_startbuttomImg,D_restartbuttomImg;

int D_foodNumber = 10;
int D_timer = 5400;
int D_score = 0;
int D_scoreTextSize;
PFont D_font;

Girl magicGirl;
D_Uncle uncle;
D_Food[] foods;
Arrowhead arrowhead;


final int D_GAME_START = 40,D_GAME_RUN = 41,D_GAME_OVER = 42,D_GAME_WIN = 43;


float wordFlowingY;


////////////////////////////////////////////////////////////


void setup() {
  
  size(960 ,540,FX2D);
  noCursor();  //
    
  cityFrontImg = loadImage("img/A_cityFront.png"); 
  cityBackImg = loadImage("img/A_cityBack.png");
  A_uncle = loadImage("img/A_uncle.png"); 
  fatty = loadImage("img/A_fatty.png");
  head = loadImage("img/A_head.png");
  head2 = loadImage("img/A_head2.png");
  head3 = loadImage("img/A_head3.png");
  head4 = loadImage("img/A_head4.png");
  roadImg = loadImage("img/A_road.png");
  foodImg[0] = loadImage("img/A_hamberger.png");
  foodImg[1] = loadImage("img/A_cabbage.png");
  foodImg[2] = loadImage("img/A_hamberger_2.png");
  specialFoodImg = loadImage("img/A_specialFood.png");
  A_intro01 = loadImage("img/A_intro1.png");
  A_conv01 = loadImage("img/A_conv01.png");
  A_conv02 = loadImage("img/A_conv02.png");
  headUI = loadImage("img/headUI.png");
  win = loadImage("img/A_win.png");
  lose = loadImage("img/A_lose.png");
  
  gameState = A_GAME_START;
//bubble_setup//
  //imageMode(CENTER);
  size(960,540);
  B_uncleLeft = loadImage("img/B_uncleLeft.png");
  B_uncleRight = loadImage("img/B_uncleRight.png");
  bubbleSmall = loadImage("img/bubbleSmall.png");
  bubbleLarge = loadImage("img/bubbleLarge.png");
  B_vegetable = loadImage("img/B_cabbage.png");
  B_background = loadImage("img/B_background.png");
  player=new Player();
  frameRate(60);
  
  vegetables = new Vegetable[B_maxVegetableCount];
//bubble_setup//
  
//shoot setup//
    //size(960, 540, P2D);
    //frameRate(60);
    D_background6 = loadImage("img/D_background.png");
    D_gameover = loadImage("img/D_lose.png");
    D_gamewin = loadImage("img/D_win.png");
    D_uncleImg = loadImage("img/D_uncle.png");
    D_girlImg = loadImage("img/girl.png");
    D_carrotImg = loadImage("img/carrot.png");
    D_cabbageImg = loadImage("img/cabbage.png");
    D_hamburgerImg = loadImage("img/hamburger.png");
    D_girlhurtImg = loadImage("img/girlhurt.png");
    D_startImg = loadImage("img/D_start.png");
    D_startbuttomImg = loadImage("img/D_startbuttom.png");
    D_restartbuttomImg = loadImage("img/D_restartbuttom.png");
    
    //font
    D_font = createFont("font/comic.ttf", 54);
    textFont(D_font);
    
    //object
    magicGirl = new Girl(50,50);
    uncle = new D_Uncle(width - 150, height-170);
    arrowhead = new Arrowhead(width - 180, height-120);
    
    wordFlowingY = 5*sin(frameCount/10);
//shoot setup//
  
}

void draw() {
    
    
  switch(gameState) {
//cityrunState//

    case A_GAME_START:
    
    
    // city Back
    
    cityBack.display();
    cityBack.update();
    
    //Road
    road.display();
    road.update();
    
    // fat UI
    A_fattyUI.display();
    
    // uncle
    magicA_Uncle.display();
    magicA_Uncle.update();
    
    // city Front
    cityFront.display();
    cityFront.update();
    
    // head
    headImg.display();
    headImg.update();
    
    
    putBlackBackground();
    image( A_intro01 , 0 , 0 );
    if(keyPressed) gameState = A_GAME_RUN ;
    
    break;
    
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
    A_foods.update();
    
    specialFood.display();
    specialFood.checkCollision();
    specialFood.update();
    
    // uncle
    magicA_Uncle.display();
    magicA_Uncle.update();
    
    // city Front
    cityFront.display();
    cityFront.update();
    
    // head
    headImg.display();
    headImg.update();
    
    // fat UI
    A_fattyUI.display();
    A_fattyUI.update();
    
    
    break;
    
    case A_GAME_WIN:
    
    // city Back
    
    cityBack.display();
    cityBack.update();
    
    //Road
    road.display();
    road.update();
    
    // A_foods
    
    A_foods.display();
    
    specialFood.display();
    specialFood.checkCollision();
    
    // uncle
    magicA_Uncle.display();
    
    // city Front
    cityFront.display();
    cityFront.update();
    
    // head
    headImg.display();
    headImg.update(head4);
    
    // fat UI
    A_fattyUI.display();
    A_fattyUI.update(A_fattyUI.fattyValueWin);
    
    // conv
    image( A_conv01 , 0 , 300 );
    
    if( key == ENTER ){ gameState = A_GAME_RUNAWAY ; }
    
    break;
   
    case A_GAME_RUNAWAY :
    
    // city Back
    
    cityBack.display();
    cityBack.update();
    
    //Road
    road.display();
    road.update();
    
    // A_foods
    
    A_foods.display();
    
    specialFood.display();
    specialFood.checkCollision();
    
    // uncle
    magicA_Uncle.display();
    
    // city Front
    cityFront.display();
    cityFront.update();
    
    // head
    headImg.display();
    headImg.update(head4);
    
    // fat UI
    A_fattyUI.display();
    A_fattyUI.update(A_fattyUI.fattyValueWin);
    
    //
    magicA_Uncle.uncleX += 10 ;
    
    break;
    
    case A_GAME_LOSE:
    
    // city Back
    
    cityBack.display();
    cityBack.update();
    
    //Road
    road.display();
    road.update();
    
    // A_foods
    
    A_foods.display();
    
    specialFood.display();
    
    
    // fat UI
    A_fattyUI.display();    
    
    // uncle
    magicA_Uncle.display();
    magicA_Uncle.update();
    
    // city Front
    cityFront.display();
    cityFront.update();
    
    // head
    headImg.display();
    headImg.update();
    
    putBlackBackground();
    image( lose , 0 , 0 );
    
    if(mousePressed){
      gameState = A_GAME_RUN ;
      A_fattyUI.fattyValue = A_fattyUI.INIT_FATTY_VALUE;
     }
         
    break;
//cityrunState//
    
//bubbleState//
    case BUBBLE_GAME_START:
    rect(0,0,50,50);
    
    break;
    
    case BUBBLE_GAME_RUN:
    imageMode(CENTER);
    bubbleDisplay = (player.bubbleSize>70)?bubbleLarge:bubbleSmall;
    background(200,240,250);
    //tableLine
    line(0,B_tableLine,960,B_tableLine);
    //life & deadVegetable
    image(B_vegetable,deadVegetableX1,deadVegetableY1,deadVegetableS1,deadVegetableS1);
    image(B_vegetable,deadVegetableX2,deadVegetableY2,deadVegetableS2,deadVegetableS2);
    image(B_vegetable,deadVegetableX3,deadVegetableY3,deadVegetableS3,deadVegetableS3);
    //image(background,width/2,height/2,width,height);
  
    //gameTimer
    B_gameTimer--;
    float B_timeCount = map(B_gameTimer,0,2*50*60,0,width);
    rectMode(CORNERS);
    strokeWeight(1);
    stroke(#754F44);
    fill(#FDD692);
    rect(0,530,B_timeCount,540);
    
    //accelerate
    if(accMana<=accManaMax){
      accMana++;
    }
      if(B_accelerate&&accMana>=0){
        accMana-=6;
      }
      fill(230,200,220);
      rect(0,500,accMana,510);
    
    //drop vegetable
      B_dropTimer++;
    if(B_dropTimer >= B_dropInterval){
      B_dropTimer = 0;
      drop();
    }
    
    for(int i = 0; i < vegetables.length; i++){
      if(vegetables[i] != null && vegetables[i].isAlive){
        vegetables[i].move();
        vegetables[i].display();
        
      }
    }
    //player
    player.update();
    for(int i = 0; i < player.bubbles.length; i++){
      if(player.bubbles[i]==null||!player.bubbles[i].isAlive){
        //blowing bubble animation
        if(B_upState){
          image(bubbleDisplay,player.x,player.y,player.bubbleSize,player.bubbleSize);
        }
       break;  
      } 
    }
  
  
  
  //liftStrength  
    for(int j = 0; j < vegetables.length; j++){
      if(vegetables[j]!=null){
        vegetables[j].liftStr=lerp(vegetables[j].liftStr,0,0.2); 
      }
    }
  
  //bubble & vegetables interaction  
    for(int i = 0; i < player.bubbles.length; i++){
      for(int j = 0; j < vegetables.length; j++){
        if(player.bubbles[i]!=null && vegetables[j]!=null && B_isHit(player.bubbles[i].x,player.bubbles[i].y,vegetables[j].x,vegetables[j].y,player.bubbles[i].size/2,vegetables[j].size/2)
        &&vegetables[j].isAlive&&!vegetables[j].wraped &&  !player.bubbles[i].wrap){
          if(vegetables[j].size>player.bubbles[i].size){
            vegetables[j].lift(map((vegetables[j].size-player.bubbles[i].size),0,vegetables[j].size,vegetables[j].speed*20,0));
            player.bubbles[i].isAlive=false;
            player.bubbles[i].x=-100;
          }
          if(player.bubbles[i].size>=vegetables[j].size && !vegetables[j].wraped && !player.bubbles[i].wrap){
           //player.bubbles[i].x=lerp(vegetables[j].x,player.bubbles[i].x,0.6);
           //player.bubbles[i].y=lerp(vegetables[j].y,player.bubbles[i].y,0.6);
           player.bubbles[i].targetX=vegetables[j].x;
           player.bubbles[i].targetY=vegetables[j].y;
           vegetables[j].speed=-player.bubbles[i].speed;   
           vegetables[j].wraped=true;
           player.bubbles[i].wrap=true;
          }  
  
        }  
        
      }        
    }  
    for(int i = 0;i<player.bubbles.length;i++){
      if(player.bubbles[i]==null){break;}
      if(player.bubbles[i].wrap){
           player.bubbles[i].x=lerp(player.bubbles[i].targetX,player.bubbles[i].x,0.6);
           player.bubbles[i].y=lerp(player.bubbles[i].targetY,player.bubbles[i].y,0.6); 
           player.bubbles[i].targetY-=player.bubbles[i].speed;
      }
    }
    break;
    
    case BUBBLE_GAME_WIN:
    
    break;
    
    case BUBBLE_GAME_LOSE:
    rect(50,50,width-50,height-50);
    break;
//bubbleState//
    
//shootState//
    case D_GAME_START:
    imageMode(CORNER);
    image(D_background6,0,0,960,540);
    image(D_girlImg,50,50,106,116);
    image(D_uncleImg,width - 150, height-170,100,100);
    putBlackBackground();
    image(D_startImg,0,0,960,540);
    image(D_startbuttomImg,0,5*sin(frameCount/10),960,540);
    magicGirl.health = 100;
    D_timer = 5400;
    break;
    
    case D_GAME_RUN:
    // background
    image(D_background6,0,0,960,540);
    
    //uncle
    uncle.display();
    uncle.update();
    
    // Time UI
    textAlign(LEFT, BOTTOM);
    String timeString = D_convertFrameToTimeString(D_timer);
    fill(255);
    text(timeString, 5, height);
    
    // Health UI
    textAlign(LEFT, BOTTOM);
    pushStyle();
    textSize(36);
    fill(255);
    text("HP:"+magicGirl.health, 200, height-10);
    popStyle();

    //time
    D_timer --;
    if(D_timer <= 0) gameState = D_GAME_OVER;
    
    //girl
    magicGirl.display();
    if(D_timer % 600 == 0){
    magicGirl.summon();
    }
        
    // arrowHead
    arrowhead.display();
    
    if(magicGirl.health<=0){
      gameState = D_GAME_WIN;
    }
    if(D_timer == 0 && magicGirl.health > 0){
      gameState = D_GAME_OVER;
    }
    
    break;
    
    case D_GAME_WIN:
    image(D_gamewin,0,0,960,540);
    break;
    
    case D_GAME_OVER:
    putBlackBackground();
    image(D_gameover,0,0,960,540);
    image(D_restartbuttomImg,0,5*sin(frameCount/10),960,540);
    break;
    
//shootState//
    
}    
}
     void keyPressed() {
   switch(keyCode) {
      //jump to specific stage//
      case '1':
      gameState=A_GAME_RUN;
      break;
      case '2':
      gameState=A_GAME_WIN;
      break;
      case '3':
      gameState=A_GAME_LOSE;
      break;      
      case '4':
      gameState=BUBBLE_GAME_START;
      break; 
      case '5':
      gameState=D_GAME_START;
      break; 
      case '6':
      gameState=BUBBLE_GAME_WIN;
      break; 
      case '7':
      gameState=BUBBLE_GAME_LOSE;
      break; 
      case '8':
      gameState=COOKING_GAME_START;
      break; 
      case '9':
      gameState=COOKING_GAME_RUN;
      break; 
      case '0':
      gameState=COOKING_GAME_WIN;
      break; 
      //case 'a':
      //gameState=COOKING_GAME_LOSE;
      //break;
      //case 'b':
      //gameState=D_GAME_START;
      //break;
      //case 'c':
      //gameState=D_GAME_RUN;
      //break;
      //case 'd':
      //gameState=D_GAME_WIN;
      //break;
      //case 'e':
      //gameState=D_GAME_OVER;
      //break;
      
      //jump to specific stage//
      
      //case DOWN:
      //  magicA_Uncle.uncleY+= 80;
      //  magicA_Uncle.boundryLimit();
      //break;
    }
     //switch(key){
     // case 'a':
     // gameState=COOKING_GAME_LOSE;
     // break;
     // case 'b':
     // gameState=D_GAME_START;
     // break;
     // case 'c':
     // gameState=D_GAME_RUN;
     // break;
     // case 'd':
     // gameState=D_GAME_WIN;
     // break;
     // case 'e':
     // gameState=D_GAME_OVER;
     // break;
     //}

  // DO NOT REMOVE OR EDIT THE FOLLOWING SWITCH/CASES
  switch(gameState){
    case A_GAME_RUN:
    switch(keyCode) {
      
      case UP:
        magicA_Uncle.uncleY-= 80;
        magicA_Uncle.baseUncleY -= 80 ;
        magicA_Uncle.boundryLimit();
      break;
      
      case DOWN:
        magicA_Uncle.uncleY+= 80;
        magicA_Uncle.boundryLimit();
        magicA_Uncle.baseUncleY += 80 ;
      break;
    }
    break;
    
    //case A_GAME_WIN:
    //gameState=BUBBLE_GAME_START;
    //break;
//BubbleState//
    case BUBBLE_GAME_START:
    gameState=BUBBLE_GAME_RUN;  
    break;
    
    case BUBBLE_GAME_RUN:
    if(key==CODED){
    switch(keyCode){
      case LEFT:
      B_leftState = true;
      break;
      case RIGHT:
      B_rightState = true;
      break;
      case UP:
      player.blow();
      B_upState = true;          
      break;
      case SHIFT:
      B_accelerate = true;
      break;
      
    case BUBBLE_GAME_WIN:
  
    break;
  
    case BUBBLE_GAME_LOSE:
  
    break;
//BubbleState//
    }
  }
  //shootState//
  
  }
     }
     
     
void keyReleased(){
  switch(gameState){
    case BUBBLE_GAME_RUN:
  if(key==CODED){
    switch(keyCode){
      case LEFT:
      B_leftState = false;
      break;
      case RIGHT:
      B_rightState = false;
      break;
      case UP:
      player.fire();
      B_upState = false;  
      break;
      case SHIFT:
      B_accelerate = false;
      break;
    }
  }
  break;
  
//shootState//
  case D_GAME_START:
    switch(key){
      case ENTER:
      gameState = D_GAME_RUN;
      break;
    }
    break;
    case D_GAME_RUN:
    switch(key){
      case ENTER:
      uncle.fire();
      break;
    }
    break;
    case D_GAME_OVER:
    switch(key){
      case ENTER:
      magicGirl.health = 100;
      D_timer = 5400;
      gameState = D_GAME_RUN;
      break;
    }
    break;
//shootState//

  //add other game here
  //case :
  
  //break;
}
}

//shoot function//
void mouseReleased(){
  switch(gameState){
    case D_GAME_RUN:
    uncle.fire();
    break;
  }
}
//shoot function//

//bubble_function//
void drop(){
    for(int i = 0; i < vegetables.length; i++){
    if(vegetables[i] == null || !vegetables[i].isAlive){
      float x =random(30,930);
      float y = -50;
      float size = random(40,130);
      //float size = 130;
      float speed = map(size,40,130,0.6,3.5);
      vegetables[i] = new Vegetable(x,y,size,speed);
      break;
    }
  }
}

boolean B_isHit(float ax,float ay,float bx,float by, float ar,float br){
  float catchRange=ar+br;
  boolean missile;
  return dist(ax,ay,bx,by)<=catchRange;
}
//bubble_function//
boolean A_isHit(float ax , float ay , float aw , float ah , float bx , float by , float bw , float bh ){
  
    if(ax + aw > bx &&
       ax < bx + bw &&
       ay + ah > by &&
       ay < by + bh){return true;}
    else{return false;}
}

//shoot function//
boolean D_isHit(float ax, float ay, float aw, float ah, float bx, float by, float bw, float bh){
  return  ax + aw > bx &&    // a right edge past b left
        ax < bx + bw &&    // a left edge past b right
        ay + ah > by &&    // a top edge past b bottom
        ay < by + bh;
}

String D_convertFrameToTimeString(int frames){
  String result = "";
  float totalSeconds = float(frames) / 60;
  result += nf(floor(totalSeconds/60), 2);
  result += ":";
  result += nf(floor(totalSeconds%60), 2);
  return result;
}

void putBlackBackground(){

  fill(0 , 200 );
  rect( 0 , 0 , width , height);
  
}
//shoot function//
