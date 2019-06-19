class Onion {
  
  float x,y;
  boolean pressed = false;
  
  Onion(){
    x = 0;
    y = 140;
  }  
  
  void display(){
    image(C_onion,x,y);
  }
  
  void update(){
  if(bacon.pressed == false && bread.pressed == false && cabbage.pressed == false && cheese.pressed == false && 
  egg.pressed == false && steak.pressed == false && tomato.pressed == false){  
    if(mousePressed && mouseX >= (x+5) && mouseX <= (x+132-5) 
    && mouseY >= (y+20) && mouseY <= (y+132-20)){
      x = mouseX-66;
      y = mouseY-66;
      pressed = true;
    }
  }
    if(mousePressed == false){
      x = 0;
      y = 140;
      pressed = false;
    }
  }
}
