//Canabrava Basso Natalia
//tp2 comision1 


//variables
PFont fuente;

PImage primerFondo; 
PImage segundoFondo; 
PImage tercerFondo; 
PImage boton;
PImage logo;
PImage cursor; 
PImage end; 
PImage restart; 

int botonX, botonY;
int botonAncho = 200;
int botonAlto = 200;
int transparenciaTexto = 255;
int transparenciaTexto2 = 255;
int transparenciaEnd = 0; 
int transparenciaOut = 255; 
int posicionYTextoCast;
int espacioEntreLineas = 50; 
int pantallaActual = 1; 

float logoTransparencia = 255;

String[] elenco = {
  "Samantha Robinson as Elaine", "Gian Keys as Griff","Jennifer Ingrum as Barbara","Jared Sanford as Gahan", "Laura Waddell as Trish","Robert Seeley as Richard","Jeffrey Vincent as Wayne","Lily Holleman as Miss Curtis",
  "Dani Lennon as Mandy","Randy Evans as Steve","Elle Evans as Star","Clive Ashborn as Professor King","Jennifer Couch as Wendy","Stephen Wozniak as Jerry", "Christopher Le Crenn as Jester","Gina Venditti as Jane",
  "Micaela Griffin as Moon","Frank Farmer as Sam","Ron Kari as Oak King","Kyle Derek as Lyle", "Bernard Bullen as Lord Bernard","Giselle DaMie as Harpist"
};


void setup() {
  
  size(640, 480);

  fuente = loadFont("SitkaSubheading-BoldItalic.vlw"); //carga fuente

  primerFondo  = loadImage("candles.jpg"); //inicio carga imagenes
  segundoFondo  = loadImage("hair.jpg"); 
  tercerFondo  = loadImage("eyes.jpg");
  boton = loadImage("heartbutton.png");
  logo = loadImage("logo.png");
  end = loadImage("end.png"); 
  restart = loadImage("restartbutton.png"); 
  cursor = loadImage("cursor.png"); //fin carga imagenes
  
  cursor(cursor); //reemplaza cursor predeterminado por imagen 

  reiniciarVariables(); //establece que las variables se van a reiniciar
}

void draw() {
  
  switch (pantallaActual) { //control pantallas
    case 1:
      PrimeraPantalla();
      break; //detiene el switch para evitar ejecuciones no deseadas :D
    case 2:
      SegundaPantalla();
      break;
    case 3:
      TerceraPantalla();
      break;
    case 4:
      CuartaPantalla();
      break;
    case 5:
      QuintaPantalla();
      break;
    case 6:
      SextaPantalla();
      break;
    case 7:
      SeptimaPantalla(); //le juro que son cortitas y legibles las siete, perdon D:
      break;
    
    default:
      background(0);
  }
}

void PrimeraPantalla() { 
  
  background(primerFondo); //establece imagen de fondo
  imageMode(CENTER); //centra imagen boton
  tint(255); // asegura que al reiniciar la imagen del primer boton, esta va a tener completa opacidad
  image(boton, width / 2, height / 2, botonAncho, botonAlto); //ubicacion de la imagen
  fill(39, 18, 18); //configuracion texto 1
  textFont(fuente); 
  textSize(65); 
  textAlign(CENTER); 
  text("This is your heart:", width / 2, height / 2 - botonAlto / 2 - 20); //fin configuracion texto 1
  fill(247, 237, 237); //configuracion texto 2
  textSize(35); 
  text("Click it and give it to her", width / 2, height / 2 + botonAlto / 2 + 40); //fin configuracion texto 2
  }


void SegundaPantalla() {
 
  background(segundoFondo); 
  imageMode(CENTER); //logo centrado
  tint(255, logoTransparencia); //aplica transparencia logo
  image(logo, width / 2, height / 2, logo.width, logo.height); //muestra el logo y lo ubica
  logoTransparencia -= 1; //animacion transparencia
  if (logoTransparencia <= 0) { //cuando termine de transparentarse el logo...
    pantallaActual = 3; //...se pasa a la proxima pantalla
  }
}

