//video//
import processing.video.*;  
Movie movieStart,hitByCabbage,meetGirl,last;              
PImage runHover,movieEnd,restartButtun;
final int Movie_Start = 0;
final int Movie_End = 1;
final int AtoB = 2;
final int Ending = 3;


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

PImage intros[] = new PImage [4] ;
int introsNbr = 0 ;

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
PImage B_lose,restart;
PImage []B_intro;
int introNum=0;
PImage []B_conversation;
int conNum=0;
PImage B_Enter;
PImage B_background;
PImage B_skillIcon;
PImage B_uncleStandard_R,B_uncleStandard_L,B_uncleFlying_R,B_uncleFlying_L,B_uncleBlowing_R,B_uncleBlowing_L,B_uncleCasting_R,B_uncleCasting_L;
PImage bubbleSmall, bubbleLarge;
PImage bubbleDisplay;
PImage B_vegetable,B_vegetableFreeze;

boolean B_faceR = false;
int castingTimer = 0;
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
int B_maxVegetableCount = 10;
//skill
boolean missile = false;
float mana = 100;
int manaMax = 150;
int manaWeakTimer =0;
int freezeTimer=0;
int freezeCoolDown=15*60;
int missileCoolDown=10*60;
//skill

float B_gameTimer = 1.5*60*60;

Player player;
Vegetable vegetables[];


////////////////////////////////////////////////////////////

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
PImage D_background6,D_gameover, D_gamewin;
PImage D_girlImg, D_girlhurtImg,D_uncleImg;
PImage D_carrotImg,D_cabbageImg;
PImage D_hamburgerImg;
PImage D_conv;

PImage D_starts[] = new PImage [3];
int startsNbr = 0;

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
  
  size(960 ,540, FX2D);
  noCursor(); 
  
   //video
  frameRate(30);
  movieStart = new Movie(this,"Comp 1234.mov");
  hitByCabbage = new Movie(this,"Hit.mov");
  meetGirl = new Movie(this,"meet MagicGirl (Converted).mov");
  last = new Movie(this,"last.mov");
  
  
  
  meetGirl.play();
  
  
  runHover = loadImage("img/runhover.png");
  movieEnd = loadImage("img/movieEnd.png");
  //
    
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
  for(int i = 0 ; i < intros.length ; i ++){
    intros[i] = loadImage( "img/A_intro" +i+ ".png");
  }
  
  gameState = Movie_Start;
  //bubble_setup//


  B_uncleStandard_L = loadImage("img/B_uncleStandard_L.png");
  B_uncleStandard_R = loadImage("img/B_uncleStandard_R.png");
  B_uncleFlying_L = loadImage("img/B_uncleFlying_L.png");
  B_uncleFlying_R = loadImage("img/B_uncleFlying_R.png");
  B_uncleBlowing_L = loadImage("img/B_uncleBlowing_L.png");
  B_uncleBlowing_R = loadImage("img/B_uncleBlowing_R.png");
  B_uncleCasting_L = loadImage("img/B_uncleCasting_L.png");
  B_uncleCasting_R = loadImage("img/B_uncleCasting_R.png");
  bubbleSmall = loadImage("img/bubbleSmall.png");
  bubbleLarge = loadImage("img/bubbleLarge.png");
  B_vegetable = loadImage("img/B_cabbage.png");
  B_vegetableFreeze = loadImage("img/B_cabbageFreeze.png");
  B_background = loadImage("img/B_background.png");
  B_skillIcon = loadImage("img/B_skillIcon.png");
  lose = loadImage("img/lose.png");
  restart = loadImage("img/restart.png");
  B_Enter =loadImage("img/B_Enter.png");
  B_intro = new PImage[5];
  for(int i = 0;i<5;i++){
   B_intro[i]=loadImage("img/B_intro"+(i+1)+".png"); 
  }
  B_conversation = new PImage[2];
  B_conversation[0]= loadImage("img/B_Conversation1.png");
  B_conversation[1] = loadImage("img/B_Conversation2.png");
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
    D_conv = loadImage("img/D_Conversation.png");
    for(int i = 0 ; i < D_starts.length ; i ++){
      D_starts[i] = loadImage( "img/D_start" +i+ ".png");
    }
    
    //font
    D_font = createFont("font/jackeyfont.ttf", 54);
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
    // video  //
    case Movie_Start:
    if (movieStart.available()) {movieStart.read();}
      movieStart.play();
      image(movieStart, 0, 0, width, height);
      float md = movieStart.duration();
      float mt = movieStart.time();
      if(mt == md){gameState = Movie_End;} 
      break;
      
      case Movie_End:
      if(mouseX > 392 && mouseY >409 && mouseX < 598 && mouseY < 483){
      image(runHover,0,0);
      if(mousePressed){gameState = A_GAME_START;}
      }else{image(movieEnd,0,0,960,540);}
      break;
 
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
    image( intros[introsNbr] , 0 , 0 );
    
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
    
    if( magicA_Uncle.uncleX > width  ){
      gameState = AtoB;
    }
    
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
         
    break;
    
    case AtoB:
      if (hitByCabbage.available()) {hitByCabbage.read();}
      hitByCabbage.play();
      image(hitByCabbage, 0, 0, width, height);
      float mdS = hitByCabbage.duration();
      float mtS = hitByCabbage.time();
      if(mtS == mdS){gameState = BUBBLE_GAME_START;} 
      break;
