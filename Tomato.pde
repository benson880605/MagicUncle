class Tomato{
  
  float x,y;
  boolean pressed =false;
  
  Tomato(){
    x = 780;
    y = 150;
  }  
  
  void display(){
    image(C_tomato, x, y);
  }
  void update(){
  if(bacon.pressed == false && bread.pressed == false && cabbage.pressed == false && cheese.pressed == false && 
  egg.pressed == false && onion.pressed == false && steak.pressed == false){  
    if(mousePressed && mouseX >= (x+25) && mouseX <= (x+132-25) 
    && mouseY >= (y+35) && mouseY <= (y+132-25)){
      x = mouseX-66;
      y = mouseY-66;
      pressed = true;
    }
  }
    if(mousePressed == false){
      x = 780;
      y = 150;
      pressed = false;
    }
  }
}
