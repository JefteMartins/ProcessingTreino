// Olá minha cara pessoa, o código não está perfeito, ja estou trabalhando somente com resultado inteiros
//para o perfeito funcionamento, use perímetros que são divisíveis por 12, dado um probleminha que enfrentei com resultados em float
void setup(){
aproveitamentoCubo(120);
}
void aproveitamentoCubo(float perimetro) {
  int base=0, altura=0, largura=0, perimetro1=0, area=0, baseAux=0, alturaAux=0, larguraAux=0, areaAux=0;
  for (base =0; base<perimetro/6; base++) {
    for (altura =0; altura<perimetro/6; altura++) {
      for (largura =0; largura<perimetro/6; largura++) {
        perimetro1 = base * 4 + largura * 4 + altura * 4;
        area = base * altura * largura;
        if (perimetro1==perimetro) {
          println("Perímetro:", perimetro);
          println("Base:", base);
          println("Altura:", altura);
          println("Largura:", largura);
          println("Área:", area);
          println();
          if (area>areaAux) {
            areaAux=area;
            baseAux=base;
            alturaAux=altura;
            larguraAux=largura;
          }
        }
      }
    }
  }
  println("A maior área encontrada com perímetro 60 foi de:", areaAux);
  println("A base, altura e largura dessa área são respectivamente:", baseAux, alturaAux, larguraAux);
}
