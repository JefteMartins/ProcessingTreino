PImage imgOriginal;
PImage imgDestino = createImage(320, 240, RGB);
PImage imgCinza = createImage(320, 240, RGB);
PImage imgVermelho = createImage(320, 240, RGB);
PImage imgAmarelo = createImage(320, 240, RGB);
PImage imgMixada = createImage(320, 240, RGB);
color corOriginal, corDestino;
float r, g, b, m;

void setup() {
  size(960, 480);
  imgOriginal = loadImage("original.jpg");
  //processaImagem();
  adicionaRuido(20000);
  imagemCinza();
  imagemVermelho();
  imagemAmarelo();
  imagemMixada();
  image(imgOriginal, 0, 0);
  image(imgDestino, 320, 0);
  image(imgCinza, 640, 0);
  image(imgVermelho, 0, 240);
  image(imgAmarelo, 320, 240);
  image(imgMixada, 640, 240);
}
void imagemCinza() {
  for (int x = 0; x < 320; x++) {
    for (int y = 0; y < 240; y++) {
      corOriginal = imgDestino.get(x, y);
      r = red(corOriginal);
      g = green(corOriginal);
      b = blue(corOriginal);
      m = (r+g+b)/3;
      corDestino = color(m);
      imgCinza.set(x, y, corDestino);
    }
  }
}
void imagemVermelho() {
  for (int x = 0; x < 320; x++) {
    for (int y = 0; y < 240; y++) {
      corOriginal = imgDestino.get(x, y);
      r = red(corOriginal);
      corDestino = color(r, 0, 0);
      imgVermelho.set(x, y, corDestino);
    }
  }
}
void imagemAmarelo() {
  for (int x = 0; x < 320; x++) {
    for (int y = 0; y < 240; y++) {
      corOriginal = imgDestino.get(x, y);
      r = red(corOriginal);
      g = green(corOriginal);
      b = blue(corOriginal);
      m = (r+g+b)/3;
      corDestino = color(m, m, 0);
      imgAmarelo.set(x, y, corDestino);
    }
  }
}
void adicionaRuido(int numero) {
  for (int x = 0; x < 320; x++) {
    for (int y = 0; y < 240; y++) {
      corOriginal = imgOriginal.get(x, y);
      imgDestino.set(x, y, corOriginal);
    }
  }

  for (int x = 0; x < numero; x++) {
    corDestino = color(int(random(256)), int(random(256)), int(random(256)));
    imgDestino.set(int(random(width)), int(random(height)), corDestino);
  }
}
void imagemMixada() {
  //ruído
  for (int x = 0; x < 160; x++) {
    for (int y = 0; y < 120; y++) {
      corOriginal = imgDestino.get(x, y);
      imgMixada.set(x, y, corOriginal);
    }
  }
  //cinza
  for (int x = 160; x < 320; x++) {
    for (int y = 0; y < 120; y++) {
      corOriginal = imgCinza.get(x, y);
      imgMixada.set(x, y, corOriginal);
    }
  }
  //vermelho
  for (int x = 0; x < 160; x++) {
    for (int y = 120; y < 240; y++) {
      corOriginal = imgVermelho.get(x, y);
      imgMixada.set(x, y, corOriginal);
    }
  }
  //amarelo
  for (int x = 160; x < 320; x++) {
    for (int y = 120; y < 240; y++) {
      corOriginal = imgAmarelo.get(x, y);
      imgMixada.set(x, y, corOriginal);
    }
  }
}
