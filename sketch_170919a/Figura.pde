class Figura{
  float w,h,d;
  PVector position;
  Figura(){
    w=40;
    h=40;
    d=40;
    position = new PVector(0,0,0);
  }
  Figura(float nx,float ny,float nz){
    w=40;
    h=40;
    d=40;
    position = new PVector(nx,ny,nz);
  }
  void run(){
  display();
  }
  void display(){
   box(w,h,d);
  
  }

}