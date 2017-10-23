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
    separate(4); // a mayor valor mayor separacion
    // cohesion
    // alineacion
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
}