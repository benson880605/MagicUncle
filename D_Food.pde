class D_Food{
  boolean isAlive;
  float x,y;
  float w = 40;
  float h = 40;
  PImage img;
  
  void display(){
    if(isAlive){
      image(img, x, y, 40, 40);
    }
  }
  
  D_Food(float x,float y){
    this.x = x;
    this.y = y;
    isAlive = true;
    img = (random(1)>0.5)? D_carrotImg : D_cabbageImg ;
  }
  
}
