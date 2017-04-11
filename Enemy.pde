class Enemy{
  float x;
  float y;
  float speed;
  int count;
  boolean alive;
  float size;
  float randomSeed;
  float noiseStep;
  
  
  Enemy() {
    init();
    x= random(width);
    randomSeed = random(1000);
    noiseStep = 0.05;
  }
      
  void init() {
    alive = true;
    size = 30;
    speed = random(8)+4;
    x = width;
    y = random(height);
  }
  
  void drawMe(){
    randomSeed += noiseStep;
    
    x -= speed;
    y += 8 * (1 - 2 * noise(randomSeed));
    
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