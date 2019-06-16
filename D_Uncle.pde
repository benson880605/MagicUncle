class D_Uncle{
  boolean isAlive;
  float x,y;
  float w = 30;
  float h = 30;
  PImage img;
  
  Hamburger[] hamburgers;
  
  void display(){
    image(img, x, y+5*sin(frameCount/5) ,100,100);
    
    for(int i = 0; i < hamburgers.length; i++){
      if(hamburgers[i] != null && hamburgers[i].isAlive){
        hamburgers[i].display();
      }
    }
  }
  
  void fire(){
    for(int i = 0; i <  hamburgers.length; i++){
      if( hamburgers[i] == null || ! hamburgers[i].isAlive){
         hamburgers[i] = new Hamburger((arrowhead.x-70*sin(radians(arrowhead.endX))),(arrowhead.y+70*cos(radians(arrowhead.endY))), atan2((arrowhead.y+70*cos(radians(arrowhead.endY)))-(height-120),(arrowhead.x-70*sin(radians(arrowhead.endX)))-(width-180)));
        break;
      }
    }
  }
  
  void update(){
    for(int i = 0; i < hamburgers.length; i++){
      if(hamburgers[i] != null && hamburgers[i].isAlive){
        hamburgers[i].update();
      }
    }
  }
  
  D_Uncle(float x,float y){
    this.x = x;
    this.y = y;
    isAlive = true;
    img = D_uncleImg ;
    hamburgers = new Hamburger[D_foodNumber];
  }
  
}
