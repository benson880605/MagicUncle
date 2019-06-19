class Cabbage {
  
  float x,y;
  boolean pressed = false;
  
  Cabbage(){
    x = 130;
    y = 140;
  } 
   void display(){
    image(C_cabbage,x,y);
  }
  
  void update(){
  if(bacon.pressed == false && bread.pressed == false && cheese.pressed == false && 
  egg.pressed == false && onion.pressed == false && steak.pressed == false && tomato.pressed == false){  
    if(mousePressed && mouseX >= (x+10) && mouseX <= (x+132-10) 
    && mouseY >= (y+10) && mouseY <= (y+132-10)){
      x = mouseX-66;
      y = mouseY-66;
      pressed = true;
    }
  }
    if(mousePressed == false){
      x = 130;
      y = 140;
      pressed = false;
    }
  }
}
