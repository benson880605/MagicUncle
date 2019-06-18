class Head {
  
  int headX , headY ;
  PImage headImg;
  
  Head(){
    
    headX = 50 ;
    headY = 50 ;
    headImg = head;
    
  }
  
  void display(){
    image( head , headX , headY );
  }
  
  void update(){
    if( A_fattyUI.fattyValue < A_fattyUI.fattyValueWin * 1/4 ) image( head , headX , headY ); ;
    if( A_fattyUI.fattyValue < A_fattyUI.fattyValueWin * 2/4 && A_fattyUI.fattyValue > A_fattyUI.fattyValueWin * 1/4 ) image( head2 , headX , headY );
    if( A_fattyUI.fattyValue < A_fattyUI.fattyValueWin * 3/4 && A_fattyUI.fattyValue > A_fattyUI.fattyValueWin * 2/4 ) image( head3 , headX , headY );
    if( A_fattyUI.fattyValue < A_fattyUI.fattyValueWin * 4/4 && A_fattyUI.fattyValue > A_fattyUI.fattyValueWin * 3/4 ) image( head4 , headX , headY );
  }


}
