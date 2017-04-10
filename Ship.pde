class Ship {
  float y;
  float x;
  
  Ship() {
    y=height/2;
    x=10;
  }
  
  void drawMe(){
    y = mouseY;
    fill(255);
    ellipse(x,y,20,20);
  }
}