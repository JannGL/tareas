class Particle {
  Vec3D speed, acc, position;
  float size;
  Particle() {
    position = new Vec3D(width/2, height/2, 0);
    speed = new Vec3D(random(-2, 2), random(-2, 2), 0);
    acc = new Vec3D();
    size=10;
  }
  void run() {
    show();
    move();
    bounce();
    flock();
  }
  void show() {
    stroke(255);
    fill(255);
    ellipse(position.x, position.y, size, size);
  }
  void bounce() {
    if ((position.x > width)||(position.x < 0)) {
      speed.x = speed.x*-1;
    }
    if ((position.y > height)||(position.y < 0)) {
      speed.y = speed.y*-1;
    }
  }
  void move() {
    speed.addSelf(acc);
    speed.limit(2);
    position.addSelf(speed);
    acc.clear();
  }
  void flock() {
    // separacion
    separate(4); 
    cohesion(0.0025);
    align(0.2);
  }
 void separate(float magnitude) {
    Vec3D steer = new Vec3D();
    int count = 0;
    for ( int i =0; i < pSystem.size(); i++) {
      Particle thisParticle = pSystem.get(i);
      float distance = position.distanceTo(thisParticle.position);
      if ( distance > 0 && distance < 60) {
        Vec3D diff = position.sub(thisParticle.position);
        diff.normalizeTo(1.0/distance);
        steer.addSelf(diff);
        count++;
      }
    }
    if (count > 0) {
      steer.scaleSelf(1.0/count);
    }
    steer.scaleSelf(magnitude);
    acc.addSelf(steer);
  } 
  /* funcion COHESION determina la intensidad del vector de aproximamiento entre el objeto y
  el grupo Recibe valores de 0 a 1
  si cohesion tiene un valor de 1 el objeto tiene que estar exactamente en la misma
  posicion que el otro objeto */
  void cohesion(float magnitude) {
    Vec3D sum = new Vec3D();
    int count = 0;
    for ( int i =0; i < pSystem.size(); i++) {
      Particle thisParticle = pSystem.get(i);
      float distance = position.distanceTo(thisParticle.position);
      if ( distance > 0 && distance < 60) {
      sum.addSelf (thisParticle.position);
        count++;
      }
    }
    if (count > 0) {
      sum.scaleSelf(1.0/count);
    }
  Vec3D steer = sum.sub(position);
  steer.scaleSelf(magnitude);
  acc.addSelf(steer);
  }
  void align(float magnitude) {
    Vec3D steer = new Vec3D();
    int count = 0;
    for ( int i =0; i < pSystem.size(); i++) {
      Particle thisParticle = pSystem.get(i);
      float distance = position.distanceTo(thisParticle.position);
      if ( distance > 0 && distance < 60) {
        
        steer.addSelf(thisParticle.speed);
        count++;
      }
    }
    if (count > 0) {
      steer.scaleSelf(1.0/count);
    }
    steer.scaleSelf(magnitude);
    acc.addSelf(steer);
  } 
   void lineBetween() {
    for ( int i =0; i < pSystem.size(); i++) {
      Particle thisParticle = pSystem.get(i);
      float distance = position.distanceTo(thisParticle.position);
      if ( distance > 0 && distance < 60) {
        line(position.x,position.y,thisParticle.position.x,thisParticle.position.y); 
      }
    }
    
  } 
}