int n=30;
PImage imagem;
int tamanho=100;
int pixelDensity[] = new int [255];
void setup() {
  imagem = loadImage("einstein.png");
  background(255);
  size(600, 600);
  noStroke();
  colorMode(HSB, 360, tamanho, tamanho);
  processaImagem();
  exibeVetor();
}
float salvaAngulo;
void draw() {
  background(255);
  image(imagem, 0, 0, 320, 240);
}


void processaImagem() {
  color cinza;
  float b;
  int bAux;
  int count = 0;
  for (int i=0; i<pixelDensity.length; i++){
    pixelDensity[i] = 0;
  }
  
  for (int x=0; x<320; x++) {
    for (int y=0; y<220; y++) {
      cinza = imagem.get(x, y);
      b = brightness(cinza);
      bAux = (int)b;
      pixelDensity[bAux] += 1;
      
    }
  }
}
void exibeVetor(){
  for (int i=0; i<pixelDensity.length; i++){
    print(pixelDensity[i] + " ");
  }
}
