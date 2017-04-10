class Enemy{
  float x;
  float y;
  float speed;
  int count;
  boolean alive;
  float size;
  
  
  Enemy() {
    init();
    x= random(width);
  }
      
  void init() {
    alive = true;
    size = 30;
    speed = random(8)+4;
    x = width;
    y = random(height);
  }
  
  void drawMe(){
    x-=speed;
    if(x<=0){
      fill(255);
      init();
    } else if (alive) {
      fill(255);
    } else {
      size += 2;
      if (count-- < 0) {
        init();
        fill(255);
      } else fill(0);
    }
    ellipse(x,y,size,size);
  }
  
  boolean hit(Bullet b) {
    boolean isHit = false;
    if (alive && b.active) {
      if (sqrt(sq(x - b.x) + sq(y - b.y)) < size) {
        alive = false;
        count = 20;
        isHit = true;
      }
    }
    return isHit;
  }

} 