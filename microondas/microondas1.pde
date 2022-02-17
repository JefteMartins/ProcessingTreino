import controlP5.*;
ControlP5 cp5;
float tempo=10, contar=0;
int a=144, b=144, c=144;
boolean mudanca = true, contagemRegressiva=false, ativarContagem = true;
final int desligado = 0;
final int desligadoAberto = 1;
final int ligado =2;
final int ligadoAberto = 3;
int estadoMicroondas = desligado;
int contagemMudanca=0;
void setup() {
  size(600, 400);
  cp5 = new ControlP5(this);
  cp5.addSlider("tempo")
    .setPosition(width/2+155, 100)
    .setRange(0, 100)
    .setSize(100, 20);
  println("Microondas inicado");
  println("Pressione 1 para ligar ou desligar");
  println("Pressione 2 para abrir a porta, ou 2 para fechar caso esteja aberta");
  println("pressione 3 para iniciar a contagem, ela só será efetuada se o microondas estiver ligado e com a porta fechada");
}
void draw() {
  background(200);
  if (mudanca) {
    MEF();
  } 
  if (!mudanca) {
    contagemMudanca++;
    if (contagemMudanca>=60) {
      contagemMudanca=0;
      mudanca=true;
    }
  }
  if (estadoMicroondas == 2 || estadoMicroondas == 3) {
    a=255;
    b=255;
    c=0;
  } else { 
    a=144; 
    b =144; 
    c=144;
  }
  desenhaMicroondas(a, b, c);
  contagemMicroondas();
  if(estadoMicroondas >1){
  textSize(22);
  fill(255,255,0);
  text(nf(tempo,0,0),width/2+90, height/2-62);
  }
}
void contagemMicroondas() {
 
    if (estadoMicroondas == ligado && keyPressed == true && key=='3' && ativarContagem) {
      contagemRegressiva = true;
      ativarContagem = false;
    }
    if (contagemRegressiva && estadoMicroondas != desligado) {
      contar++;
      if (contar>=60) {
        tempo--;
        contar=0;
        println("tempo:", tempo);
      }
    
    if (tempo <= 0) {
      println("tempo esgotado");
      tempo=0;
      contagemRegressiva=false;
      ativarContagem=true;
    }
  }
}


void MEF() {
  if (keyPressed == true && key == '1' && estadoMicroondas == desligado) {
    estadoMicroondas = ligado;
    println("ligado");
    mudanca=false;
  } else if (keyPressed == true&& key=='2' && estadoMicroondas == desligado) {
    estadoMicroondas = desligadoAberto;
    println("desligado com porta aberta");
    mudanca=false;
  } else if (keyPressed == true && key == '2' && estadoMicroondas == ligado) {
    estadoMicroondas = ligadoAberto;
    println("ligado com porta aberta");
    mudanca=false;
  } else if (keyPressed == true && key == '1' && estadoMicroondas == ligado) {
    estadoMicroondas = desligado;
    println("desligado");
    contagemRegressiva=false;
    mudanca=false;
  } else if (keyPressed == true && key == '2' && estadoMicroondas == ligadoAberto) {
    estadoMicroondas = ligado;
    println("fechou");
    mudanca=false;
  } else if (keyPressed == true && key == '2' && estadoMicroondas == desligadoAberto) {
    estadoMicroondas = desligado;
    println("fechou");
    mudanca=false;
  } else if ((estadoMicroondas==desligadoAberto || estadoMicroondas==ligadoAberto) && keyPressed == true && key=='3') {
    println("Porta aberta, feche pressionando a tecla 2");
    mudanca=false;
  }
}
void desenhaMicroondas(int a, int b, int c) {
  rectMode(CENTER);
  fill(255);
  rect(width/2, height/2, 300, 200, 10);
  fill(0);
  rect(width/2-50, height/2, 180, 180, 10);
  rect(width/2+100, height/2-65, 60, 30, 10);
  line(width/2+55, height/2-100, width/2+55, height/2+100);
  for (int i=0; i<3; i++) {
    for (int j=0; j<4; j++) {
      rect((width/2.+75)+i*25, (height/2.-20)+j*15, 20, 10, 5);
    }
  }
  fill(a, b, c);
  for (int i=0; i<10; i++) {
    for (int j=0; j<10; j++) {
      ellipse((width/2.-140+i*17)+15, (height/2-90+j*17)+15, 10, 10);
    }
  }
}
