class Player{
  float x,y;
  Bubble[] bubbles;
  PImage uncleDisplay = B_uncleStandard_R;
  float bubbleSize = 15;
  float speed = 5;
  int maxBubbleCount=6;

  void update(){   
    accelerate();
    y=460+6*sin(frameCount/5);
    //image when still
    if(B_faceR){uncleDisplay = B_uncleStandard_R;}else{uncleDisplay = B_uncleStandard_L;}
    if(B_upState&&B_faceR){uncleDisplay = B_uncleBlowing_R;}
    if(B_upState&&!B_faceR){uncleDisplay = B_uncleBlowing_L;}


    //left
    if(B_leftState&&x>30&&!B_upState){    
    uncleDisplay = B_uncleFlying_L;
    x-=speed;
    }
    //right
    if(B_rightState&&x<width-30&&!B_upState){
    uncleDisplay = B_uncleFlying_R;
    x+=speed;
    }  
    
    
    if(castingTimer>0){
    uncleDisplay = (B_faceR)?B_uncleCasting_R:B_uncleCasting_L;
    }
    
    image(uncleDisplay,x,y,160,160);
    
    

    
    for(int i = 0; i < bubbles.length; i++){
    if(bubbles[i]!=null){
    bubbles[i].move();
    bubbles[i].display();}
    }
    for(int i = 0; i < bubbles.length; i++){
    
    }
  }
  
  void blow(){ 
    for(int i = 0; i < bubbles.length; i++){
      if(bubbles[i]==null||!bubbles[i].isAlive){
        if(missile){
         bubbleSize=130; 
        }
        bubbleSize+=3.5;
        bubbleSize=(bubbleSize>130)?130:bubbleSize; 
      }
    }       
  }
  
  
  
  void fire(){
    for(int i = 0; i < bubbles.length; i++){
       if(bubbles[i]==null||!bubbles[i].isAlive){
         bubbles[i] = new Bubble(player.x,player.y,bubbleSize,map(bubbleSize,15,130,5,0.7));
         bubbles[i].bubbleDisplay = (bubbleSize>70)?bubbleLarge:bubbleSmall;
         bubbleSize=15;
         break;  
       } 
    }

    
  }
  
  
  void accelerate(){
    if(B_accelerate&&mana>0){speed=20;}
    else{speed = 5;}
    
  }
  
  
  Player(){
    x=640;
    y=460;    
    bubbles = new Bubble[maxBubbleCount];
    }
  
}
