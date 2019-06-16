class Player{
  float x,y;
  Bubble[] bubbles;
  PImage uncleDisplay = B_uncleRight;
  float bubbleSize = 15;
  float speed = 5;
  int maxBubbleCount=6;

  void update(){   
    accelerate();
    y=460+6*sin(frameCount/5);
    if(B_leftState&&x>30&&!B_upState){    
    uncleDisplay = B_uncleLeft;
    x-=speed;



    }
    
    if(B_rightState&&x<width-30&&!B_upState){
    uncleDisplay = B_uncleRight;
    x+=speed;
    }   
    
    image(uncleDisplay,x,y,120,120);
    

    
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
    if(B_accelerate&&accMana>0){speed=20;}
    else{speed = 5;}
    
  }
  
  
  Player(){
    x=640;
    y=460;    
    bubbles = new Bubble[maxBubbleCount];
    }
  
}
