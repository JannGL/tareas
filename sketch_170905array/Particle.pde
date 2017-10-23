class Particle {
  float x, y, size, speedX,speedY, acc;
  boolean alive;

  Particle () {

    x =width/2;
    y = height/2;
    size= 20;
    speedX= 2;
    speedY=15;
    acc= 0;
    alive=true;
  }
  Particle(float nx, float ny) {
    x= nx;
    y= ny;
    size=20;
    speedX=3;
    speedY=15;
    acc=0;
    alive=true;
  }

  void run() {
    move();
    lifeSpan();
    //dibujarse
    gravity();
    paint();
  }
  void paint() {
    fill(142,10,200);
    ellipse(x, y, size, size);
  }
  void move() {
    x+=speedX;
    y+=speedY;
    
  }
  void gravity(){
  y+=0.3;
  }
  void lifeSpan(){
   if (this.y>height){
   alive=false;
   }
  
  }
}