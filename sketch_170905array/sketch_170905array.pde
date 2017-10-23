ArrayList <Particle> pSystem;



void setup() {
  size(400, 400);
  background(0);
  pSystem= new ArrayList <Particle>();
  int nP= 100;
  for (int i=0; i< nP; i++) {
    Particle newParticle= new Particle();
    pSystem.add(newParticle);
  }
}
void draw() {
 // for(Particle theParticle : pSystem){
    //NOTA usamos el clico for abreviado 
    //solo si NO se modifica el arraylist dentro del ciclo/
    
    //theParticle.run();/
    
 // }//
  
  for(int i=pSystem.size()-1; i>0; i--){
    Particle theParticle =pSystem.get(i);
    if (theParticle.alive){
    theParticle.run();
    }else{
      pSystem.remove(theParticle);
    }
  }
  println("Particulas;" +pSystem.size());
 
  }
 void mouseMoved(){
  
   
   Particle newParticle= new Particle(mouseX,mouseY);
    pSystem.add(newParticle);
}