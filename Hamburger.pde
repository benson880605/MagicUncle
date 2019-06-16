class Hamburger{
  boolean isAlive;
  float x,y;
  float w = 30;
  float h = 30;
  float targetAngle;
  PImage img;
  
  void display(){
    pushMatrix();
    pushStyle();
    translate(x, y);
    imageMode(CENTER);
    image(img, 0, 0);
    popStyle();
    popMatrix();
  }
  
  void update() {
    move();
    
    if(isOutOfScreen()){
      isAlive = false;
    }
    if(D_isHit(x, y, w, h, magicGirl.x,magicGirl.y, magicGirl.w, magicGirl.h)&& magicGirl.isAlive){
      onHit(magicGirl);
    }
    for(int i = 0 ; i < foods.length; i++){
      if(foods[i]!= null && foods[i].isAlive){
        if(D_isHit(x, y, w, h, foods[i].x,foods[i].y,foods[i].w,foods[i].h)){
          onHit(foods[i]);
          break;
        }
      }
    }
  }
  
  void onHit(Girl girl){
    girl.hurt();
    isAlive = false;
  }
  
  void onHit(D_Food food){
    food.isAlive = false;
    isAlive = false;
  }
  
  void move(){
    x += cos(targetAngle) * 3;
    y += sin(targetAngle) * 3;
  }
  
  boolean isOutOfScreen(){
    return x < -100 || x > width + 100 || y < -100 || y > height + 100;
  }
  
  Hamburger(float x, float y, float targetAngle){
    this.x = x;
    this.y = y;
    isAlive = true;
    img = D_hamburgerImg;
    this.targetAngle = targetAngle;
  }
  
}
