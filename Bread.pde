class Bread {
  
  float x,y;
  boolean rightPosition = false;
  boolean pressed = false;
  
  Bread(){
    x = 660;
    y = 350;
  }  
  
  void display(){
    image( C_bread , x , y);
  }
  
  void update(){
  if(bacon.pressed == false && cabbage.pressed == false && cheese.pressed == false && 
  egg.pressed == false && onion.pressed == false && steak.pressed == false && tomato.pressed == false){  
    if(mousePressed && mouseX >= (x+5) && mouseX <= (x+132-5) 
    && mouseY >= (y+20) && mouseY <= (y+132-30)){
      x = mouseX-66;
      y = mouseY-66;
      pressed = true;
    }
  }
    if(mousePressed == false && x == mouseX-66){
      if(mouseX>=479 && mouseX<=534 && mouseY>=286 && mouseY<=366){
        x = 453;
        y = 270;
        pressed = false;
        
      }else{
        x = 660;
        y = 350;
        pressed = false;
      }
    }
  if(x == 453 && y == 270 &&  pressed == false && bacon.x == 450 && cheese.x == 450 && egg.x == 453 && steak.x == 453){
    rightPosition = true;
  }
  }
}
