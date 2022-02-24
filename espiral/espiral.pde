float ang = 0;
float raio=0;
float cresceRaio=0.1;
void setup() {
  size(600, 600);
  colorMode(HSB,360,100,100);
}
float a=0;
void draw() {
  background(150);
  fill(0);
  criaEspiral(5000);
}
void criaEspiral(int T) {
  noStroke();
  pushMatrix();
  translate(width/2, height/2);
  rotate((PI*2/360)*-a);
  for (int i=0; i<T; i++) {
    fill(i%360,100,100);
    ellipse(polarX(raio, i), polarY(raio, i), 5, 5);
    fill(0);
    raio+=cresceRaio;
  }
raio=0;
  a+=5;
  popMatrix();
}
float polarX(float R, float ang) {
  return R * cos(radians(ang));
}
float polarY(float R, float ang) {
  return R * sin(radians(ang));
}