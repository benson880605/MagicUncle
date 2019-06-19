class Girl{
  boolean isAlive;
  float x,y;
  float w = 79.5;
  float h = 87;
  int health = 100;
  int flow = 0;
  
  float girlTopXOffset = 0;
  float girlTopXMaxOffset = 16;
  
  void hurt(){
    health -= 10;   
    if(health <= 0 && isAlive){
      isAlive = false;
    }
    girlTopXOffset = girlTopXMaxOffset;
  }
  
  void display(){
    if(isAlive){
      pushStyle();
      pushMatrix();      
      translate(x,y);
      girlTopXOffset = lerp(girlTopXOffset, 0, 0.2);
      image((health>50)?D_girlImg:D_girlhurtImg, -girlTopXOffset, 0+6*sin(frameCount/5), 106, 116);
      popMatrix();
      popStyle();
      for(int i = 0; i < foods.length; i++){
        
        if(foods[i] != null && foods[i].isAlive){
          foods[i].display();
        }
      }
    }
  }
  void update(){
    x-=1;
    image(D_girlhurtImg,x,y+6*sin(frameCount/5),106,116);
  }
  void summon(){
    for(int i = 0; i < 4; i++){
      foods[i] = new D_Food(random(200,400), (i*50)+20);
    }
    for(int i = 4; i < foods.length; i++){
      foods[i] = new D_Food(random(0,400), (i*50)+20);
    }  
  }
  
  Girl(float x, float y){
    isAlive = true;
    this.x = x;
    this.y = y;
    foods = new D_Food[6];
  }
  
}
