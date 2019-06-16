class Bubble{
  float x, y , size;
  float targetX,targetY;
  boolean isAlive=true;
  float speed;
  PImage bubbleDisplay = bubbleSmall;
  boolean wrap=false;

  void move(){
    y-=speed;
    out();
  }
  void display(){
    image(bubbleDisplay,x,y,size,size);
  }
  void out(){
    if(y<-70){
      isAlive=false;
      
    }
    
  }
  
  boolean isHit(Vegetable vegetable){
    return vegetable != null && vegetable.isAlive && dist(x, y, vegetable.x, vegetable.y) <= 30;
  }  
  

  
  
  
  Bubble(float x,float y,float size,float speed){
   this.x=x;
   this.y=y;
   this.size = size;
   this.speed = speed;
  }
  
}
