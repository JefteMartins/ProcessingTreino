import controlP5.*;
ControlP5 gui;
ControlP5 cp5;
int cor = color(int (random(256)), int (random(256)), int (random(256)));
float tempo, velocidade = 60, ang=0;
boolean lancar= true, limpar =false;
void setup() {
  background(0); 
  size(600, 400);
  cp5= new ControlP5(this);
  cp5.addSlider("ang").setPosition(255, 100).setRange(0, 90);
  cp5.addButton("lancar").setValue(0).setPosition(450, 40).setSize(50, 50);
  gui = new ControlP5(this);
  gui.addSlider("velocidade")
    .setRange(1, 90)
    .setValue(velocidade)
    .setPosition(50, 50)
    .setSize(130, 40);
}
public void lancar() {
  fill(0);
  rect(0, 0, width, height/4);
  tempo = 0;
  lancar=true;
  cor = color(int (random(256)), int (random(256)), int (random(256)));
}
void draw() {
  noStroke();
  if (lancar==true) {
    noStroke();
    arc(255, 90, 150, 150, radians(0-ang), 0);
    text("Angulo", 350, 90);
    text(nf(ang, 0, 0), 400, 90);
    fill(cor);
    simulador(ang, tempo, velocidade);
    tempo += 0.2;
    if (tempo>20) {
      lancar = false;
    }
  } else if (limpar == true) {
    clear();
    tempo = 0;
  }
}

void simulador(float ang, float tempo, float velocidade) {
  float vVert = velocidade * sin(radians(ang));
  float vHor = velocidade * cos(radians(ang));
  float grav = -10;
  float posHor;
  float posVert;
  posHor = vHor* tempo;
  posVert = (vVert * tempo) + grav * tempo * tempo/2.0;
  bola(posHor, height-posVert, 5);
  tempo+=0.016;
}
void bola(float x, float y, float r) {
  ellipse(x, y, r*2, r*2);
}
void mostraMundo() {
  for (int i = 0; i <width; i++) {
    line(i*50, 0, i*50, height);
    line(0, i*50, width, i*50);
  }
}
float MRU(float v, float t) {
  float s;
  s = v*t;
  return s;
}
