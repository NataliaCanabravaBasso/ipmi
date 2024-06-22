//Natalia Canabrava Basso
//tp3 comision 1
//intente forzar un un dist en los corazones pero no me salio y lo termine sacando, a mi propio riesgo lo mando para no perder la entrega
//https://www.youtube.com/watch?v=UyOgA-s8trU

float cant = 10; 
float tam; 

PImage img;

float heartSizeMultiplier = 1.0; // variable para aumentar tamaño de corazones
boolean growing = true; // boolean que controla si los corazones están creciendo o achicándose
float maxHeartSizeMultiplier = 2.0; // tamaño máximo del multiplicador

int[] heartColors = { // colores de los corazones
  color(166, 17, 27), // rojo
  color(255) // blanco
};
int[] squareColors = {
  color(253, 192, 225), // Rosa bebé
  color(177, 102, 169)  // Fucsia
};

float prevMouseX; // coordenadas anteriores del mouse para hacer una animación fluida
float prevMouseY;
boolean[][] flipping; // indica si un cuadrado se está dando vuelta
float[][] flipProgress;

void setup() {
  size(800, 400);
  tam = (width / 2.0) / cant; // tamaño de los cuadrados
  img = loadImage("referencia.jpg"); // carga la imagen
  reiniciarVariables();
}

void draw() {
  background(255);
  image(img, 0, 0, width / 2.0, height); 
  drawSquares();
  drawHearts();
  updateHeartSize();
  flipAnimation();
  prevMouseX = mouseX; // actualiza posición mouse
  prevMouseY = mouseY;
}

void drawSquares() {
  for (int i = 0; i < cant; i++) { //inicio bucle for
    for (int j = 0; j < cant; j++) { 
      if (mouseX >= (width / 2.0) + i * tam && mouseX < (width / 2.0) + (i + 1) * tam && //calcula si el mouse esta dentro del cuadrado especifico que va a flipear color
          mouseY >= j * tam && mouseY < (j + 1) * tam) {
        flipping[i][j] = true;
      }

      int currentSquareColor = squareColors[(i + j) % 2];
      if (flipping[i][j]) {
        currentSquareColor = lerpColor(currentSquareColor, invertColor(currentSquareColor), flipProgress[i][j]);
      }
        fill(currentSquareColor);
      rect((width / 2.0) + i * tam, j * tam, tam, tam);
    }
  }
}

void drawHearts() {
  int heartColorChange = 0;
  for (int i = 0; i < cant; i++) {
    for (int j = 0; j < cant; j++) {
      float heartSize = tam / 3.0 * heartSizeMultiplier;
      int currentHeartColor = heartColors[heartColorChange];
      if (flipping[i][j]) {
        currentHeartColor = lerpColor(currentHeartColor, invertColor(currentHeartColor), flipProgress[i][j]);
      }
      drawHeart((width / 2.0) + i * tam, j * tam, heartSize, currentHeartColor);
      drawHeart((width / 2.0) + (i + 1) * tam, j * tam, heartSize, currentHeartColor);
      drawHeart((width / 2.0) + i * tam, (j + 1) * tam, heartSize, currentHeartColor);
      drawHeart((width / 2.0) + (i + 1) * tam, (j + 1) * tam, heartSize, currentHeartColor);
      heartColorChange = (heartColorChange + 1) % heartColors.length;
    }
  }
}

void updateHeartSize() {
  if (mousePressed) {
    if (growing) {
      heartSizeMultiplier += 0.1; // aumenta el tamaño de los corazones
      if (heartSizeMultiplier >= maxHeartSizeMultiplier) {
        growing = false; // cambia a achicar cuando alcanza el tamaño máximo
      }
    } else {
      heartSizeMultiplier -= 0.1; // disminuye el tamaño de los corazones
      if (heartSizeMultiplier <= 1.0) {
        growing = true; // cambia a crecer cuando alcanza el tamaño original
      }
    }
  }
}

void flipAnimation() {
  for (int i = 0; i < cant; i++) {
    for (int j = 0; j < cant; j++) {
      if (flipping[i][j]) { //dar vuelta los elementos como animación para cambio de color
        flipProgress[i][j] += 0.05; //velocidad a la que se da vuelta
        if (flipProgress[i][j] >= 1.0) {
          flipping[i][j] = false; //deja de dar vuelta
          flipProgress[i][j] = 0.0; //resetea
        }
      }
    }
  }
}

void drawHeart(float x, float y, float size, int heartColor) { // dibuja los corazones
  float h = size;
  float w = size / 2.0;
  fill(heartColor); // usa el color que corresponda
  noStroke();
 
  ellipse(x - w / 2.0, y - h / 4.0 + 2.0, w, h / 2.0); // Dibuja las dos elipses 
  ellipse(x + w / 2.0, y - h / 4.0 + 2.0, w, h / 2.0);
  triangle(x, y + h / 2.0, x - w, y, x + w, y); // dibuja el triángulo invertido 
}

// Función para invertir colores (rojo - blanco, rosa - fucsia)
int invertColor(int c) {
  if (c == color(166, 17, 27)) { // rojo
    return color(255); // blanco
  } else if (c == color(255)) { // blanco
    return color(166, 17, 27); // rojo
  } else if (c == color(253, 192, 225)) { // rosa bebé
    return color(177, 102, 169); // fucsia
  } else if (c == color(177, 102, 169)) { // fucsia
    return color(253, 192, 225); // rosa bebé
  } else {
    return c; // devuelve al color original
  }
}

void mousePressed() {
  updateHeartSize();
}

void reiniciarVariables() {
  heartSizeMultiplier = 1.0;
  growing = true;
  prevMouseX = mouseX;
  prevMouseY = mouseY;
  flipping = new boolean[(int)cant][(int)cant]; // reiniciar el flipping
  flipProgress = new float[(int)cant][(int)cant]; // reiniciar flip progress
}

void keyPressed() {
  if (key == ' ') { // si presiono barra espaciadora
    reiniciarVariables(); // llama a la función de reiniciar variables
  }
}
