float t;
void setup(){
  background(21);
size (500,500);

}
void draw (){
stroke(255);
strokeWeight(5);
translate (width/2, height/2);
point(x(t),y(t));
       for(float i=0;i<7;i++){
       line(x1(t+i),y1(t+i),x2(t+i),y2(t+i));
       
       }

}
//line (x1(t),y1(t),x2(t),y2(t));
t++;
}

float x1(float t){
return sin(t/10)*100+ sin (t/25)*150;
}

float y(float t ){
return  cos(t/10)*100;
}