class Cheese {
  
  float x,y;
  boolean pressed = false;
  boolean cooked = false;
  
  Cheese(){
    x = 265;
    y = 150;
  }  
  
  void display(){
    image(C_cheese,x,y);
  }
  
  void update(){
  if(bacon.pressed == false && bread.pressed == false && cabbage.pressed == false && 
  egg.pressed == false && onion.pressed == false && steak.pressed == false && tomato.pressed == false){  
    if(mousePressed && mouseX >= (x+5) && mouseX <= (x+132-5) 
    && mouseY >= (y+20) && mouseY <= (y+132-20)
    && (x != 450 && y != 320)){
      x = mouseX - 66;
      y = mouseY - 66;
      pressed = true;
    }
  }
    if(mousePressed == false && x == mouseX - 66){
      if(mouseX>=470 && mouseX<=570 && mouseY>=300 && mouseY<=450 && steak.cooked == true ){
    
        x = 450;
        y = 320;
        pressed = false;
        cooked = true;
      }else{
        x = 265;
        y = 150;
        pressed = false;
      }
    }
  }
}
