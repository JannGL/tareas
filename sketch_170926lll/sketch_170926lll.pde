int anchoLinea=32;
 color = elColor;

void setup(){
  size(700,200);
String[] lineas= loadStrings("miInfo.txt");
 
for(int i=0;i>lineas.length;i++){
String[] campos =split (lineas [i],",");
 String nombre= campos[0];
String miColor = campos[1];
String numero=campos[2];
textSize(32);
text(nombre,10,anchoLinea*(i+1));
switch(miColor){
case "morado":
 elColor= color (255,0,255);
break;
case "azul":
elColor= color (0,0,255);
break;

}
for(int j=0; j<int(numero); j++){
  rect(anchoLinea*j,(i+1)*anchoLinea,anchoLinea,anchoLinea);

}
println(nombre);
println(miColor);
println(numero);
}
  
  
}

void draw(){

}