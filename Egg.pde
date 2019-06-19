class Egg {
  
  float x, y;
  float time = 0;
  float TIME_MAX = 400;
  PImage eggDisplay;
  boolean pressed = false;
  float tint0 = 255;
  float tint1 = 255;
  boolean cooked = false;
  float lineX = 290;
  
  Egg(){
    x = 665;
    y = 140;
    time = 0;
  }
  
   void display(){
    pushMatrix();
    tint(255,tint0);
    image(eggImages[0] , x, y);
    popMatrix();
  }
  
  void update(){
  if(bread.pressed == false && cabbage.pressed == false && cheese.pressed == false && 
  bacon.pressed == false && onion.pressed == false && steak.pressed == false && tomato.pressed == false){
    if(mousePressed && mouseX >= (x+15) && mouseX <= (x+132-15) 
    && mouseY >= (y+30) && mouseY <= (y+132-25) && (time == 0 || time >= TIME_MAX)
    && (x != 453 || y != 290)){
      x = mouseX-66;
      y = mouseY-66;
      pressed = true;
    }
  }
    if(mousePressed == false && time == 0 && x == mouseX-66){
      if(mouseX>=100 && mouseX<=292 && mouseY>=330 && mouseY<=462){
        x = 130;
        y = 330;
        pressed = false;
        
      }else{
        x = 665;
        y = 140;
        pressed = false;
      }
    }
    if(mousePressed == false && time >= TIME_MAX && x == mouseX-66 ){
      if(mouseX>=470 && mouseX<=570 && mouseY>=300 && mouseY<=450 && cheese.cooked == true && bacon.cooked == true && steak.cooked == true ){
        x = 453;
        y = 290;
        pressed = false;
        cooked = true;
      }else{
        x = 130;
        y = 330;
        pressed = false;
      }
    }  
     
    if(mousePressed == false && x == 130 && y == 330 && time <= TIME_MAX){
      stroke(0);
      strokeWeight(18);
      line(110,300,290,300);
      stroke(#ff0000);
      strokeWeight(16);
      line(110,300,lineX,300);
      lineX = lineX - 0.45;
      time ++;
    }
    
    if(time > 0){
      tint0 = 0;
      pushMatrix();
      tint(255,tint1);
      image(eggImages[1] , x, y);
      popMatrix();
       
    
      if(time > 200){
        pushMatrix();
        tint(255,tint1);
        image(eggImages[2] , x, y);
        popMatrix();
      }
      
      if(time >= 400){
        tint1 = 0;
        tint(255,255);
        image(eggImages[3] , x, y);
        
        
        
        
      }
      
    }
    
  }
}
