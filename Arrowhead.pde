class Arrowhead{
  float x,y;
  float endX = 90,endY = 90;
  float moveAngle = 1;
  
  void display(){
    pushMatrix();
    pushStyle();
    translate(x, y);
    fill(0);
    strokeWeight(8);
    stroke(255, 230, 230);
    line(0, 0, -70*sin(radians(endX)),70*cos(radians(endY)));
    line(-70*sin(radians(endX)),70*cos(radians(endY)),-60*sin(radians(endX+15)),60*cos(radians(endY+15)));
    line(-70*sin(radians(endX)),70*cos(radians(endY)),-60*sin(radians(endX-15)),60*cos(radians(endY-15)));
    popStyle();
    popMatrix();
    endX+=moveAngle;
    endY+=moveAngle;
    if(endX==180||endX ==90){
      moveAngle*=-1;
    }
  }
  
  Arrowhead(float x,float y){
    this.x = x;
    this.y = y;
  }
  
}
