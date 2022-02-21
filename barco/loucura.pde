PImage agua;
PImage fundo;
void setup() {
  agua = loadImage("agua.png");
  fundo = loadImage("fundo.png");
  size(750, 600);
  noStroke();
}
float x=0;
float z=0;
int posX=650;
int posY=100;
void draw() {

  //background(0);
  float y = sin(x);
  x+= 0.1;
  fill(255);
  image(fundo, 0, 0);
  image(agua, 0, 0);
  fill(242, 152, 42);
  ellipse(posX, posY, 75, 75);
  x+= 0.01;
  translate(x*20, y*20+300);
  if (x*20>width)
    x=0;
  y=0;
  rotate(cos(x)/2);
  boat(0, 0);
}
void boat(float x, float y) {
  fill(52, 52, 242);
  arc(x, y-25, 35, 45, radians(-90), radians(0), PIE);
  //triangle(x, y-10, x+25, y-10, x, y-40);
  fill(165, 42, 42);
  quad(x-40, y-20, x+40, y-20, x+15, y, x-15, y);
}
//procedimento que usei pra fazer o fundo, mas como ficou pesado
//decidi fazer um png do resultado desse procedimento e pôr como imagem
void desenhaFundo() {
  for (int i=0; i<width; i++) {
    for (int j=0; j<height; j++) {

      float dist = dist(posX, posY, i, j);
      float r= map(dist, 0, 200, 144, 80);
      float g= map(dist, 0, 200, 144, 80);
      float b= map(dist, 0, 200, 242, 178);
      stroke(r, g, b);
      point(i, j);
    }
  }
}
