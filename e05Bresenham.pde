/********************************************************
 *                                                       *
 *  14/04/2010                                           *
 *  TÉCNICAS GRAFICAS - Ejercicio 5: Bresenham           *
 *                                                       *
 *  Alejandro Riera Mainar                               *
 *  NºMat: 010381                                        *
 *  ariera@gmail.com                                     *
 *                                                       *
 ********************************************************/
int RADIO = 200;
int SIZE = 500;
PImage output;
int TITLE_HEIGHT = 30;

void setup() {
  size(SIZE,SIZE+50+TITLE_HEIGHT);
  colorMode(RGB);
  output = createImage(SIZE, SIZE, RGB);
  display_instructions(output.width, output.height);
  displayTitle();
  process(output);

}

void displayTitle(){
  textFont(createFont("Helvetica", 18));
  fill(color(0));
  text("Ejercicio 5: Bresenham" , 10, 20);
}

void display_instructions(int base_width, int base_height){
  textFont(createFont("Helvetica", 10));
  fill(color(100));
  text("En blanco: Hearn & Baker\nEn verde: otro autor" , 10, base_height + 20 + TITLE_HEIGHT);
}


void draw() {

}

void process(PImage img){
  int loc = 0;
  img.loadPixels();
  /*  internet(img, SIZE/2, SIZE/2); 
   hearnBaker(img, SIZE/2 , SIZE/2);*/
  internet(img); 
  hearnBaker(img);
  img.updatePixels();

  image(img,0,TITLE_HEIGHT);
}

void hearnBaker(PImage img){
  int x = 0;
  int y = RADIO;
  int p = 1 - RADIO;

  while (x < y) {
    pintarEnOctantes(x, y, color(255), img);
    if (p < 0){
      x++;
      p = p + 2*x + 1;
    }
    else{
      x++;
      y--;
      p = p + 2*x + 1 -2*y;
    }
  } 
}

void internet(PImage img){
  int x = 0;
  int y = RADIO;
  int p = 3 - 2*RADIO;

  while (x < y) {
    pintarEnOctantes(x, y, color(0,255,0), img);
    if (p < 0){
      p = p + 4*x + 6;
      x++;
    }
    else{
      p = p + 2*(x-y) + 10;
      x++;
      y--;
    }
  } 

}

void pintarEnOctantes(int x, int y, color c, PImage img){
  int loc;
  loc = (x + SIZE/2) + (y + SIZE/2) * img.width;
  img.pixels[loc] = c;
  loc = (y + SIZE/2) + (x + SIZE/2) * img.width;
  img.pixels[loc] = c;
  loc = (-x + SIZE/2) + (y + SIZE/2) * img.width;
  img.pixels[loc] = c;
  loc = (y + SIZE/2) + (-x + SIZE/2) * img.width;
  img.pixels[loc] = c;
  loc = (x + SIZE/2) + (-y + SIZE/2) * img.width;
  img.pixels[loc] = c;
  loc = (-y + SIZE/2) + (x + SIZE/2) * img.width;
  img.pixels[loc] = c;
  loc = (-x + SIZE/2) + (-y + SIZE/2) * img.width;
  img.pixels[loc] = c;
  loc = (-y + SIZE/2) + (-x + SIZE/2) * img.width;
  img.pixels[loc] = c;
}


