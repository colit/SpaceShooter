class Bullet{
  boolean active;
  float x;
  float y;
  
  Bullet(){
    active=false;
  }
  
  void init(float _y) {
    x=10;
    y=_y;
    active=true;
  }
  
  void drawMe(){
   if(active){
    x+=10;
    
    fill(255);
    ellipse(x,y,5,3);
    
    if(x>=width) {
      active=false;
    }
   }
  }
}