void TerceraPantalla() {
 
  background(segundoFondo);
  textSize(60);
  fill(129, 18, 18, transparenciaTexto); //animacion transparencia de texto
  text("Directed by:", width / 2, height / 2 - 20); //muestra el texto y lo ubica
  textSize(40);
  fill(247, 237, 237, transparenciaTexto);
  text("Anna Biller", width / 2, height / 2 + 40);
  if (transparenciaTexto > 0) { 
    transparenciaTexto -= 1;
  } else {
    pantallaActual = 4;
  }
}

void CuartaPantalla() {
  
  background(segundoFondo);
  textSize(60);
  fill(129, 18, 18, transparenciaTexto2);
  text("Starring", width / 2, height / 2 - 20);
  textSize(40);
  fill(247, 237, 237, transparenciaTexto2);
  text("Samantha Robinson", width / 2, height / 2 + 40);
  if (transparenciaTexto2 > 0) {
    transparenciaTexto2 -= 1;
  } else {
    pantallaActual = 5;
  }
}

void QuintaPantalla() {
  
  background(segundoFondo);
  textSize(75);
  fill(129, 18, 18);
  text("CAST", width / 2, posicionYTextoCast);
  
  textSize(40);
  fill(247, 237, 237);
  for (int i = 0; i < elenco.length; i++) { //inicia el bucle
    text(elenco[i], width / 2, posicionYTextoCast + (i + 1) * espacioEntreLineas); //la posicion del texto crece segun el indice i y espacio entre lineas
  }
  
  if (posicionYTextoCast > -elenco.length * espacioEntreLineas) { //verifica si la posicion del texto es mayor que el negativo del numero de nombres multiplicado por el espacio entre lineas
    posicionYTextoCast -= 1; //controla la velocidad de la animacion
  } else {
    pantallaActual = 6; //si no esta el texto en la pantalla, pasa a la proxima
  }
}

void SextaPantalla() { 
  
  background(0);
  tint(255, transparenciaEnd);
  image(tercerFondo, width / 2, height / 2, tercerFondo.width, tercerFondo.height);
  image(end, width / 2, height / 2, end.width, end.height);
  
  fill(255, 255, 255, transparenciaEnd);
  textSize(30);
  textAlign(CENTER, TOP); //texto centrado y en la parte superior
  text("press any key", width / 2, 20);
  
  if (transparenciaEnd < 255) {
    transparenciaEnd += 1;
  }
}

void SeptimaPantalla() { //pantalla de reinicio
  
  background(0); 
  fill(93, 7, 7); 
  textSize(80); 
  textAlign(CENTER, TOP);
  text("restart?", width / 2, height / 2 - restart.height / 2 - 20); //texto centrado arriba del boton
  image(restart, width / 2, height / 2); //dibuja el botón de reinicio en el centro
}

void mouseClicked() {
  switch (pantallaActual) {
    case 1: //primer boton
    if (dist(mouseX, mouseY, width / 2, height / 2) < botonAncho / 2) { //verifica si se hizo click en la zona del boton
       pantallaActual = 2; //pasa a la proxima pantalla en caso de que sea verdadero
    }
    break;
    case 7: //boton de reinicio
    if (dist(mouseX, mouseY, width / 2, height / 2) < botonAncho / 2) { //verifica si se hizo click en la zona del boton
        pantallaActual = 1; //vuelve a la primera pantalla en caso de que sea verdadero
    
    reiniciarVariables(); 
     }
  }
}

void keyPressed() {
  if (pantallaActual == 6) { 
    pantallaActual = 7; //cambia a la ultima pantalla al presionar cualquier tecla
  }
}

void reiniciarVariables() {
  //reconfigura las variables necesarias para reiniciar la presentacion
  botonX = width / 2 - botonAncho / 2;
  botonY = height / 2 - botonAlto / 2;

  logoTransparencia = 255;
  transparenciaTexto = 255;
  transparenciaTexto2 = 255;
  transparenciaEnd = 0;   
  transparenciaOut = 255; 
  posicionYTextoCast = height;
}

//fin :D
