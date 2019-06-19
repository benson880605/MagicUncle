class Steak  { 
  
  float x,y;
  float time = 0;
  float TIME_MAX = 800;
  boolean pressed = false;
  float tint0 = 255;
  boolean cooked = false;
  float lineX = 290;
  
  Steak(){
    x = 400;
    y = 150;
    time = 0;
  }
  
  void display(){
    pushMatrix();
    tint(255,tint0);
    image(steakImages[0], x, y);
    popMatrix();
  }
  
  void update(){
  if(bacon.pressed == false && bread.pressed == false && cabbage.pressed == false && cheese.pressed == false && 
  egg.pressed == false && onion.pressed == false && tomato.pressed == false){  
    if(mousePressed && mouseX >= (x+5) && mouseX <= (x+132-5) 
    && mouseY >= (y+20) && mouseY <= (y+132-30) && (time == 0 || time >= TIME_MAX)
    && (x != 453 || y != 330)){
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
        x = 400;
        y = 150;
        pressed = false;
      }
    }
    if(mousePressed == false && time >= TIME_MAX && x == mouseX-66){
      if(mouseX>=470 && mouseX<=570 && mouseY>=300 && mouseY<=450){
        x = 453;
        y = 330;
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
      lineX = lineX - 0.225;
      time ++;
    } 
    
    
    if(time > 200){
      pushMatrix();
      tint(255,tint0);
      image(steakImages[1], x, y);
      popMatrix();
      
      if(time > 400){
        pushMatrix();
        tint(255,tint0);
        image(steakImages[2], x, y);
        popMatrix();
      }
      
      if(time >= 600){
        pushMatrix();
        tint(255,tint0);
        image(steakImages[3], x, y);
        popMatrix();
        
      }if(time >= 800){
        tint0 = 0;
        tint(255,255);
        image(steakImages[4], x, y);
        
        
      }
      
    }
    
  }  
  
}
