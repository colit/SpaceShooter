 Ship myShip;
 Enemy[] enemys= new Enemy[5];
 Bullet[] bullets = new Bullet[10];
 
 void setup () {
   frameRate(30);
   size(1400,900);
   smooth();
   myShip = new Ship();
   for (int i=0; i < enemys.length; i++) {
    enemys[i] = new Enemy();
   }
   
   for (int i = 0; i < bullets.length; i++) {
     bullets[i] = new Bullet();
   }
   
 }
 
 void draw (){
   background(255);
   
   myShip.drawMe();
   
   for (int i=0; i < enemys.length; i++) {
     enemys[i].drawMe();
   }
   
   for (int j=0; j < bullets.length; j++) {
     bullets[j].drawMe();
     for (int i=0; i < enemys.length; i++) {
       if (enemys[i].hit(bullets[j])) {
         bullets[j].active = false;
         break;
       }  
     }
   }
 }
 
 void mouseReleased() {
   for (int j=0; j < bullets.length; j++) {
     if (!bullets[j].active) {
       bullets[j].init(myShip.y);
       break;
     }
   }
 }
  