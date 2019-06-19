class Vegetable{
  float x,y;
  float size;
  float speed;
  float liftStr;
  float maxLiftStr=5;
  boolean isAlive = true;
  boolean wraped=false;
  
  void move(){
    y+=speed-liftStr;
    out();
    onTable();
  }
  
  void display(){
    if(freezeTimer>0){image(B_vegetableFreeze,x,y,size,size);}else{
    image(B_vegetable,x,y,size,size);  }
  }
  
  Vegetable(float x,float y,float size,float speed){
   this.x=x;
   this.y=y;
   this.size = size;
   this.speed = speed;
  }
  
  void lift(float str){
   liftStr=str;    
  }

  void out(){
    if(y<-70){
    isAlive=false;    
    }
  }
    
  void onTable(){
    if(y+size/2>B_tableLine){
     isAlive=false; 
     switch(deadVegetableCount){
       case 0: 
       deadVegetableX1=x;
       deadVegetableY1=y;
       deadVegetableS1=size;
       deadVegetableCount++;
       break;
       
       case 1: 
       deadVegetableX2=x;
       deadVegetableY2=y;
       deadVegetableS2=size;
       deadVegetableCount++;
       break;
       
       case 2:        
       deadVegetableX3=x;
       deadVegetableY3=y;
       deadVegetableS3=size;
       deadVegetableCount++;

       case 3:
              
       break;
     }
    }
    
  }

    
    
    
    
    
  }
  
  
    
    
    
  
  
  
  
  
  
  
  