//cityrunState//
    
    //bubbleState//
    case BUBBLE_GAME_START:
    imageMode(CENTER);
    image(B_background,width/2,height/2,width,height);
    image(B_intro[introNum],width/2,height/2,width,height);
    if(introNum<3){
    tint(255,80+30*sin(frameCount/10));
    image(B_Enter,width/2,height/2,width,height);
    tint(255,255);          
    }
    
    break;
    
    case BUBBLE_GAME_RUN:
    imageMode(CENTER);
    image(B_skillIcon,width/2,height/2,width,height);
    
    fill(80,180);
    noStroke();
    rect(80,485-map(freezeCoolDown,0,15*60,0,35),130,485);
    rect(150,485-map(missileCoolDown,0,20*60,0,35),200,485);
    
    image(B_background,width/2,height/2,width,height);
    bubbleDisplay = (player.bubbleSize>70)?bubbleLarge:bubbleSmall;
    //background(200,240,250);
    //tableLine
    //line(0,B_tableLine,960,B_tableLine);
    //life & deadVegetable
    image(B_vegetable,deadVegetableX1,deadVegetableY1,deadVegetableS1,deadVegetableS1);
    image(B_vegetable,deadVegetableX2,deadVegetableY2,deadVegetableS2,deadVegetableS2);
    image(B_vegetable,deadVegetableX3,deadVegetableY3,deadVegetableS3,deadVegetableS3);
    if(deadVegetableY3>100){gameState=BUBBLE_GAME_LOSE;}

  //gameTimer
  B_gameTimer--;
  float B_timeCount = map(B_gameTimer,0,1.5*60*60,0,width);
  rectMode(CORNERS);
  strokeWeight(1);
  stroke(#754F44);
  if(B_gameTimer<=30*60){
    B_dropInterval=140;
    fill(#E53A40);
  }else{
  fill(#FDD692);
  }
  rect(0,530,B_timeCount,540);
  
  castingTimer--;
  //mana
  if(manaWeakTimer>=0){
    manaWeakTimer--;}
  if(mana<=manaMax){
    if(manaWeakTimer>=0){
      mana+=0.1;}else{
    mana+=0.5;}
  }
    if(B_accelerate&&mana>=0){
      costMana(6);
    }
    if(manaWeakTimer>=0){
      fill(180);}else{
    fill(230,200,220);}
    rect(0,500,mana*1.3,510);
  //freeze
  if(freezeTimer>0){freezeTimer--;}
  if(freezeCoolDown>0){freezeCoolDown--;}
  if(missileCoolDown>0){missileCoolDown--;}
  //drop vegetable
  if(freezeTimer==0){B_dropTimer++;}
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
//freeze
for(int i = 0; i < vegetables.length;i++){
  if(freezeTimer>0&&vegetables[i]!=null&&vegetables[i].isAlive&&!vegetables[i].wraped){
    vegetables[i].speed=0;
  }
      if(freezeTimer==0&&vegetables[i]!=null&&vegetables[i].isAlive&&!vegetables[i].wraped){
      vegetables[i].speed = map(vegetables[i].size,40,130,0.6,3.5);
    }
}
//bubble & vegetables interaction  
  for(int i = 0; i < player.bubbles.length; i++){
    for(int j = 0; j < vegetables.length; j++){
      if(player.bubbles[i]!=null && vegetables[j]!=null && B_isHit(player.bubbles[i].x,player.bubbles[i].y,vegetables[j].x,vegetables[j].y,player.bubbles[i].size/2,vegetables[j].size/2)
      &&vegetables[j].isAlive&&!vegetables[j].wraped &&  !player.bubbles[i].wrap){
        if(vegetables[j].size>player.bubbles[i].size){
          if(vegetables[j].speed==0){
            vegetables[j].lift(map((vegetables[j].size-player.bubbles[i].size),0,vegetables[j].size,20,0));
          }else{
            vegetables[j].lift(map((vegetables[j].size-player.bubbles[i].size),0,vegetables[j].size,vegetables[j].speed*20,0));
          }
          player.bubbles[i].isAlive=false;
          player.bubbles[i].x=-100;
        }
        if(player.bubbles[i].size>=vegetables[j].size && !vegetables[j].wraped && !player.bubbles[i].wrap){
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
  
  if(B_gameTimer<=0){gameState=BUBBLE_GAME_WIN;}
    break;
    
    case BUBBLE_GAME_WIN:
    image(B_background,width/2,height/2,width,height);
    player.update();
    image(B_conversation[conNum],width/2,420,width,240);

      
    

    break;
    
    case BUBBLE_GAME_LOSE:
    image(B_background,width/2,height/2,width,height);
    player.update();
    image(lose,width/2,height/2,width,height);
    tint(255,80+30*sin(frameCount/10));
    image(restart,width/2,height/2,width,height);
    tint(255,255);
    
    break;
    //bubbleState//
    
//shootState//
    case D_GAME_START:
    imageMode(CORNER);
    image(D_background6,0,0,960,540);
    image(D_girlImg,50,50,106,116);
    image(D_uncleImg,width - 150, height-170,100,100);
    putBlackBackground();
    image(D_starts[startsNbr],0,0,960,540);
    tint(255,80+30*sin(frameCount/10));
    image(B_Enter,0,0,width,height);
    tint(255,255); 
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
    imageMode(CORNER);
    image(D_background6,0,0,960,540);
    magicGirl.update();
    //image(D_girlhurtImg,50,50,106,116);
    image(D_uncleImg,width - 150, height-170,100,100);
    image(D_conv , 0 , 300 , 960 , 240 );
     
    break;
    
    case D_GAME_OVER:
    image(D_background6,0,0,960,540);
    image(D_girlImg,50,50,106,116);
    image(D_uncleImg,width - 150, height-170,100,100);
    putBlackBackground();
    image(D_gameover,0,0,960,540);
    tint(255,80+30*sin(frameCount/10));
    image(restart,0,0,width,height);
    tint(255,255);
    break;
    
//shootState//

//last video//
    case Ending:
    if (last.available()) {last.read();}
    last.play();
    image(last, 0, 0, width, height);
    break;
    
    
}    
}
     void keyPressed() {
   switch(keyCode) {
      //jump to specific stage//
      case '1':
      gameState=A_GAME_START;
      break;
      case '2':
      gameState=A_GAME_RUNAWAY;
      break;
      case '3':
      gameState=A_GAME_LOSE;
      break;      
      case '4':
      gameState=BUBBLE_GAME_START;
      break; 
      case '5':
      startsNbr = 0;
      gameState=D_GAME_START;
      break; 
      case '6':
      gameState=BUBBLE_GAME_WIN;
      break; 
      case '7':
      gameState=D_GAME_WIN;
      break; 
      case '8':
      gameState=COOKING_GAME_START;
      break; 
      case '9':
      gameState=COOKING_GAME_RUN;
      break; 
      case '0':
      gameState=A_GAME_START;
      break; 
      
      case ENTER:
      if( gameState == A_GAME_START){
       introsNbr ++ ;
       if(introsNbr == 4 && key == ENTER ) gameState = A_GAME_RUN ;
     }
       if(gameState == A_GAME_LOSE){
         gameState = A_GAME_RUN ;
         A_fattyUI.fattyValue = A_fattyUI.INIT_FATTY_VALUE;
         specialFood.specialFoodX += width ;
         A_foods.restart();
       }
       
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
  if(key==ENTER){
    if(introNum<4){
  introNum++;}else
    {gameState=BUBBLE_GAME_RUN;
    }  
  }
    break;
    
  case BUBBLE_GAME_RUN:
  if(key==CODED){
    switch(keyCode){
      case LEFT:
      B_leftState = true;
      B_faceR = false;
      break;
      case RIGHT:
      B_rightState = true;
      B_faceR = true;
      break;
      case UP:
      player.blow();
      B_upState = true;          
      break;
      case SHIFT:
      B_accelerate = true;
      break;
    }
  }
   if(key=='a'||key=='A'){
     if(mana>=130&&missileCoolDown==0){
       castingTimer = 60;  
       manaWeakTimer=5*60;
       costMana(130);
       missile=true;    
       missileCoolDown=20*60;
       for(int i = 0;i<player.bubbles.length;i++){       
         if(player.bubbles[i]==null){break;}
           player.bubbles[i].bubbleDisplay=bubbleLarge;
           player.bubbles[i].size=130; 
         }
       }

   }
   if(key=='f'||key=='F'){
     if(freezeCoolDown==0){
     castingTimer = 60;
     freezeTimer=250;
     freezeCoolDown = 15*60;
     }
   }
      if(key=='t'||key=='T'){

      B_gameTimer-=5*60;
     
   }
  break;
    case BUBBLE_GAME_WIN:
  if(key==ENTER){
    if(conNum<1){
    conNum++;}else{gameState=BUBBLE_GAME_START;}
  }
  break;
  
  case BUBBLE_GAME_LOSE:
  if(key==ENTER){
  B_initGame();
  gameState=BUBBLE_GAME_RUN;  
  }
  break;
//BubbleState//

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
   if(key=='a'||key=='A'){
     missile=false;
     

   }
  break;
  
//shootState//
  case D_GAME_START:
    switch(key){
      case ENTER:
      startsNbr++;
      if(startsNbr == 3 && key == ENTER){
        gameState = D_GAME_RUN;
      }
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
    case D_GAME_WIN:
    switch(key){
      case ENTER:
      gameState = Ending;
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
float catchRange;
  if(missile){
    catchRange=width;
  }else{
  catchRange=ar+br;
  }
  

  return dist(ax,ay,bx,by)<=catchRange;
}

void B_initGame(){
  deadVegetableX1=190; deadVegetableX2=120;deadVegetableX3=50;
  deadVegetableY1=50; deadVegetableY2=50;deadVegetableY3=50;
  deadVegetableS1=50; deadVegetableS2=50;deadVegetableS3=50;
  deadVegetableCount=0;
  freezeCoolDown=15*60;
  missileCoolDown=10*60;
  B_gameTimer=1.5*60*60;
  B_dropInterval=180;
  
  for(int i = 0; i < vegetables.length; i++){
    if(vegetables[i] != null && vegetables[i].isAlive){
      vegetables[i]=null;
      
    }
  }
  for(int i = 0; i < player.bubbles.length; i++){
    if(player.bubbles[i] != null && player.bubbles[i].isAlive){
      player.bubbles[i] = null;
    }
  }
}

void costMana(float a){
  mana-=a;
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
