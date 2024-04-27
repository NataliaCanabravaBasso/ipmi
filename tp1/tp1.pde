//Canabrava Basso Natalia
//tp1 comision1 

PImage img;

void setup() {
  size(800,400);
  background(90);
  img =loadImage("wonejo.jpg");
}

void draw() {
  image(img,0,0);//ubicacion de imagen
  
  //inicio comando para coordenadas
  println("X:");
  println(mouseX);
  println("Y:");
  println(mouseY);
  //fin comando para coordenadas
  
  //inicio codigos de dibujo
  noStroke();
  fill(189,160,107);
  rect(531,305,40,45,25);//pata 1
  rect(571,303,40,45,25);//pata 2
  fill(124,112,87);
  rect(664,300,40,50,50);//pata3
  fill(189,160,107);
  ellipse(630,240,250,190);
  fill(180,150,107);
  ellipse(593,250,200,150);
  fill(189,160,107);
  ellipse(551,86,40,100);//oreja 1
  ellipse(657,86,40,100);//oreja 2
  fill(233,150,122);
  ellipse(548,90,25,80);
  ellipse(653,78,25,80);
  fill(124,112,87);
  triangle(553,209,648,209,593,257);
  fill(240,230,170);
  circle(602,133,110);//cabeza
  ellipse(602,178,150,100);
  fill(0);
  ellipse(566,150,15,22); //ojo 1
  ellipse(642,150,15,22); //ojo 2
  fill(255);
  circle(570,147,5);
  circle(638,147,5);
  fill(0);
  rect(604,192,3,16);
  triangle(605,205,598,210,612,210);
  fill(250,128,114);
  triangle(591,186,620,186,605,196);
  //fin codigos de dibujo
}
